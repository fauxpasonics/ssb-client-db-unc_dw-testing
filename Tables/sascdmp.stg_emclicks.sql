CREATE TABLE [sascdmp].[stg_emclicks]
(
[clientid] [bigint] NULL,
[sendid] [bigint] NULL,
[subscriberkey] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailaddress] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subscriberid] [bigint] NULL,
[listid] [bigint] NULL,
[eventdate] [datetime] NULL,
[eventtype] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sendurlid] [bigint] NULL,
[urlid] [bigint] NULL,
[url] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[alias] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[batchid] [bigint] NULL,
[triggeredsendexternalkey] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
