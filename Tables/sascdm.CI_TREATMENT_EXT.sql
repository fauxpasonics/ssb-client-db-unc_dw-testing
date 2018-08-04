CREATE TABLE [sascdm].[CI_TREATMENT_EXT]
(
[TREATMENT_SK] [numeric] (15, 0) NOT NULL,
[PRICETAG] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [sascdm].[CI_TREATMENT_EXT] ADD CONSTRAINT [TREAT_EXT_PK] PRIMARY KEY CLUSTERED  ([TREATMENT_SK])
GO
ALTER TABLE [sascdm].[CI_TREATMENT_EXT] ADD CONSTRAINT [TREAT_EXT_FK1] FOREIGN KEY ([TREATMENT_SK]) REFERENCES [sascdm].[CI_TREATMENT] ([TREATMENT_SK])
GO
