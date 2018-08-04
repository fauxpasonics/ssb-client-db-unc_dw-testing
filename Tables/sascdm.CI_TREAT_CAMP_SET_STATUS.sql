CREATE TABLE [sascdm].[CI_TREAT_CAMP_SET_STATUS]
(
[TREAT_CAMP_SET_STATUS_CD] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TREAT_CAMP_SET_STATUS_DESC] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [sascdm].[CI_TREAT_CAMP_SET_STATUS] ADD CONSTRAINT [TREAT_CAMP_SET_STATUS_PK] PRIMARY KEY CLUSTERED  ([TREAT_CAMP_SET_STATUS_CD])
GO