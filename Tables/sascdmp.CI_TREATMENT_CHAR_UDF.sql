CREATE TABLE [sascdmp].[CI_TREATMENT_CHAR_UDF]
(
[TREATMENT_SK] [numeric] (15, 0) NOT NULL,
[CHAR_UDF_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TREATMENT_HASH_VAL] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CHAR_UDF_VAL] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHAR_EXT_COLUMN_NM] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdmp].[CI_TREATMENT_CHAR_UDF] ADD CONSTRAINT [TREAT_CH_UDF_PK] PRIMARY KEY CLUSTERED  ([TREATMENT_SK], [CHAR_UDF_NM], [TREATMENT_HASH_VAL])
GO
ALTER TABLE [sascdmp].[CI_TREATMENT_CHAR_UDF] ADD CONSTRAINT [TREAT_CH_UDF_FK1] FOREIGN KEY ([TREATMENT_SK]) REFERENCES [sascdmp].[CI_TREATMENT] ([TREATMENT_SK])
GO
