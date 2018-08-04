CREATE TABLE [ods].[BB_Countries_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Countr__ETL_C__58C7A3DA] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[ABBREVIATION] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ABBREVIATION2] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[BB_Countries_stg] ADD CONSTRAINT [PK_Countries_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
