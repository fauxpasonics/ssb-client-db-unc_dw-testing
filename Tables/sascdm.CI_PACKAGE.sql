CREATE TABLE [sascdm].[CI_PACKAGE]
(
[PACKAGE_SK] [numeric] (15, 0) NOT NULL,
[PACKAGE_CD] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHANNEL_CD] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [sascdm].[CI_PACKAGE] ADD CONSTRAINT [PACKAGE_PK] PRIMARY KEY CLUSTERED  ([PACKAGE_SK])
GO
ALTER TABLE [sascdm].[CI_PACKAGE] WITH NOCHECK ADD CONSTRAINT [PACKAGE_FK1] FOREIGN KEY ([CHANNEL_CD]) REFERENCES [sascdm].[CI_CHANNEL] ([CHANNEL_CD])
GO
