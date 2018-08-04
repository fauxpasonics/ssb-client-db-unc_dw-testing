SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [sascdmp].[vw_rpt_contact_history] as
	select ssb_crmsystem_contact_id
	        ,cp.response_tracking_cd
			,rsp.response_dt as sent_date
			,cp.marketing_cell_nm
			,cp.campaign_cd
			,cp.campaign_nm
			,ce.campaign_bus_owner
			,ce.campaign_start_dt
			,isnull(ce.campaign_end_dt, dateadd(day,30,rsp.response_dt)) campaign_end_dt
			,cp.channel_cd
			,cp.control_group_type_cd
		from sascdmp.vw_em_response_history rsp
			inner join sascdmp.ci_cell_package cp
			on cp.cell_package_sk = rsp.cell_package_sk
			inner join sascdmp.ci_campaign_ext ce
			on ce.campaign_sk = cp.campaign_sk
		where rsp.eventtype = 'sent'
GO
