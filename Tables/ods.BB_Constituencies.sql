CREATE TABLE [ods].[BB_Constituencies]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[CONSTITUENCY] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEFROM] [date] NULL,
[DATETO] [date] NULL,
[ISCURRENTCONSTITUENCY] [bit] NULL
)
GO
ALTER TABLE [ods].[BB_Constituencies] ADD CONSTRAINT [PK__BB_Const__3214EC27D5BA450E] PRIMARY KEY CLUSTERED  ([ID])
GO
