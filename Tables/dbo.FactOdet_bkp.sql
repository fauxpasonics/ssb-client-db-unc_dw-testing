CREATE TABLE [dbo].[FactOdet_bkp]
(
[FactOdetId] [bigint] NOT NULL IDENTITY(1, 1),
[ETL__SourceSystem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__FactOdet__ETL__C__4E1E9780] DEFAULT (suser_name()),
[ETL__CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__FactOdet__ETL__C__4F12BBB9] DEFAULT (getdate()),
[ETL__UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__FactOdet__ETL__U__5006DFF2] DEFAULT (getdate()),
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
[InRefSource] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InRefData] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI__dbo_FactOdet] ON [dbo].[FactOdet_bkp]
GO
CREATE NONCLUSTERED INDEX [FactOdet] ON [dbo].[FactOdet_bkp] ([DimDateId], [DimTimeId], [DimTicketCustomerId], [DimArenaId], [DimSeasonId], [DimItemId], [DimEventId], [DimPlanId], [DimPriceLevelId], [DimPriceTypeId], [DimPlanTypeId], [DimTicketTypeId], [DimSeatTypeId], [DimTicketClassId])
GO
