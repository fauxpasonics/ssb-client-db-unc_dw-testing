SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [sascdmp].[usp_Em_Responses] as 
/*
This process assumes that the incremental email response data from Marketing cloud is loaded to the "staging table" named below:
	- stg_emclicks, stg_emopens, stg_embounces, stg_emnotsent, stgemunsbus, stg_emxref
Any duplicates in these tables are also eliminated, prior to this process.

The data from the above staging tables is loaded to the EM_RESPONSE_TABLE/EM_SEND_URL and EMXREF tables.  The SQL/start time and row counts (when applicable)
 are written to a table (etllogger) for later view.

The emxref table is a lookup table to map the "sendid" (aka jobid) from Marketing Cloud to the corresponding "response_tracking_cd".  
We also retrieve and map the key to the ci_cell_package table, to enable identifying the original campaign in SAS-MA.  Since emxref is a
lookup table, and is referenced in subsequently data loads, it is loaded first to the database.

Data from the staging tables, is "merged" with the EM_RESPONSE_HISTORY, and only "new" rows are added to the table.

Note:
1.  Only response data that corresponds with campaigns created in CI Studio are loaded.  Other responses are not loaded to database.

Modification History
7/19/2017   Capture/Store all clicks as long as they occur at a different time
            Set em_sendurlid to non-null, and setting its value to zero when not applicable.
			Primary key constraint on em_response_history changed to em_sendid/ssb_crmsystem_contact_id/response_dttm/event_type/em_sendurlid

*/
set nocount on;
declare @schema as nvarchar(12) = 'sascdmp';
declare @stg_table as nvarchar(max)
declare @em_table as nvarchar(50)
declare @emxref   as nvarchar(50)
declare @sqltext as nvarchar(max)
declare @response_history_columns as varchar(1024) =
	'em_sendid, em_subscriberid, response_dttm, response_dt, ssb_crmsystem_contact_id, response_tracking_cd, eventtype, cell_package_sk, load_date, em_sendurlid, response_reason, response_category';
declare @stg_columns_for_insert as varchar(1024) =
	'stg.sendid, stg.subscriberid, stg.eventdate, stg.eventdate, stg.subscriberkey, stg.response_tracking_cd, stg.eventtype, stg.cell_package_sk, getdate(),';
/* 
The following tables/variables are just for audit/error logging.
*/
declare @rowkount as int;
declare @tablename as nvarchar(50);
declare @etllogger as nvarchar(50) = @schema + '.etllogger'
if object_id(@etllogger, 'u') is null
begin;
	set @sqltext = ' create table ' + @schema + '.etllogger' +
	'(   logDate datetime, tableName varchar(50), logSQL varchar(max), logRows int, errKode int, errMessage varchar(max) ) '
	exec (@sqltext);
end;
declare @loggerSQL as nvarchar(max) = 'insert into '  + @etllogger + ' (logDate, tableName, logSQL, logRows, errKode, errMessage) ' +
					' select getdate(), @tablename, @sqltext, @rowkount, @@ERROR, ERROR_MESSAGE() ';
declare @parmDefinition as nvarchar(256) = N'@tablename nvarchar(50), @sqltext nvarchar(max), @rowkount int';
/*
The emxref table is loaded here....If the table does not exist, it is created here and loaded from the stg_emxref table
*/
set @emxref = @schema + '.emxref'
set @em_table =  @schema + '.emxref'
set @stg_table = 'select s1.*, cp.cell_package_sk ' +
				 '  from ' + @schema + '.stg_emxref s1 ' +
				 '  inner join ' + @schema + '.ci_cell_package cp ' +
				 '     on cp.response_tracking_cd = s1.response_tracking_cd '
begin try
	if object_id(@em_table, 'u') is null
	begin;
		set @sqltext =
				'select stg.*, getdate() as load_date ' +
				' into ' + @em_table +
				' from (' + @stg_table + ') stg'
		exec sp_executesql @sqltext
		set @rowkount = @@ROWCOUNT
	end;
	else begin;
		set @sqltext = 'merge into ' + @em_table + ' as perm ' +
					   ' using (' + @stg_table + ') as stg ' +
					   '    on ' + 'stg.response_tracking_cd = perm.response_tracking_cd and stg.subscriberkey = perm.subscriberkey ' +
					   '   when not matched then '  +
					   '        insert (sendid, response_tracking_cd, subscriberkey, emailaddress, cell_package_sk, sentdate, load_date) ' +
					   '         values(stg.sendid, stg.response_tracking_cd, stg.subscriberkey, stg.emailaddress, stg.cell_package_sk, stg.sentdate, getdate()); '
		exec sp_executesql @sqltext
		set @rowkount = @@ROWCOUNT
	end;
end try
begin catch
	exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, 0
	raiserror('LoadResponse process terminated with errors', 12, 1)
	goto StopProcess
end catch
exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, @rowkount
	 

