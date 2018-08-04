CREATE TABLE [ods].[BB_SpecialCodes_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[SPECIALCODE] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CATEGORY] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RESPONSIBLEOFFICE] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPIRATIONDATE] [date] NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
ALTER TABLE [ods].[BB_SpecialCodes_stg] ADD CONSTRAINT [PK__BB_Speci__3214EC270C9CB9E7] PRIMARY KEY CLUSTERED  ([ID])
GO
