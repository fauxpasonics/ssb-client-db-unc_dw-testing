CREATE TABLE [ods].[BB_AlternateLookupID_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[ALTERNATELOOKUPIDTYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ALTERNATELOOKUPID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [datetime] NULL,
[DATECHANGED] [datetime] NULL
)
GO
ALTER TABLE [ods].[BB_AlternateLookupID_stg] ADD CONSTRAINT [PK__BB_Alter__3214EC27B24B95B9] PRIMARY KEY CLUSTERED  ([ID])
GO