/******************************************************************************************************************/
/*  Clicks from the email campaign are loaded here                                                                */
/*  The URL information from the clicks is loaded to em_send_url, and the rest is loaded to em_response_history   */
/******************************************************************************************************************/
set @em_table =  @schema + '.em_send_url'
set @stg_table = 'select s1.sendurlid, s1.urlid, max(case when url is null then '' '' else url end) as url, max(case when alias is null then '' '' else alias end) as alias ' +
				 '  from ' + @schema + '.stg_emclicks s1 ' +
				 ' group by s1.sendurlid, s1.urlid ' 
begin try
	set @sqltext = 'merge into ' + @em_table + ' as perm ' +
					' using (' + @stg_table + ') as stg ' +
					'    on ' + 'stg.sendurlid = perm.em_sendurlid ' +
					'   when not matched then '  +
					'        insert (em_sendurlid, urlid, alias, url) ' +
					'         values(stg.sendurlid, stg.urlid, stg.alias, stg.url); '
	exec sp_executesql @sqltext
	set @rowkount = @@ROWCOUNT
end try
begin catch
	exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, 0
	raiserror('LoadResponse process terminated with errors', 12, 1)
	goto StopProcess
end catch
exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, @rowkount

set @em_table =  @schema + '.em_response_history'
set @stg_table = 'select s1.*, xref.response_tracking_cd, xref.cell_package_sk ' +
				 '  from ' + @schema + '.stg_emclicks s1 ' +
				 '  inner join ' + @schema + '.emxref xref ' +
				 '     on xref.sendid = s1.sendid and xref.subscriberkey = s1.subscriberkey '

begin try
	set @sqltext = 'merge into ' + @em_table + ' as perm ' +
					' using (' + @stg_table + ') as stg ' +
					'    on ' + 'stg.sendid = perm.em_sendid and stg.subscriberkey = perm.ssb_crmsystem_contact_id and stg.eventdate = perm.response_dttm ' +
					'   when not matched then '  +
					'        insert ( ' + @response_history_columns  + ') ' +
					'         values( ' + @stg_columns_for_insert +  ' stg.sendurlid, null, null); '
	exec sp_executesql @sqltext
	set @rowkount = @@ROWCOUNT
end try
begin catch
	exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, 0
	raiserror('LoadResponse process terminated with errors', 12, 1)
	goto StopProcess
end catch
exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, @rowkount

/******************************************************************************************************************/
/*  "Sent" from the email campaign are loaded here                                                                */
/******************************************************************************************************************/

set @em_table =  @schema + '.em_response_history'
set @stg_table = 'select s1.*, xref.response_tracking_cd, xref.cell_package_sk ' +
				 '  from ' + @schema + '.stg_emsent s1 ' +
				 '  inner join ' + @schema + '.emxref xref ' +
				 '     on xref.sendid = s1.sendid and xref.subscriberkey = s1.subscriberkey '

begin try
	set @sqltext = 'merge into ' + @em_table + ' as perm ' +
					' using (' + @stg_table + ') as stg ' +
					'    on ' + 'stg.response_tracking_cd = perm.response_tracking_cd and stg.subscriberkey = perm.ssb_crmsystem_contact_id and stg.eventtype = perm.eventtype and stg.eventdate = perm.response_dttm ' +
					'   when not matched then '  +
					'        insert ( ' + @response_history_columns  + ') ' +
					'         values( ' + @stg_columns_for_insert +  ' 0, null, null); '
	exec sp_executesql @sqltext
	set @rowkount = @@ROWCOUNT
end try
begin catch
	exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, 0
	raiserror('LoadResponse process terminated with errors', 12, 1)
	goto StopProcess
end catch
exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, @rowkount

/******************************************************************************************************************/
/*  Conversions from the email campaign are loaded here                                                           */
/******************************************************************************************************************/

set @em_table =  @schema + '.em_response_history'
set @stg_table = 'select s1.*, xref.response_tracking_cd, xref.cell_package_sk ' +
				 '  from ' + @schema + '.stg_emconversions s1 ' +
				 '  inner join ' + @schema + '.emxref xref ' +
				 '     on xref.sendid = s1.sendid and xref.subscriberkey = s1.subscriberkey '

begin try
	set @sqltext = 'merge into ' + @em_table + ' as perm ' +
					' using (' + @stg_table + ') as stg ' +
					'    on ' + 'stg.response_tracking_cd = perm.response_tracking_cd and stg.subscriberkey = perm.ssb_crmsystem_contact_id and stg.eventtype = perm.eventtype and stg.eventdate = perm.response_dttm ' +
					'   when not matched then '  +
					'        insert ( ' + @response_history_columns  + ') ' +
					'         values( ' + @stg_columns_for_insert +  ' 0, null, null); '
	exec sp_executesql @sqltext
	set @rowkount = @@ROWCOUNT
end try
begin catch
	exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, 0
	raiserror('LoadResponse process terminated with errors', 12, 1)
	goto StopProcess
end catch
exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, @rowkount


