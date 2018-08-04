CREATE TABLE [ods].[BB_Constituencies_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Consti__ETL_C__5402EEBD] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[CONSTITUENCY] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEFROM] [date] NULL,
[DATETO] [date] NULL,
[ISCURRENTCONSTITUENCY] [bit] NULL
)
GO
ALTER TABLE [ods].[BB_Constituencies_stg] ADD CONSTRAINT [PK_Constituencies_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
