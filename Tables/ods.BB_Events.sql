CREATE TABLE [ods].[BB_Events]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[NAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STARTDATE] [date] NULL,
[ENDDATE] [date] NULL,
[CATEGORY] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
ALTER TABLE [ods].[BB_Events] ADD CONSTRAINT [PK__BB_Event__3214EC2768035C56] PRIMARY KEY CLUSTERED  ([ID])
GO