/******************************************************************************************************************/
/*  Opens from the email campaign are loaded here                                                                 */
/******************************************************************************************************************/
set @em_table =  @schema + '.em_response_history'
set @stg_table = 'select s1.*, xref.response_tracking_cd, xref.cell_package_sk ' +
				 '  from ' + @schema + '.stg_emopens s1 ' +
				 '  inner join ' + @schema + '.emxref xref ' +
				 '     on xref.sendid = s1.sendid and xref.subscriberkey = s1.subscriberkey '

begin try
	set @sqltext = 'merge into ' + @em_table + ' as perm ' +
					' using (' + @stg_table + ') as stg ' +
					'    on ' + 'stg.response_tracking_cd = perm.response_tracking_cd and stg.subscriberkey = perm.ssb_crmsystem_contact_id and stg.eventtype = perm.eventtype' +
					'   when not matched then '  +
					'        insert ( ' + @response_history_columns  + ') ' +
					'         values( ' + @stg_columns_for_insert +  ' 0, null, null); '
	exec sp_executesql @sqltext
	set @rowkount = @@ROWCOUNT
end try
begin catch
	exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, 0
	raiserror('LoadResponse process terminated with errors', 12, 1)
	goto StopProcess
end catch
exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, @rowkount

/******************************************************************************************************************/
/* Unsubscribes: Data from stg_emunsubs is loaded to em_response_history                                          */
/******************************************************************************************************************/
set @em_table =  @schema + '.em_response_history'
set @stg_table = 'select s1.*, xref.response_tracking_cd, xref.cell_package_sk ' +
				 '  from ' + @schema + '.stg_emunsubs s1 ' +
				 '  inner join ' + @schema + '.emxref xref ' +
				 '     on xref.sendid = s1.sendid and xref.subscriberkey = s1.subscriberkey '

begin try
	set @sqltext = 'merge into ' + @em_table + ' as perm ' +
					' using (' + @stg_table + ') as stg ' +
					'    on ' + 'stg.response_tracking_cd = perm.response_tracking_cd and stg.subscriberkey = perm.ssb_crmsystem_contact_id and stg.eventtype = perm.eventtype' +
					'   when not matched then '  +
					'        insert ( ' + @response_history_columns  + ') ' +
					'         values( ' + @stg_columns_for_insert +  ' 0, stg.unsubreason, null); '
	exec sp_executesql @sqltext
	set @rowkount = @@ROWCOUNT
end try
begin catch
	exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, 0
	raiserror('LoadResponse process terminated with errors', 12, 1)
	goto StopProcess
end catch
exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, @rowkount


/******************************************************************************************************************/
/*  Bounces from the email campaign are loaded here                                                               */
/******************************************************************************************************************/
  set @stg_table = 'select s1.*, xref.response_tracking_cd, xref.cell_package_sk ' +
				 '  from ' + @schema + '.stg_embounces s1 ' +
				 '  inner join ' + @schema + '.emxref xref ' +
				 '     on xref.sendid = s1.sendid and xref.subscriberkey = s1.subscriberkey '

begin try
	set @sqltext = 'merge into ' + @em_table + ' as perm ' +
					' using (' + @stg_table + ') as stg ' +
					'    on ' + 'stg.response_tracking_cd = perm.response_tracking_cd and stg.subscriberkey = perm.ssb_crmsystem_contact_id and stg.eventtype = perm.eventtype' +
					'   when not matched then '  +
					'        insert ( ' + @response_history_columns  + ') ' +
					'         values( ' + @stg_columns_for_insert +  ' 0, stg.bouncereason, stg.bouncecategory); '
	exec sp_executesql @sqltext
	set @rowkount = @@ROWCOUNT
end try
begin catch
	exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, 0
	raiserror('LoadResponse process terminated with errors', 12, 1)
	goto StopProcess
end catch
exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, @rowkount


/******************************************************************************************************************/
/*  NotSent from the email campaign are loaded here                                                               */
/******************************************************************************************************************/
  set @stg_table = 'select s1.*, xref.response_tracking_cd, xref.cell_package_sk ' +
				 '  from ' + @schema + '.stg_emnotsent s1 ' +
				 '  inner join ' + @schema + '.emxref xref ' +
				 '     on xref.sendid = s1.sendid and xref.subscriberkey = s1.subscriberkey '

begin try
	set @sqltext = 'merge into ' + @em_table + ' as perm ' +
					' using (' + @stg_table + ') as stg ' +
					'    on ' + 'stg.response_tracking_cd = perm.response_tracking_cd and stg.subscriberkey = perm.ssb_crmsystem_contact_id and stg.eventtype = perm.eventtype' +
					'   when not matched then '  +
					'        insert ( ' + @response_history_columns  + ') ' +
					'         values( ' + @stg_columns_for_insert +  ' 0, stg.reason, null); '
	exec sp_executesql @sqltext
	set @rowkount = @@ROWCOUNT
end try
begin catch
	exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, 0
	raiserror('LoadResponse process terminated with errors', 12, 1)
	goto StopProcess
end catch
exec sp_executesql @loggerSQL, @parmDefinition, @em_table, @sqltext, @rowkount

StopProcess:
GO
