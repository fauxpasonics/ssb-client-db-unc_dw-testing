CREATE TABLE [stg].[BB_Interactions]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Intera__ETL_C__01168DA6] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[PLANNAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLANISACTIVE] [bit] NULL,
[OBJECTIVE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATUSCODE] [tinyint] NULL,
[STATUS] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMPLETED] [bit] NULL,
[FUNDRAISERID] [uniqueidentifier] NULL,
[FUNDRAISER] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FUNDRAISERLOOKUPID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INTERACTIONTYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPECTEDDATE] [date] NULL,
[ACTUALDATE] [date] NULL,
[DATE] [date] NULL,
[ISINTERACTION] [bit] NULL,
[ISCONTACTREPORT] [bit] NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
