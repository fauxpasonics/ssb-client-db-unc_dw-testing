CREATE TABLE [stg].[BB_Sites]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Sites__ETL_Cr__1429621A] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[SITEID] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAME] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SHORTNAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
