SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE view [sascdm].[vw_EM_RESPONSE_HISTORY] as
select
	[em_sendid] ,
	[em_subscriberid],
	[response_dttm],
	[response_dt] ,
	[ssb_crmsystem_contact_id] ,
	[response_tracking_cd] ,
	[eventtype] ,
	[em_sendurlid],
	[cell_package_sk],
	case
	   when eventtype = 'Bounce' then response_reason
	   else null
    end as [bouncereason],
	case
	   when eventtype = 'Bounce' then response_category
	   else null
    end as  [bouncecategory],
	case
	   when eventtype = 'Unsubscribe' then response_reason
	   else null
    end as [unsubreason],
	case
	   when eventtype = 'Not Sent' then response_reason
	   else null
    end as [notsentreason],
	[load_date] 
from sascdm.em_response_history

GO
