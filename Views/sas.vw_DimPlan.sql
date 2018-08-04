SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimPlan]
AS
SELECT DimPlanID,
	ETL__SSID,
	ETL__SSID_SEASON,
	ETL__SSID_ITEM,
	PlanCode,
	PlanName,
	PlanDesc,
	PlanClass,
	Season,
	PlanFSE,
	PlanType,
	PlanEventCnt,
	Config_PlanTicketType,
	Config_PlanName,
	Config_PlanRenewableFSE
FROM dbo.DimPlan with (nolock) 
GO
