CREATE TABLE [ods].[BB_ConstituentSpecialCodes]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Consti__ETL_C__57D37FA1] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[SPECIALCODEID] [uniqueidentifier] NULL,
[SPECIALCODE] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
ALTER TABLE [ods].[BB_ConstituentSpecialCodes] ADD CONSTRAINT [PK_ConstituentSpecialCodes_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
