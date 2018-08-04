CREATE TABLE [stg].[BB_SpecialCodes]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Specia__ETL_C__1611AA8C] DEFAULT (getdate()),
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
