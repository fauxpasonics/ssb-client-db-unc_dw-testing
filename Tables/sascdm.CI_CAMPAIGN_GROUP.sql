CREATE TABLE [sascdm].[CI_CAMPAIGN_GROUP]
(
[CAMPAIGN_GROUP_SK] [numeric] (15, 0) NOT NULL,
[CAMPAIGN_GROUP_CD] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_GROUP_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_GROUP_DESC] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_GROUP_TYPE_CD] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_GROUP_VERSION_NO] [numeric] (6, 0) NULL,
[CAMPAIGN_GROUP_FOLDER_TXT] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_GROUP_STATUS_CD] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MIN_BUDGET_OFFER_AMT] [numeric] (14, 2) NULL,
[MAX_BUDGET_OFFER_AMT] [numeric] (14, 2) NULL,
[MIN_BUDGET_AMT] [numeric] (14, 2) NULL,
[MAX_BUDGET_AMT] [numeric] (14, 2) NULL,
[LAST_MODIFIED_BY_USER_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_MODIFIED_DTTM] [datetime] NULL,
[DELETED_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdm].[CI_CAMPAIGN_GROUP] ADD CONSTRAINT [CAMP_GRP_PK] PRIMARY KEY CLUSTERED  ([CAMPAIGN_GROUP_SK])
GO
ALTER TABLE [sascdm].[CI_CAMPAIGN_GROUP] ADD CONSTRAINT [CAMP_GRP_FK1] FOREIGN KEY ([CAMPAIGN_GROUP_TYPE_CD]) REFERENCES [sascdm].[CI_CAMPAIGN_GROUP_TYPE] ([CAMPAIGN_GROUP_TYPE_CD])
GO
ALTER TABLE [sascdm].[CI_CAMPAIGN_GROUP] ADD CONSTRAINT [CAMP_GRP_FK2] FOREIGN KEY ([CAMPAIGN_GROUP_STATUS_CD]) REFERENCES [sascdm].[CI_CAMPAIGN_GROUP_STATUS] ([CAMPAIGN_GROUP_STATUS_CD])
GO
