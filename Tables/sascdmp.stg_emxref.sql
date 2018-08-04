CREATE TABLE [sascdmp].[stg_emxref]
(
[sendid] [bigint] NULL,
[listid] [bigint] NULL,
[batchid] [bigint] NULL,
[subscriberid] [bigint] NULL,
[triggeredsendexternalkey] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[errorcode] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailaddress] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[response_tracking_cd] [varchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sentdate] [datetime] NULL,
[subscriberkey] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
