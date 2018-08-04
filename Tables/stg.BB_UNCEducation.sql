CREATE TABLE [stg].[BB_UNCEducation]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_UNCEdu__ETL_C__1DB2CC54] DEFAULT (getdate()),
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
