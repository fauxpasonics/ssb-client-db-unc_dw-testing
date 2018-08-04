CREATE TABLE [ods].[BB_ConstituentEvents]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[EVENTID] [uniqueidentifier] NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[ISGUEST] [bit] NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
ALTER TABLE [ods].[BB_ConstituentEvents] ADD CONSTRAINT [PK__BB_Const__3214EC27574BFBF6] PRIMARY KEY CLUSTERED  ([ID])
GO
