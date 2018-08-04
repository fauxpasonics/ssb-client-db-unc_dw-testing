CREATE TABLE [ods].[BB_ConstituentSolicitCodes]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[DESCRIPTION] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL,
[STARTDATE] [date] NULL,
[ENDDATE] [date] NULL
)
GO
ALTER TABLE [ods].[BB_ConstituentSolicitCodes] ADD CONSTRAINT [PK__BB_Const__3214EC2770E08CDD] PRIMARY KEY CLUSTERED  ([ID])
GO
