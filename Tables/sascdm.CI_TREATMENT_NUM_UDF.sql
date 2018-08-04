CREATE TABLE [sascdm].[CI_TREATMENT_NUM_UDF]
(
[TREATMENT_SK] [numeric] (15, 0) NOT NULL,
[NUM_UDF_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TREATMENT_HASH_VAL] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NUM_UDF_VAL] [numeric] (17, 2) NULL,
[NUM_EXT_COLUMN_NM] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdm].[CI_TREATMENT_NUM_UDF] ADD CONSTRAINT [TREAT_NM_UDF_PK] PRIMARY KEY CLUSTERED  ([TREATMENT_SK], [NUM_UDF_NM], [TREATMENT_HASH_VAL])
GO
ALTER TABLE [sascdm].[CI_TREATMENT_NUM_UDF] ADD CONSTRAINT [TREAT_NM_UDF_FK1] FOREIGN KEY ([TREATMENT_SK]) REFERENCES [sascdm].[CI_TREATMENT] ([TREATMENT_SK])
GO
