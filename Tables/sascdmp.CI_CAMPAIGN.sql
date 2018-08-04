CREATE TABLE [sascdmp].[CI_CAMPAIGN]
(
[CAMPAIGN_SK] [numeric] (15, 0) NOT NULL,
[CAMPAIGN_CD] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_STATUS_CD] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_VERSION_NO] [numeric] (6, 0) NULL,
[CURRENT_VERSION_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_DESC] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_FOLDER_TXT] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_OWNER_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_GROUP_SK] [numeric] (15, 0) NULL,
[DEPLOYMENT_VERSION_NO] [numeric] (6, 0) NULL,
[MIN_BUDGET_OFFER_AMT] [numeric] (14, 2) NULL,
[MAX_BUDGET_OFFER_AMT] [numeric] (14, 2) NULL,
[MIN_BUDGET_AMT] [numeric] (14, 2) NULL,
[MAX_BUDGET_AMT] [numeric] (14, 2) NULL,
[START_DTTM] [datetime] NULL,
[END_DTTM] [datetime] NULL,
[RUN_DTTM] [datetime] NULL,
[LAST_MODIFIED_DTTM] [datetime] NULL,
[LAST_MODIFIED_BY_USER_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[APPROVAL_DTTM] [datetime] NULL,
[APPROVAL_GIVEN_BY_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BUSINESS_CONTEXT_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAMPAIGN_TYPE_CD] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DELETED_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdmp].[CI_CAMPAIGN] ADD CONSTRAINT [CAMP_PK] PRIMARY KEY CLUSTERED  ([CAMPAIGN_SK])
GO
ALTER TABLE [sascdmp].[CI_CAMPAIGN] ADD CONSTRAINT [CAMP_FK1] FOREIGN KEY ([CAMPAIGN_STATUS_CD]) REFERENCES [sascdmp].[CI_CAMPAIGN_STATUS] ([CAMPAIGN_STATUS_CD])
GO
ALTER TABLE [sascdmp].[CI_CAMPAIGN] ADD CONSTRAINT [CAMP_FK2] FOREIGN KEY ([CAMPAIGN_TYPE_CD]) REFERENCES [sascdmp].[CI_CAMPAIGN_TYPE] ([CAMPAIGN_TYPE_CD])
GO
ALTER TABLE [sascdmp].[CI_CAMPAIGN] ADD CONSTRAINT [CAMP_FK3] FOREIGN KEY ([CAMPAIGN_GROUP_SK]) REFERENCES [sascdmp].[CI_CAMPAIGN_GROUP] ([CAMPAIGN_GROUP_SK])
GO
