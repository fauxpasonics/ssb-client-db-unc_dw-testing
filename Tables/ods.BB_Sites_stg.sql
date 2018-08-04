CREATE TABLE [ods].[BB_Sites_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[SITEID] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAME] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SHORTNAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[BB_Sites_stg] ADD CONSTRAINT [PK__BB_Sites__3214EC27EDA6DC37] PRIMARY KEY CLUSTERED  ([ID])
GO
