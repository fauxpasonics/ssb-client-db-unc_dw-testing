CREATE TABLE [ods].[BB_ConstituentSpecialCodes_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[SPECIALCODEID] [uniqueidentifier] NULL,
[SPECIALCODE] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
ALTER TABLE [ods].[BB_ConstituentSpecialCodes_stg] ADD CONSTRAINT [PK__BB_Const__3214EC2786A8A95A] PRIMARY KEY CLUSTERED  ([ID])
GO
