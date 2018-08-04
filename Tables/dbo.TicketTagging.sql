CREATE TABLE [dbo].[TicketTagging]
(
[Season] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceType] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriceLevel] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DimTicketTypeID] [int] NULL,
[DimPlanTypeID] [int] NULL,
[DimTicketClassID] [int] NULL,
[IsComp] [bit] NULL,
[IsPlan] [bit] NULL,
[IsPartial] [bit] NULL,
[IsSingleEvent] [bit] NULL,
[IsGroup] [bit] NULL,
[TicketTypeCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketTypeName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanTypeCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanTypeName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketClassCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketClassName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketClass] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20171102-182336] ON [dbo].[TicketTagging] ([Item], [PriceType], [PriceLevel])
GO
