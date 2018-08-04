SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [etl].[Load_FactTicketSalesEvents]
(
	@BatchId UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(max) = NULL
)

AS
BEGIN

DECLARE @RunTime datetime = GETDATE()

INSERT INTO stg.FactTicketSales
( 

	ETL__SourceSystem, ETL__CreatedBy, ETL__CreatedDate, ETL__UpdatedDate
	, DimDateId, DimTimeId, DimTicketCustomerId, DimArenaId, DimSeasonId, DimItemId
	, DimEventId, DimPlanId, DimPriceLevelId, DimPriceTypeId, DimPriceCodeId, DimSeatId_Start, DimRepId, DimSalesCodeId, DimPromoId, DimPlanTypeId
	, DimTicketTypeId, DimSeatTypeId, DimTicketClassId, DimTicketClassId2, DimTicketClassId3, DimTicketClassId4, DimTicketClassId5
	, QtySeat, TotalRevenue, MinPaymentDate, PaidAmount, OwedAmount, FullPrice, Discount
	, IsSold, IsPremium, IsDiscount, IsComp, IsHost, IsPlan, IsPartial, IsSingleEvent, IsGroup, IsBroker, IsRenewal, IsExpanded

)


SELECT 
'PAC' ETL__SourceSystem
, SUSER_NAME() ETL__CreatedBy, @RunTime ETL__CreatedDate, @RunTime ETL__UpdatedDate

, CASE WHEN a.MINPAYMENTDATE IS NULL THEN 0 ELSE CONVERT(NVARCHAR(8), a.MINPAYMENTDATE, 112) END DimDateId
, CASE WHEN a.MINPAYMENTDATE IS NULL THEN 0 ELSE datediff(second, cast(a.MINPAYMENTDATE as date), a.MINPAYMENTDATE) END DimTimeId

, ISNULL(dtc.DimTicketCustomerId, -1) DimTicketCustomerId
, ISNULL(da.DimArenaId, -1) DimArenaId
, ISNULL(ds.DimSeasonId, -1)  DimSeasonId
, ISNULL(di.DimItemId, -1)  DimItemId
, ISNULL(de.DimEventId, -1)  DimEventId
, CASE WHEN ISNULL(a.ITEM,'') = ISNULL(a.[EVENT],'') THEN 0 ELSE ISNULL(dplan.DimPlanId, -1) END DimPlanId
, ISNULL(dpl.DimPriceLevelId, -1)  DimPriceLevelId
, ISNULL(dpt.DimPriceTypeId, -1)  DimPriceTypeId
, -1 DimPriceCodeId
, -1 DimSeatId_Start
, -1 DimRepId
, ISNULL(sc.DimSalesCodeId,-1) DimSalesCodeId
, -1 DimPromoId
, -1 DimPlanTypeId
, -1 DimTicketTypeId
, -1 DimSeatTypeId
, -1 DimTicketClassId
, -1 DimTicketClassId2
, -1 DimTicketClassId3
, -1 DimTicketClassId4
, -1 DimTicketClassId5

, ISNULL(a.ORDQTY,0) QtySeat
--, ISNULL(a.ORDTOTAL,0) OrderRevenue
--, ISNULL(a.OrderConvenienceFee,0) OrderConvenienceFee
--, ISNULL(a.ORDFEE,0) OrderFee
--, ( ISNULL(a.ORDTOTAL,0) + ISNULL(a.OrderConvenienceFee,0) + ISNULL(a.ORDFEE,0) ) TotalRevenue
, ( ISNULL(a.ORDTOTAL,0)) TotalRevenue
, a.MINPAYMENTDATE MinPaymentDate
, ISNULL(a.PAIDTOTAL,0) PaidAmount
, ( ISNULL(a.ORDTOTAL,0) - ISNULL(a.PAIDTOTAL,0)) OwedAmount
, ( ISNULL(a.ORDTOTAL,0) + ISNULL(a.OrderConvenienceFee,0) + ISNULL(a.ORDFEE,0) ) + ( ISNULL(a.ORDQTY,0) * ISNULL(a.E_DAMT,0) ) FullPrice
, ( ISNULL(a.ORDQTY,0) * ISNULL(a.E_DAMT,0) ) Discount

, 0 IsSold
, 0 IsPremium
, 0 IsDiscount
, 0 IsComp
, 0 IsHost
, 0 IsPlan
, 0 IsPartial
, 0 IsSingleEvent
, 0 IsGroup
, 0 IsBroker
, 0 IsRenewal
, 0 IsExpanded

FROM stg.FactTicketSalesBase (NOLOCK) a
LEFT OUTER JOIN dbo.DimSeason (NOLOCK) ds ON a.SEASON COLLATE SQL_Latin1_General_CP1_CS_AS = ds.ETL__SSID_SEASON AND ds.ETL__EndDate IS null
LEFT OUTER JOIN dbo.DimTicketCustomer (NOLOCK) dtc ON a.CUSTOMER = dtc.ETL__SSID_PATRON AND dtc.ETL__EndDate IS null
LEFT OUTER JOIN dbo.DimItem (NOLOCK) di ON a.SEASON COLLATE SQL_Latin1_General_CP1_CS_AS = di.ETL__SSID_SEASON AND a.ITEM COLLATE SQL_Latin1_General_CP1_CS_AS = di.ETL__SSID_ITEM AND di.ETL__EndDate IS null
LEFT OUTER JOIN dbo.DimEvent (NOLOCK) de ON a.SEASON COLLATE SQL_Latin1_General_CP1_CS_AS = de.ETL__SSID_SEASON AND a.[EVENT] COLLATE SQL_Latin1_General_CP1_CS_AS = de.ETL__SSID_EVENT AND de.ETL__EndDate IS null
LEFT OUTER JOIN dbo.DimPlan (NOLOCK) dplan ON a.SEASON COLLATE SQL_Latin1_General_CP1_CS_AS = dplan.ETL__SSID_SEASON AND a.[ITEM] COLLATE SQL_Latin1_General_CP1_CS_AS = dplan.ETL__SSID_ITEM AND dplan.ETL__EndDate IS null
LEFT OUTER JOIN dbo.DimArena (NOLOCK) da ON de.Arena COLLATE SQL_Latin1_General_CP1_CS_AS = da.ETL__SSID_FACILITY AND da.ETL__EndDate IS null
LEFT OUTER JOIN dbo.TK_ITEM (NOLOCK) tkItem ON a.SEASON COLLATE SQL_Latin1_General_CP1_CS_AS = tkItem.SEASON AND a.ITEM COLLATE SQL_Latin1_General_CP1_CS_AS  = tkItem.ITEM
LEFT OUTER JOIN dbo.DimPriceLevel (NOLOCK) dpl ON a.SEASON COLLATE SQL_Latin1_General_CP1_CS_AS = dpl.ETL__SSID_SEASON AND tkItem.PTABLE COLLATE SQL_Latin1_General_CP1_CS_AS = dpl.ETL__SSID_PTable AND a.[E_PL] COLLATE SQL_Latin1_General_CP1_CS_AS = dpl.ETL__SSID_PL AND dpl.ETL__EndDate IS null
LEFT OUTER JOIN dbo.DimPriceType (NOLOCK) dpt ON a.SEASON COLLATE SQL_Latin1_General_CP1_CS_AS = dpt.ETL__SSID_SEASON and a.[E_PT] COLLATE SQL_Latin1_General_CP1_CS_AS = dpt.ETL__SSID_PRTYPE AND dpt.ETL__EndDate IS null
LEFT OUTER JOIN dbo.DimSalesCode sc ON a.SALECODE = sc.SalesCode


END






GO
