CREATE TABLE [stg].[BB_ConstituentEvents]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Consti__ETL_C__49C658BC] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[EVENTID] [uniqueidentifier] NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[ISGUEST] [bit] NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
