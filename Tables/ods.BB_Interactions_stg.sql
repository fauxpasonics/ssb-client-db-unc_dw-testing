CREATE TABLE [ods].[BB_Interactions_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
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
ALTER TABLE [ods].[BB_Interactions_stg] ADD CONSTRAINT [PK__BB_Inter__3214EC27593D02B8] PRIMARY KEY CLUSTERED  ([ID])
GO
