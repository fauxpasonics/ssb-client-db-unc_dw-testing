SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [rpt].[MDM_RunByClient]
AS

DECLARE @command VARCHAR(1000)
create table #mdm_temp (ClientName varchar(1000),LastRunDate datetime)

SELECT @command = '
If Exists(
		Select t.* 
		from [?].information_schema.tables t
		INNER JOIN sys.sysdatabases d
			ON  t.TABLE_CATALOG = d.[name]
		WHERE table_name = ''Auditlog''
			AND table_schema = ''mdm''
			AND d.Status <> 1073808384
	)
Begin 
	Insert #mdm_temp
	Select ''?'' as clientname, max(logdate) as lastrundate from [?].mdm.auditlog WHERE mdm_process = ''create composite record''
End'
EXEC sys.sp_MSforeachdb @command


DECLARE @TwoDays DATE = (select getdate()-2)

select *,
CASE WHEN LastRunDate < @TwoDays OR LastRunDate IS NULL THEN 1 else 0 end as LastTwoDays
from #mdm_temp
GO
