CREATE TABLE [stg].[BB_States]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_States__ETL_C__19E23B70] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[COUNTRYID] [uniqueidentifier] NULL,
[COUNTRY] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ABBREVIATION] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
