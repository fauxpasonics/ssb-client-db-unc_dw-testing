CREATE TABLE [ods].[BB_ConstituentJobInfo_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[CAREERCODE1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAREERCODE2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAREERCODE3] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRIMARY_EMPLOYER] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRIMARY_EMPLOYER_ID] [uniqueidentifier] NULL,
[PRIMARY_JOBTITLE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ISRETIRED] [bit] NULL,
[ISSELFEMPLOYED] [bit] NULL
)
GO
ALTER TABLE [ods].[BB_ConstituentJobInfo_stg] ADD CONSTRAINT [PK__BB_Const__3214EC275EFA4921] PRIMARY KEY CLUSTERED  ([ID])
GO
