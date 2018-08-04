CREATE TABLE [ods].[BB_Countries]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[ABBREVIATION] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ABBREVIATION2] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[BB_Countries] ADD CONSTRAINT [PK__BB_Count__3214EC279A60286E] PRIMARY KEY CLUSTERED  ([ID])
GO
