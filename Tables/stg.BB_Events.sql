CREATE TABLE [stg].[BB_Events]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Events__ETL_C__572053DA] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[NAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STARTDATE] [date] NULL,
[ENDDATE] [date] NULL,
[CATEGORY] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
