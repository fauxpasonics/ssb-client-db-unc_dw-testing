CREATE TABLE [ods].[BB_EducationalInvolvements_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Educat__ETL_C__04B8391F] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[EDUCATIONALINVOLVEMENTTYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EDUCATIONALINVOLVEMENTNAME] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEFROM] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATETO] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [datetime] NULL,
[DATECHANGED] [datetime] NULL
)
GO
ALTER TABLE [ods].[BB_EducationalInvolvements_stg] ADD CONSTRAINT [PK_EducationalInvolvements_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
