CREATE TABLE [ods].[BB_Phone_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[PHONETYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NUMBER] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NUMBERNOFORMAT] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STARTDATE] [date] NULL,
[ENDDATE] [date] NULL,
[DONOTCALL] [bit] NULL,
[ISPRIMARY] [bit] NULL,
[INFOSOURCE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
ALTER TABLE [ods].[BB_Phone_stg] ADD CONSTRAINT [PK__BB_Phone__3214EC271F984A98] PRIMARY KEY CLUSTERED  ([ID])
GO
