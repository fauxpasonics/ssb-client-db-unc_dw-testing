CREATE TABLE [sascdm].[CI_CAMPAIGN_GROUP_EXT]
(
[CAMPAIGN_GROUP_SK] [numeric] (15, 0) NOT NULL
)
GO
ALTER TABLE [sascdm].[CI_CAMPAIGN_GROUP_EXT] ADD CONSTRAINT [CG_EXT_PK] PRIMARY KEY CLUSTERED  ([CAMPAIGN_GROUP_SK])
GO
ALTER TABLE [sascdm].[CI_CAMPAIGN_GROUP_EXT] ADD CONSTRAINT [CG_EXT_FK1] FOREIGN KEY ([CAMPAIGN_GROUP_SK]) REFERENCES [sascdm].[CI_CAMPAIGN_GROUP] ([CAMPAIGN_GROUP_SK])
GO
