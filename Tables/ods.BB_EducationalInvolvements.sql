CREATE TABLE [ods].[BB_EducationalInvolvements]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
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
ALTER TABLE [ods].[BB_EducationalInvolvements] ADD CONSTRAINT [PK__BB_EducationalInvolvements] PRIMARY KEY CLUSTERED  ([ID])
GO
