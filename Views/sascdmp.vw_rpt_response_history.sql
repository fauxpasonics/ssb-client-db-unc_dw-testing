SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE view [sascdmp].[vw_rpt_response_history] as
	select rh.*
	    ,case 
			when rh.response_dt is null then 0
			else 1
		 end as IsResponse
	    ,datediff(yy, rh.BirthDay, rh.sent_dt)
        - case when month(rh.BirthDay) > month(rh.sent_dt) or (month(rh.BirthDay) = month(rh.sent_dt) and day(rh.BirthDay) > day(rh.sent_dt))
				then 1
				else 0
			end  as Age
	  from sascdmp.rpt_response_history rh
GO
