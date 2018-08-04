CREATE TABLE [mdm].[PrimaryFlagRanking_Email]
(
[dimcustomerid] [int] NOT NULL,
[sourcesystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ssid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ssb_crmsystem_acct_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_HOUSEHOLD_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_PRIMARY_FLAG] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG] [int] NULL,
[SSB_CRMSYSTEM_HOUSEHOLD_PRIMARY_FLAG] [int] NULL,
[EmailPrimaryFlag] [int] NULL,
[DimEmailID] [int] NULL,
[DimCustomerEmailID] [int] NOT NULL,
[ranking] [bigint] NULL,
[ss_ranking] [bigint] NULL
)
GO
CREATE CLUSTERED INDEX [ix_tmpRanking] ON [mdm].[PrimaryFlagRanking_Email] ([dimcustomerid])
GO
