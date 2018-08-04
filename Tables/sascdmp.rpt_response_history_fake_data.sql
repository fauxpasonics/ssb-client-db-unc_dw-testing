CREATE TABLE [sascdmp].[rpt_response_history_fake_data]
(
[ssb_crmsystem_contact_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[response_tracking_cd] [varchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[marketing_cell_nm] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sent_dt] [datetime] NULL,
[response_dt] [datetime] NULL,
[IsResponse] [tinyint] NULL,
[ssb_crmsystem_contact_id_resp] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[campaign_cd] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[campaign_nm] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[campaign_bus_owner] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[campaign_start_dt] [datetime] NULL,
[campaign_end_dt] [datetime] NULL,
[channel_cd] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[control_group_type_cd] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthday] [date] NULL,
[qtyseat] [int] NULL,
[totalrevenue] [decimal] (18, 6) NULL
)
GO
