CREATE TABLE [sascdmp].[CI_CAMP_GRP_X_MO_OPT_SCENARIO]
(
[CAMPAIGN_GROUP_SK] [numeric] (15, 0) NOT NULL,
[MO_OPT_SCENARIO_SK] [numeric] (15, 0) NOT NULL
)
GO
ALTER TABLE [sascdmp].[CI_CAMP_GRP_X_MO_OPT_SCENARIO] ADD CONSTRAINT [CG_X_MO_OPT_PK] PRIMARY KEY CLUSTERED  ([CAMPAIGN_GROUP_SK], [MO_OPT_SCENARIO_SK])
GO
ALTER TABLE [sascdmp].[CI_CAMP_GRP_X_MO_OPT_SCENARIO] ADD CONSTRAINT [CG_X_MO_OPT_FK1] FOREIGN KEY ([CAMPAIGN_GROUP_SK]) REFERENCES [sascdmp].[CI_CAMPAIGN_GROUP] ([CAMPAIGN_GROUP_SK])
GO
ALTER TABLE [sascdmp].[CI_CAMP_GRP_X_MO_OPT_SCENARIO] ADD CONSTRAINT [CG_X_MO_OPT_FK2] FOREIGN KEY ([MO_OPT_SCENARIO_SK]) REFERENCES [sascdmp].[CI_MO_OPTIMIZATION_SCENARIO] ([MO_OPT_SCENARIO_SK])
GO
