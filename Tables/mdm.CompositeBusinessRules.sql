CREATE TABLE [mdm].[CompositeBusinessRules]
(
[ElementID] [int] NOT NULL,
[CriteriaID] [int] NOT NULL,
[priority] [int] NOT NULL,
[IsDeleted] [bit] NULL,
[DateCreated] [date] NULL CONSTRAINT [DF__Composite__DateC__3A81B327] DEFAULT (getdate()),
[DateUpdated] [date] NULL CONSTRAINT [DF__Composite__DateU__3B75D760] DEFAULT (getdate())
)
GO
