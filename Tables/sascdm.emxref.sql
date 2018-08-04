CREATE TABLE [sascdm].[emxref]
(
[sendid] [bigint] NULL,
[response_tracking_cd] [varchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subscriberkey] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailaddress] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sentdate] [datetime] NULL,
[cell_package_sk] [numeric] (15, 0) NOT NULL,
[load_date] [datetime] NOT NULL
)
GO
