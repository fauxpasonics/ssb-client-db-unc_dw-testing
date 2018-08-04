CREATE TABLE [ods].[BB_RevenueSummary_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NOT NULL,
[FY] [int] NULL,
[SITEID] [uniqueidentifier] NULL,
[SITENUMBER] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AMOUNT] [money] NULL,
[HOUSEHOLDAMOUNT] [money] NULL,
[ALLTIMEAMOUNT] [money] NULL,
[ALLTIMEHOUSEHOLDAMOUNT] [money] NULL
)
GO
