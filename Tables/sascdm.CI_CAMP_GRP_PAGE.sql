CREATE TABLE [sascdm].[CI_CAMP_GRP_PAGE]
(
[CAMPAIGN_GROUP_SK] [numeric] (15, 0) NOT NULL,
[PAGE_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PAGE_STATUS_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdm].[CI_CAMP_GRP_PAGE] ADD CONSTRAINT [CAMP_GRP_PAGE_PK] PRIMARY KEY CLUSTERED  ([CAMPAIGN_GROUP_SK], [PAGE_NM])
GO
ALTER TABLE [sascdm].[CI_CAMP_GRP_PAGE] ADD CONSTRAINT [CAMP_GRP_PAGE_FK1] FOREIGN KEY ([CAMPAIGN_GROUP_SK]) REFERENCES [sascdm].[CI_CAMPAIGN_GROUP] ([CAMPAIGN_GROUP_SK])
GO