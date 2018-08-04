CREATE TABLE [sascdm].[CI_DYNAMIC_TREATMENT_ATTRIBUTE]
(
[CELL_PACKAGE_SK] [numeric] (15, 0) NOT NULL,
[TREATMENT_SK] [numeric] (15, 0) NOT NULL,
[TREATMENT_HASH_VAL] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PACKAGE_HASH_VAL] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SEQUENCE_NO] [numeric] (6, 0) NULL
)
GO
ALTER TABLE [sascdm].[CI_DYNAMIC_TREATMENT_ATTRIBUTE] ADD CONSTRAINT [DYN_TREAT_ATTR_PK] PRIMARY KEY CLUSTERED  ([CELL_PACKAGE_SK], [TREATMENT_SK], [TREATMENT_HASH_VAL], [PACKAGE_HASH_VAL])
GO
ALTER TABLE [sascdm].[CI_DYNAMIC_TREATMENT_ATTRIBUTE] ADD CONSTRAINT [DYN_TREAT_ATTR_FK1] FOREIGN KEY ([CELL_PACKAGE_SK]) REFERENCES [sascdm].[CI_CELL_PACKAGE] ([CELL_PACKAGE_SK])
GO
ALTER TABLE [sascdm].[CI_DYNAMIC_TREATMENT_ATTRIBUTE] ADD CONSTRAINT [DYN_TREAT_ATTR_FK2] FOREIGN KEY ([TREATMENT_SK]) REFERENCES [sascdm].[CI_TREATMENT] ([TREATMENT_SK])
GO
