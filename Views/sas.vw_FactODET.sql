SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_FactODET]
--WITH SCHEMABINDING
AS
SELECT  FactOdetId
		ETL__UpdatedDate ,
		DimDateId ,
          DimTimeId ,
          DimTicketCustomerId ,
          DimArenaId ,
          DimSeasonId ,
          DimItemId ,
          DimEventId ,
          DimPlanId ,
          DimPriceLevelId ,
          DimPriceTypeId ,
          DimSeatId_Start ,
          DimRepId ,
          DimSalesCodeId ,
          DimPromoId ,
          DimPlanTypeId ,
          DimTicketTypeId ,
          DimSeatTypeId ,
          DimTicketClassId ,
          DimTicketClassId2 ,
          DimTicketClassId3 ,
          DimTicketClassId4 ,
          DimTicketClassId5 ,
          QtySeat ,
          TotalRevenue ,
          MinPaymentDate ,
          PaidAmount ,
          OwedAmount ,
          FullPrice ,
          Discount ,
          IsSold ,
          IsPremium ,
          IsDiscount ,
          IsComp ,
          IsHost ,
          IsPlan ,
          IsPartial ,
          IsSingleEvent ,
          IsGroup ,
          IsBroker ,
          IsRenewal ,
          IsExpanded ,
          InRefSource ,
          InRefData
FROM    dbo.FactOdet (NOLOCK);    

GO
