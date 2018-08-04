CREATE TABLE [sascdmp].[CI_RESPONSE_TYPE]
(
[RESPONSE_TYPE_CD] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RESPONSE_TYPE_DESC] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [sascdmp].[CI_RESPONSE_TYPE] ADD CONSTRAINT [RESPONSE_TYPE_PK] PRIMARY KEY CLUSTERED  ([RESPONSE_TYPE_CD])
GO
