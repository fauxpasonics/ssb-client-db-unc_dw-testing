CREATE TABLE [sascdmp].[CI_TREAT_CAMP_SET_X_CAMPAIGN]
(
[TREATMENT_CAMPAIGN_SET_SK] [numeric] (15, 0) NOT NULL,
[CAMPAIGN_SK] [numeric] (15, 0) NOT NULL,
[DELETED_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdmp].[CI_TREAT_CAMP_SET_X_CAMPAIGN] ADD CONSTRAINT [TCS_X_CAMP_PK] PRIMARY KEY CLUSTERED  ([TREATMENT_CAMPAIGN_SET_SK], [CAMPAIGN_SK])
GO
ALTER TABLE [sascdmp].[CI_TREAT_CAMP_SET_X_CAMPAIGN] ADD CONSTRAINT [TCS_X_CAMP_FK1] FOREIGN KEY ([TREATMENT_CAMPAIGN_SET_SK]) REFERENCES [sascdmp].[CI_TREATMENT_CAMPAIGN_SET] ([TREATMENT_CAMPAIGN_SET_SK])
GO
ALTER TABLE [sascdmp].[CI_TREAT_CAMP_SET_X_CAMPAIGN] ADD CONSTRAINT [TCS_X_CAMP_FK2] FOREIGN KEY ([CAMPAIGN_SK]) REFERENCES [sascdmp].[CI_CAMPAIGN] ([CAMPAIGN_SK])
GO
