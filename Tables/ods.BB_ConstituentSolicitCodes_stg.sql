CREATE TABLE [ods].[BB_ConstituentSolicitCodes_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Consti__ETL_C__56DF5B68] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[DESCRIPTION] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL,
[STARTDATE] [date] NULL,
[ENDDATE] [date] NULL
)
GO
ALTER TABLE [ods].[BB_ConstituentSolicitCodes_stg] ADD CONSTRAINT [PK_ConstituentSolicitCodes_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
