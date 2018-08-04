CREATE TABLE [ods].[BB_Household_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[HOUSEHOLDID] [uniqueidentifier] NULL,
[ISPRIMARYMEMBER] [bit] NULL,
[ISHOUSEHOLD] [bit] NULL,
[HOUSEHOLDLOOKUPID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[BB_Household_stg] ADD CONSTRAINT [PK__BB_House__3214EC27DFDF0890] PRIMARY KEY CLUSTERED  ([ID])
GO
