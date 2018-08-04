CREATE TABLE [ods].[BB_Events_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Events__ETL_C__5BA41085] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[NAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STARTDATE] [date] NULL,
[ENDDATE] [date] NULL,
[CATEGORY] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
ALTER TABLE [ods].[BB_Events_stg] ADD CONSTRAINT [PK_Events_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
