SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [etl].[Load_FactOdetEvents]
(
	@BatchId UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(max) = NULL
)

AS
/*   CHANGE LOG
2018-05-04	KNELSON:	Per the client's request added logic to set DimDateID to the min payment date for the corresponding purchase in TK_Trans if
						that date is earlier than the date on TK_Odet.
*/

BEGIN



DECLARE @RunTime datetime = GETDATE()


SELECT trans.CUSTOMER, trans.SEASON, trans.[EVENT], trans.E_ITEM, MIN(trans.[DATE]) MinPaymentDate
INTO #MinPaymentDate
FROM dbo.TK_TRANS_ITEM_EVENT trans (NOLOCK)
GROUP BY trans.CUSTOMER, trans.SEASON, trans.[EVENT], trans.E_ITEM


INSERT INTO stg.FactOdet
( 
	ETL__SourceSystem, ETL__CreatedBy, ETL__CreatedDate, ETL__UpdatedDate, ETL__DeltaHashKey
	, DimDateId, DimTimeId, DimTicketCustomerId, DimArenaId,
	DimSeasonId, DimItemId, DimEventId, DimPlanId, DimPriceLevelId, DimPriceTypeId, /*DimPriceCodeId,*/ DimSeatId_Start, DimRepId, DimSalesCodeId, DimPromoId,
	DimPlanTypeId, DimTicketTypeId, DimSeatTypeId, DimTicketClassId, DimTicketClassId2, DimTicketClassId3, DimTicketClassId4, DimTicketClassId5, QtySeat,
	/*OrderRevenue, OrderConvenienceFee, OrderFee,*/ TotalRevenue, MinPaymentDate, PaidAmount, OwedAmount, FullPrice, Discount, IsSold, IsPremium, IsDiscount, IsComp, IsHost,
	IsPlan, IsPartial, IsSingleEvent, IsGroup, IsBroker, IsRenewal, IsExpanded, InRefSource, InRefData 
)

SELECT 
'PAC' ETL__SourceSystem
, SUSER_NAME() ETL__CreatedBy
, @RunTime ETL__CreatedDate
, @RunTime ETL__UpdatedDate
, NULL ETL__DeltaHashKey
, CASE WHEN a.I_DATE IS NULL AND mp.MinPaymentDate IS NULL THEN 0
	WHEN mp.MinPaymentDate IS NOT NULL THEN CONVERT(NVARCHAR(8), mp.MinPaymentDate, 112)
	ELSE CONVERT(NVARCHAR(8), a.I_DATE, 112)
	END DimDateId
, CASE WHEN a.ORIGTS_DATETIME IS NULL THEN 0 ELSE datediff(second, cast(a.ORIGTS_DATETIME as date), a.ORIGTS_DATETIME) END DimTimeId

, ISNULL(dtc.DimTicketCustomerId, -1) DimTicketCustomerId
, ISNULL(da.DimArenaId, -1) DimArenaId
, ISNULL(ds.DimSeasonId, -1)  DimSeasonId
, ISNULL(di.DimItemId, -1)  DimItemId
, ISNULL(de.DimEventId, -1)  DimEventId
, CASE WHEN ISNULL(a.ITEM,'') = ISNULL(a.[EVENT],'') THEN 0 ELSE ISNULL(dplan.DimPlanId, -1) END DimPlanId
, ISNULL(dpl.DimPriceLevelId, -1) DimPriceLevelId
, ISNULL(dpt.DimPriceTypeId, -1)  DimPriceTypeId

--, -1 DimPriceCodeId
, ISNULL(dst.DimSeatId,-1) DimSeatId_Start
, ISNULL(dr.DimRepID, -1) DimRepId
, ISNULL(dsc.DimSalesCodeId, -1) DimSalesCodeId
, ISNULL(dp.DimPromoId, -1) DimPromoId
, -1 DimPlanTypeId
, -1 DimTicketTypeId
, -1 DimSeatTypeId
, -1 DimTicketClassId
, -1 DimTicketClassId2
, -1 DimTicketClassId3
, -1 DimTicketClassId4
, -1 DimTicketClassId5

