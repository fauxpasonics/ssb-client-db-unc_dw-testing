CREATE TABLE [sascdmp].[CI_CHANGE_LOG]
(
[CAMPAIGN_SK] [numeric] (15, 0) NOT NULL,
[CHANGE_TYPE_CD] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CHANGE_DTTM] [datetime] NOT NULL,
[CHANGED_BY_USER_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHANGE_TXT] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [sascdmp].[CI_CHANGE_LOG] ADD CONSTRAINT [CHANGE_LOG_PK] PRIMARY KEY CLUSTERED  ([CAMPAIGN_SK], [CHANGE_TYPE_CD], [CHANGE_DTTM])
GO
ALTER TABLE [sascdmp].[CI_CHANGE_LOG] ADD CONSTRAINT [CHANGE_LOG_FK1] FOREIGN KEY ([CAMPAIGN_SK]) REFERENCES [sascdmp].[CI_CAMPAIGN] ([CAMPAIGN_SK])
GO
ALTER TABLE [sascdmp].[CI_CHANGE_LOG] ADD CONSTRAINT [CHANGE_LOG_FK2] FOREIGN KEY ([CHANGE_TYPE_CD]) REFERENCES [sascdmp].[CI_CHANGE_TYPE] ([CHANGE_TYPE_CD])
GO
