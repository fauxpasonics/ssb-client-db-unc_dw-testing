CREATE TABLE [sascdm].[CI_EXTERNAL_CONT_RESP_DETAIL]
(
[EXTERNAL_CONT_RESP_DET_SK] [numeric] (15, 0) NOT NULL,
[TENANT_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ACTIVITY_ID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVITY_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVITY_TYPE_NM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TASK_ID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TASK_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TASK_TYPE_NM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MESSAGE_ID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MESSAGE_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MESSAGE_TYPE_NM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREATIVE_ID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREATIVE_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREATIVE_TYPE_NM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHANNEL_CD] [varchar] (65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NOT NULL
)
GO
ALTER TABLE [sascdm].[CI_EXTERNAL_CONT_RESP_DETAIL] ADD CONSTRAINT [EXTERNAL_CONT_RESP_DETAIL_PK] PRIMARY KEY CLUSTERED  ([EXTERNAL_CONT_RESP_DET_SK])
GO