, a.QtySeat QtySeat
--, a.OrderRevenue
--, a.OrderConvenienceFee 
--, a.OrderFee
, a.TotalRevenue TotalRevenue
, NULL MinPaymentDate
, a.PaidAmount
, a.OwedAmount
, a.FullPrice
, a.Discount

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

, a.INREFSOURCE InRefSource
, a.INREFDATA InRefData
--SELECT *
FROM etl.OdetEventBase (NOLOCK) a
LEFT OUTER JOIN #MinPaymentDate mp (NOLOCK)
	ON a.CUSTOMER = mp.CUSTOMER
	AND a.SEASON = mp.SEASON
	AND a.[EVENT] = mp.[EVENT]
	AND a.ITEM = mp.E_ITEM
	AND ISNULL(a.I_DATE, '1900-01-01') > ISNULL(mp.MinPaymentDate, '1900-01-01')
LEFT OUTER JOIN dbo.DimSeason (NOLOCK) ds ON a.SEASON = ds.ETL__SSID_SEASON AND ds.ETL__EndDate IS NULL
LEFT OUTER JOIN dbo.DimTicketCustomer (NOLOCK) dtc ON a.CUSTOMER = dtc.ETL__SSID_PATRON AND dtc.ETL__EndDate IS NULL
LEFT OUTER JOIN dbo.DimItem (NOLOCK) di ON a.SEASON = di.ETL__SSID_SEASON and a.ITEM = di.ETL__SSID_ITEM AND di.ETL__EndDate IS NULL
LEFT OUTER JOIN dbo.DimEvent (NOLOCK) de ON a.SEASON = de.ETL__SSID_SEASON and a.[EVENT] = de.ETL__SSID_EVENT AND de.ETL__EndDate IS NULL
LEFT OUTER JOIN dbo.DimPlan (NOLOCK) dplan ON a.SEASON = dplan.ETL__SSID_SEASON AND a.[ITEM] = dplan.ETL__SSID_ITEM AND dplan.ETL__EndDate IS NULL
LEFT OUTER JOIN dbo.DimArena (NOLOCK) da ON de.Arena COLLATE SQL_Latin1_General_CP1_CS_AS = da.ETL__SSID_FACILITY AND da.ETL__EndDate IS NULL
LEFT OUTER JOIN dbo.DimPriceLevel (NOLOCK) dpl ON a.SEASON = dpl.ETL__SSID_SEASON AND a.PTABLE = dpl.ETL__SSID_PTable AND a.[E_PL] = dpl.ETL__SSID_PL AND dpl.ETL__EndDate IS NULL
LEFT OUTER JOIN dbo.DimPriceType (NOLOCK) dpt ON a.SEASON = dpt.ETL__SSID_SEASON and a.I_PT = dpt.ETL__SSID_PRTYPE AND dpt.ETL__EndDate IS NULL
LEFT OUTER JOIN dbo.DimSalesCode (NOLOCK) dsc ON a.ORIG_SALECODE = dsc.ETL__SSID_SALECODE
LEFT OUTER JOIN dbo.DimRep (NOLOCK) dr ON a.I_MARK = dr.ETL__SSID_MARK
LEFT OUTER JOIN dbo.DimPromo (NOLOCK) dp ON a.PROMO = dp.ETL__SSID_Promo
LEFT OUTER JOIN dbo.DimSeat (NOLOCK) dst
	ON CONCAT(a.SEASON COLLATE SQL_Latin1_General_CP1_CS_AS,':', LEFT(a.E_SBLS_1 COLLATE SQL_Latin1_General_CP1_CS_AS,(CHARINDEX(',',a.E_SBLS_1 COLLATE SQL_Latin1_General_CP1_CS_AS) - 1))) = dst.ETL__SSID COLLATE SQL_Latin1_General_CP1_CS_AS

END






GO
