CREATE TABLE [sascdm].[CI_CAMP_PAGE]
(
[CAMPAIGN_SK] [numeric] (15, 0) NOT NULL,
[PAGE_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PAGE_STATUS_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdm].[CI_CAMP_PAGE] ADD CONSTRAINT [CAMP_PAGE_PK] PRIMARY KEY CLUSTERED  ([CAMPAIGN_SK], [PAGE_NM])
GO
ALTER TABLE [sascdm].[CI_CAMP_PAGE] WITH NOCHECK ADD CONSTRAINT [CAMP_PAGE_FK1] FOREIGN KEY ([CAMPAIGN_SK]) REFERENCES [sascdm].[CI_CAMPAIGN] ([CAMPAIGN_SK])
GO
