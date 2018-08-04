CREATE TABLE [sascdm].[EM_RESPONSE_HISTORY]
(
[em_sendid] [bigint] NOT NULL,
[em_subscriberid] [bigint] NOT NULL,
[response_dttm] [datetime] NOT NULL,
[response_dt] [date] NOT NULL,
[ssb_crmsystem_contact_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[response_tracking_cd] [varchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[eventtype] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[em_sendurlid] [bigint] NULL,
[cell_package_sk] [numeric] (15, 0) NULL,
[response_reason] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[response_category] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[load_date] [date] NOT NULL
)
GO
ALTER TABLE [sascdm].[EM_RESPONSE_HISTORY] ADD CONSTRAINT [EM_RESP_HIST_PK] PRIMARY KEY CLUSTERED  ([em_sendid], [ssb_crmsystem_contact_id], [response_dttm])
GO
