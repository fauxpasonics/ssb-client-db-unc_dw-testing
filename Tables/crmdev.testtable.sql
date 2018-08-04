CREATE TABLE [crmdev].[testtable]
(
[id] [uniqueidentifier] NOT NULL,
[name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [crmdev].[testtable] ADD CONSTRAINT [PK__testtabl__3213E83F00E90FE4] PRIMARY KEY CLUSTERED  ([id])
GO
