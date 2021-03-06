CREATE TABLE [sascdmp].[CI_CAMP_PAGE_NUM_UDF]
(
[CAMPAIGN_SK] [numeric] (15, 0) NOT NULL,
[PAGE_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NUM_UDF_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NUM_UDF_VAL] [numeric] (17, 2) NULL,
[NUM_EXT_COLUMN_NM] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdmp].[CI_CAMP_PAGE_NUM_UDF] ADD CONSTRAINT [CP_NM_UDF_PK] PRIMARY KEY CLUSTERED  ([CAMPAIGN_SK], [PAGE_NM], [NUM_UDF_NM])
GO
ALTER TABLE [sascdmp].[CI_CAMP_PAGE_NUM_UDF] ADD CONSTRAINT [CP_NM_UDF_FK1] FOREIGN KEY ([CAMPAIGN_SK], [PAGE_NM]) REFERENCES [sascdmp].[CI_CAMP_PAGE] ([CAMPAIGN_SK], [PAGE_NM])
GO
