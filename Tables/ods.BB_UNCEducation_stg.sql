CREATE TABLE [ods].[BB_UNCEducation_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[DATEGRADUATED] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEGREE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEGREECODE] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEGREETYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLASSOF] [smallint] NULL,
[PROGRAM] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SCHOOL] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAJOR] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ISPRIMARY] [bit] NULL,
[CONSTITUENCYSTATUS] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[BB_UNCEducation_stg] ADD CONSTRAINT [PK__BB_UNCEd__3214EC27A0425D95] PRIMARY KEY CLUSTERED  ([ID])
GO
