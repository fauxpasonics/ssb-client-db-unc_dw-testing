CREATE TABLE [stg].[BB_Household]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Househ__ETL_C__5EC175A2] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[HOUSEHOLDID] [uniqueidentifier] NULL,
[ISPRIMARYMEMBER] [bit] NULL,
[ISHOUSEHOLD] [bit] NULL,
[HOUSEHOLDLOOKUPID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
