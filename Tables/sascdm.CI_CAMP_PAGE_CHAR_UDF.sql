CREATE TABLE [sascdm].[CI_CAMP_PAGE_CHAR_UDF]
(
[CAMPAIGN_SK] [numeric] (15, 0) NOT NULL,
[PAGE_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CHAR_UDF_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CHAR_UDF_VAL] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHAR_EXT_COLUMN_NM] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdm].[CI_CAMP_PAGE_CHAR_UDF] ADD CONSTRAINT [CP_CH_UDF_PK] PRIMARY KEY CLUSTERED  ([CAMPAIGN_SK], [PAGE_NM], [CHAR_UDF_NM])
GO
ALTER TABLE [sascdm].[CI_CAMP_PAGE_CHAR_UDF] WITH NOCHECK ADD CONSTRAINT [CP_CH_UDF_FK1] FOREIGN KEY ([CAMPAIGN_SK], [PAGE_NM]) REFERENCES [sascdm].[CI_CAMP_PAGE] ([CAMPAIGN_SK], [PAGE_NM])
GO
