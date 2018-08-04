CREATE TABLE [stg].[BB_RevenueSummary]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Revenu__ETL_C__124119A8] DEFAULT (getdate()),
[CONSTITUENTID] [uniqueidentifier] NULL,
[FY] [int] NULL,
[SITEID] [uniqueidentifier] NULL,
[SITENUMBER] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMOUNT] [money] NULL,
[HOUSEHOLDAMOUNT] [money] NULL,
[ALLTIMEAMOUNT] [money] NULL,
[ALLTIMEHOUSEHOLDAMOUNT] [money] NULL
)
GO
