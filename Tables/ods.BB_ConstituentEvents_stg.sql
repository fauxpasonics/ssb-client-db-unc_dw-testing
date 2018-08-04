CREATE TABLE [ods].[BB_ConstituentEvents_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Consti__ETL_C__54F712F6] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[EVENTID] [uniqueidentifier] NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[ISGUEST] [bit] NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
ALTER TABLE [ods].[BB_ConstituentEvents_stg] ADD CONSTRAINT [PK_ConstituentEvents_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
