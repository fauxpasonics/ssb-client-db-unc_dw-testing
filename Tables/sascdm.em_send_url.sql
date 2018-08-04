CREATE TABLE [sascdm].[em_send_url]
(
[em_sendurlid] [bigint] NOT NULL,
[urlid] [bigint] NOT NULL,
[alias] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[url] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [sascdm].[em_send_url] ADD CONSTRAINT [em_send_url_pk] PRIMARY KEY CLUSTERED  ([em_sendurlid])
GO
