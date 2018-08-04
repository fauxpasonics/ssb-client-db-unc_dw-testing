CREATE TABLE [dbo].[FactTicketSales_Test]
(
[FactTicketSalesId] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FactTicke__ETL____53A33203_Test] DEFAULT (suser_name()),
[ETL__CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__FactTicke__ETL____5497563C_Test] DEFAULT (getdate()),
[ETL__UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__FactTicke__ETL____558B7A75_Test] DEFAULT (getdate()),
[DimDateId] [int] NOT NULL,
[DimTimeId] [int] NOT NULL,
[DimTicketCustomerId] [bigint] NOT NULL,
[DimArenaId] [int] NOT NULL,
[DimSeasonId] [int] NOT NULL,
[DimItemId] [int] NOT NULL,
[DimEventId] [int] NOT NULL,
[DimPlanId] [int] NOT NULL,
[DimPriceLevelId] [int] NOT NULL,
[DimPriceTypeId] [int] NOT NULL,
[DimPriceCodeId] [int] NOT NULL,
[DimSeatId_Start] [int] NOT NULL,
[DimRepId] [int] NOT NULL,
[DimSalesCodeId] [int] NOT NULL,
[DimPromoId] [int] NOT NULL,
[DimPlanTypeId] [int] NOT NULL,
[DimTicketTypeId] [int] NOT NULL,
[DimSeatTypeId] [int] NOT NULL,
[DimTicketClassId] [int] NOT NULL,
[DimTicketClassId2] [int] NOT NULL,
[DimTicketClassId3] [int] NOT NULL,
[DimTicketClassId4] [int] NOT NULL,
[DimTicketClassId5] [int] NOT NULL,
[QtySeat] [int] NOT NULL,
[TotalRevenue] [decimal] (18, 6) NOT NULL,
[MinPaymentDate] [datetime] NULL,
[PaidAmount] [decimal] (18, 6) NOT NULL,
[OwedAmount] [decimal] (18, 6) NOT NULL,
[FullPrice] [decimal] (18, 6) NOT NULL,
[Discount] [decimal] (18, 6) NOT NULL,
[IsSold] [bit] NOT NULL,
[IsPremium] [bit] NOT NULL,
[IsDiscount] [bit] NOT NULL,
[IsComp] [int] NOT NULL,
[IsHost] [bit] NOT NULL,
[IsPlan] [bit] NOT NULL,
[IsPartial] [bit] NOT NULL,
[IsSingleEvent] [bit] NOT NULL,
[IsGroup] [bit] NOT NULL,
[IsBroker] [bit] NOT NULL,
[IsRenewal] [bit] NOT NULL,
[IsExpanded] [bit] NOT NULL
)
GO
