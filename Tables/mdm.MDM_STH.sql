CREATE TABLE [mdm].[MDM_STH]
(
[DimCustomerID] [int] NOT NULL,
[STH] [int] NULL,
[MPH] [int] NULL,
[SG] [int] NULL,
[MaxTransDate] [date] NULL,
[AccountID] [int] NULL
)
GO
CREATE CLUSTERED INDEX [ix_MDM_STH] ON [mdm].[MDM_STH] ([DimCustomerID])
GO
