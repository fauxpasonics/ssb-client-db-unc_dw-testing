CREATE TABLE [ods].[BB_States]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[COUNTRYID] [uniqueidentifier] NULL,
[COUNTRY] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ABBREVIATION] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[BB_States] ADD CONSTRAINT [PK__BB_State__3214EC271F8070EC] PRIMARY KEY CLUSTERED  ([ID])
GO
