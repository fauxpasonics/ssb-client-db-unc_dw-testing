CREATE TABLE [sascdm].[CI_TREATMENT_CAMPAIGN_SET]
(
[TREATMENT_CAMPAIGN_SET_SK] [numeric] (15, 0) NOT NULL,
[TREATMENT_CAMP_SET_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TREATMENT_CAMP_SET_DESC] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TREATMENT_CAMP_SET_FOLDER_TXT] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_MODIFIED_BY_USER_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_MODIFIED_DTTM] [datetime] NULL,
[TREAT_CAMP_SET_STATUS_CD] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DELETED_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdm].[CI_TREATMENT_CAMPAIGN_SET] ADD CONSTRAINT [TREAT_CAMP_SET_PK] PRIMARY KEY CLUSTERED  ([TREATMENT_CAMPAIGN_SET_SK])
GO
ALTER TABLE [sascdm].[CI_TREATMENT_CAMPAIGN_SET] ADD CONSTRAINT [TREAT_CAMP_SET_FK1] FOREIGN KEY ([TREAT_CAMP_SET_STATUS_CD]) REFERENCES [sascdm].[CI_TREAT_CAMP_SET_STATUS] ([TREAT_CAMP_SET_STATUS_CD])
GO
