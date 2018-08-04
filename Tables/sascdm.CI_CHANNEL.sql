CREATE TABLE [sascdm].[CI_CHANNEL]
(
[CHANNEL_CD] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CHANNEL_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHANNEL_DESC] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [sascdm].[CI_CHANNEL] ADD CONSTRAINT [CHANNEL_PK] PRIMARY KEY CLUSTERED  ([CHANNEL_CD])
GO
