SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE VIEW [sas].[vw_rpt_TicketSales_v2]
AS

SELECT cr.SSB_CRMSYSTEM_CONTACT_ID
	, cr.FirstName
	, cr.LastName
	, cr.AddressPrimaryState
	, cr.AddressPrimaryZip
	, CASE WHEN ds.Activity = 'BB' THEN 'Baseball'
		WHEN ds.Activity = 'FB' THEN 'Football'
		WHEN ds.Activity = 'FH' THEN 'Field Hockey'
		WHEN ds.Activity = 'KC' THEN 'Kids Club'
		WHEN ds.Activity = 'MB' THEN 'Men''s Basketball'
		WHEN ds.Activity = 'ML' THEN 'Men''s Lacrosse'
		WHEN ds.Activity = 'MS' THEN 'Men''s Soccer'
		WHEN ds.Activity = 'MT' THEN 'Men''s Tennis'
		WHEN ds.Activity = 'SB' THEN 'Softball'
		WHEN ds.Activity = 'SE' THEN 'Special Event'
		WHEN ds.Activity = 'VB' THEN 'Volleyball'
		WHEN ds.Activity = 'WB' THEN 'Women''s Basketball'
		WHEN ds.Activity = 'WL' THEN 'Women''s Lacrosse'
		WHEN ds.Activity = 'WR' THEN 'Wrestling'
		WHEN ds.Activity = 'WS' THEN 'Women''s Soccer'
		WHEN ds.Activity = 'WT' THEN 'Women''s Tennis'
		END AS Sport
	, CASE WHEN RIGHT(ds.SeasonCode,2) LIKE '7%' THEN CAST(CONCAT('19',RIGHT(ds.SeasonCode,2)) AS INT)
		ELSE CAST(CONCAT('20',RIGHT(ds.SeasonCode,2)) AS INT)
		END AS SeasonYear
	, ds.SeasonCode
	, ds.SeasonName
	, de.EventCode
	, CAST(de.EventName AS NVARCHAR(100)) EventName
	, di.ItemCode
	, CAST(di.ItemName AS NVARCHAR(100)) ItemName
	, dp.PlanCode
	, dp.PlanName
	, dpt.PriceTypeCode
	, CAST(dpt.PriceTypeName AS NVARCHAR(100)) PriceTypeName
	, fts.QtySeat
	, dpl.PriceLevelCode
	, dpl.PriceLevelName
	, tt.TicketTypeName
	, pt.PlanTypeName
	, tc.TicketClassName
	, tc.TicketClass TicketClassType
	, fts.TotalRevenue
	, (fts.TotalRevenue/fts.QtySeat) TicketPrice
	, fts.MinPaymentDate OrderDate
	, dpr.PromoCode
	, CAST(dpr.PromoName AS NVARCHAR(100)) PromoName
	, dr.ETL__SSID_MARK RepCode
	, CAST(dr.FullName AS NVARCHAR(100)) RepName
	, dsc.SalesCode
	, dsc.SalesCodeName
FROM dbo.FactTicketSales_Test fts (NOLOCK)
LEFT JOIN dbo.DimTicketCustomer dtc (NOLOCK) ON fts.DimTicketCustomerID = dtc.DimTicketCustomerID
LEFT JOIN dbo.DimCustomer dc (NOLOCK) ON dtc.ETL__SSID = dc.SSID AND dtc.ETL__SourceSystem = dc.SourceSystem
LEFT JOIN dbo.DimCustomerSSBID ssbid (NOLOCK) ON dc.DimCustomerID = ssbid.DimCustomerID
LEFT JOIN mdm.CompositeRecord cr (NOLOCK) ON ssbid.SSB_CRMSYSTEM_CONTACT_ID = cr.SSB_CRMSYSTEM_CONTACT_ID
LEFT JOIN dbo.DimSeason ds (NOLOCK) ON fts.DimSeasonID = ds.DimSeasonID
LEFT JOIN dbo.DimEvent de (NOLOCK) ON fts.DimEventID = de.DimEventID
LEFT JOIN dbo.DimItem di (NOLOCK) ON fts.DimItemID = di.DimItemID
LEFT JOIN dbo.DimPlan dp (NOLOCK) ON fts.DimPlanID = dp.DimPlanID
LEFT JOIN dbo.DimPriceType dpt (NOLOCK) ON fts.DimPriceTypeID = dpt.DimPriceTypeID
LEFT JOIN dbo.DimPriceLevel dpl (NOLOCK) ON fts.DimPriceLevelID = dpl.DimPriceLevelID
LEFT JOIN dbo.DimTicketType tt (NOLOCK) ON fts.DimTicketTypeID = tt.DimTicketTypeID
LEFT JOIN dbo.DimPlanType pt (NOLOCK) ON fts.DimPlanTypeID = pt.DimPlanTypeID
LEFT JOIN dbo.DimTicketClass tc (NOLOCK) ON fts.DimTicketClassID = tc.DimTicketClassID
LEFT JOIN dbo.DimRep dr (NOLOCK) ON fts.DimRepId = dr.DimRepId
LEFT JOIN dbo.DimSalesCode dsc (NOLOCK) ON fts.DimSalesCodeId = dsc.DimSalesCodeId
LEFT JOIN dbo.DimPromo dpr (NOLOCK) ON fts.DimPromoId = dpr.DimPromoId
























GO
