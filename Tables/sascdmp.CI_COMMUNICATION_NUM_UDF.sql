CREATE TABLE [sascdmp].[CI_COMMUNICATION_NUM_UDF]
(
[COMMUNICATION_SK] [numeric] (15, 0) NOT NULL,
[NUM_UDF_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NUM_UDF_VAL] [numeric] (17, 2) NULL,
[NUM_EXT_COLUMN_NM] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdmp].[CI_COMMUNICATION_NUM_UDF] ADD CONSTRAINT [COMM_NM_UDF_PK] PRIMARY KEY CLUSTERED  ([COMMUNICATION_SK], [NUM_UDF_NM])
GO
ALTER TABLE [sascdmp].[CI_COMMUNICATION_NUM_UDF] ADD CONSTRAINT [COMM_NM_UDF_FK1] FOREIGN KEY ([COMMUNICATION_SK]) REFERENCES [sascdmp].[CI_COMMUNICATION] ([COMMUNICATION_SK])
GO
