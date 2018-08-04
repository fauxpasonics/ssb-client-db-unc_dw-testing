CREATE TABLE [sascdm].[CI_CAMP_PAGE_DATE_UDF]
(
[CAMPAIGN_SK] [numeric] (15, 0) NOT NULL,
[PAGE_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DATE_UDF_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DATE_UDF_VAL] [datetime] NULL,
[DATE_EXT_COLUMN_NM] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdm].[CI_CAMP_PAGE_DATE_UDF] ADD CONSTRAINT [CP_DT_UDF_PK] PRIMARY KEY CLUSTERED  ([CAMPAIGN_SK], [PAGE_NM], [DATE_UDF_NM])
GO
ALTER TABLE [sascdm].[CI_CAMP_PAGE_DATE_UDF] WITH NOCHECK ADD CONSTRAINT [CP_DT_UDF_FK1] FOREIGN KEY ([CAMPAIGN_SK], [PAGE_NM]) REFERENCES [sascdm].[CI_CAMP_PAGE] ([CAMPAIGN_SK], [PAGE_NM])
GO
