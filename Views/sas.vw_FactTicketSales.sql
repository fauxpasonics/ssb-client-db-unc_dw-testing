SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_FactTicketSales]
AS
SELECT FactTicketSalesId,
	DimDateID,
	DimTimeID,
	DimTicketCustomerID,
	DimArenaID,
	DimSeasonID,
	DimItemID,
	DimEventID,
	DimPlanID,
	DimPriceLevelID,
	DimPriceTypeID,
	DimSeatID_Start,
	DimRepID,
	DimSalesCodeId,
	DimPromoId,
	DimPlanTypeId,
	DimTicketTypeId,
	DimSeatTypeID,
	DimTicketClassID,
	QtySeat,
	TotalRevenue,
	MinPaymentDate,
	PaidAmount,
	OwedAmount,
	FullPrice,
	Discount,
	CAST(IsSold AS INT) AS IsSold,
	CAST(IsPremium AS INT) AS IsPremium,
	CAST(IsDiscount AS INT) AS IsDiscount,
	CAST(IsComp AS INT) AS IsComp,
	CAST(IsHost AS INT) AS IsHost,
	CAST(IsPlan AS INT) AS IsPlan,
	CAST(IsPartial AS INT) AS IsPartial,
	CAST(IsSingleEvent AS INT) AS IsSingleEvent,
	CAST(IsGroup AS INT) AS IsGroup,
	CAST(IsBroker AS INT) AS IsBroker,
	CAST(IsRenewal AS INT) AS IsRenewal,
	CAST(IsExpanded AS INT) AS IsExpanded
FROM dbo.FactTicketSales with (nolock) 
GO
