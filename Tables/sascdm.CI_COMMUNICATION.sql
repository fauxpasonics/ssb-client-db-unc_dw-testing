CREATE TABLE [sascdm].[CI_COMMUNICATION]
(
[COMMUNICATION_SK] [numeric] (15, 0) NOT NULL,
[CAMPAIGN_SK] [numeric] (15, 0) NOT NULL,
[COMMUNICATION_CD] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMMUNICATION_OCCURRENCE_NO] [numeric] (6, 0) NULL,
[COMMUNICATION_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMMUNICATION_DESC] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMMUNICATION_STATUS_CD] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMMUNICATION_RECURR_TYPE_CD] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUBJECT_TYPE_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MIN_BUDGET_OFFER_AMT] [numeric] (14, 2) NULL,
[MAX_BUDGET_OFFER_AMT] [numeric] (14, 2) NULL,
[MIN_BUDGET_AMT] [numeric] (14, 2) NULL,
[MAX_BUDGET_AMT] [numeric] (14, 2) NULL,
[BUDGET_UNIT_COST_AMT] [numeric] (14, 2) NULL,
[BUDGET_UNIT_USAGE_AMT] [numeric] (14, 2) NULL,
[START_DTTM] [datetime] NULL,
[END_DTTM] [datetime] NULL,
[EXPORT_DTTM] [datetime] NULL,
[UPDATE_CONTACT_HISTORY_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STANDARD_REPLY_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STAGED_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DELETED_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdm].[CI_COMMUNICATION] ADD CONSTRAINT [COMM_PK] PRIMARY KEY CLUSTERED  ([COMMUNICATION_SK])
GO
ALTER TABLE [sascdm].[CI_COMMUNICATION] WITH NOCHECK ADD CONSTRAINT [COMM_FK1] FOREIGN KEY ([CAMPAIGN_SK]) REFERENCES [sascdm].[CI_CAMPAIGN] ([CAMPAIGN_SK])
GO
ALTER TABLE [sascdm].[CI_COMMUNICATION] WITH NOCHECK ADD CONSTRAINT [COMM_FK2] FOREIGN KEY ([COMMUNICATION_STATUS_CD]) REFERENCES [sascdm].[CI_COMMUNICATION_STATUS] ([COMMUNICATION_STATUS_CD])
GO
ALTER TABLE [sascdm].[CI_COMMUNICATION] WITH NOCHECK ADD CONSTRAINT [COMM_FK3] FOREIGN KEY ([COMMUNICATION_RECURR_TYPE_CD]) REFERENCES [sascdm].[CI_COMMUNICATION_RECURR_TYPE] ([COMMUNICATION_RECURR_TYPE_CD])
GO
