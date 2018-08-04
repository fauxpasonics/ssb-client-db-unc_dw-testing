CREATE TABLE [ods].[BB_EmailAddress_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_EmailA__ETL_C__5AAFEC4C] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[EMAILTYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMAILADDRESS] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ISPRIMARY] [bit] NULL,
[DONOTEMAIL] [bit] NULL,
[STARTDATE] [date] NULL,
[ENDDATE] [date] NULL,
[INFOSOURCE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
ALTER TABLE [ods].[BB_EmailAddress_stg] ADD CONSTRAINT [PK_EmailAddress_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
