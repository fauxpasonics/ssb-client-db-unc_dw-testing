CREATE TABLE [dbo].[DimCustomerSSBID]
(
[DimCustomerSSBID] [int] NOT NULL IDENTITY(1, 1),
[DimCustomerId] [int] NOT NULL,
[SSB_CRMSYSTEM_ACCT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_PRIMARY_FLAG] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NOT NULL,
[UpdatedDate] [datetime] NOT NULL,
[IsDeleted] [bit] NOT NULL CONSTRAINT [DF__dimcustom__IsDel__33D4B598] DEFAULT ((0)),
[DeleteDate] [datetime] NULL,
[SSID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG] [int] NULL,
[ssb_crmsystem_contactacct_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_HOUSEHOLD_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_HOUSEHOLD_PRIMARY_FLAG] [int] NULL
)
GO
ALTER TABLE [dbo].[DimCustomerSSBID] ADD CONSTRAINT [PK_DimcustomerSSBID] PRIMARY KEY CLUSTERED  ([DimCustomerId])
GO
CREATE NONCLUSTERED INDEX [IX_DimCustomerSSBId__IsDeleted] ON [dbo].[DimCustomerSSBID] ([IsDeleted]) INCLUDE ([DimCustomerId], [SourceSystem], [SSB_CRMSYSTEM_CONTACT_ID])
GO
CREATE NONCLUSTERED INDEX [IX_DimCustSSBID_SourceSystem_ContactID] ON [dbo].[DimCustomerSSBID] ([SourceSystem]) INCLUDE ([SSB_CRMSYSTEM_CONTACT_ID])
GO
CREATE NONCLUSTERED INDEX [IX_DimCustSSBID_AcctPriFlag_AcctID_ContactID_PriFlag] ON [dbo].[DimCustomerSSBID] ([SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG]) INCLUDE ([DimCustomerId], [SSB_CRMSYSTEM_ACCT_ID], [SSB_CRMSYSTEM_CONTACT_ID], [SSB_CRMSYSTEM_PRIMARY_FLAG])
GO
CREATE NONCLUSTERED INDEX [IX_dimcustomerssbid_contactid] ON [dbo].[DimCustomerSSBID] ([SSB_CRMSYSTEM_CONTACT_ID]) INCLUDE ([DimCustomerId])
GO
CREATE NONCLUSTERED INDEX [IX_SSB_CRMSYSTEM_CONTACT_ID_ACCT_PRIMARY_FLAG] ON [dbo].[DimCustomerSSBID] ([SSB_CRMSYSTEM_CONTACT_ID]) INCLUDE ([DimCustomerId], [SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG])
GO
ALTER TABLE [dbo].[DimCustomerSSBID] ADD CONSTRAINT [uk_dimcustomerssbid_ssid] UNIQUE NONCLUSTERED  ([SSID], [SourceSystem])
GO
CREATE NONCLUSTERED INDEX [IX_dimcustomerssbid_ssid_contactid] ON [dbo].[DimCustomerSSBID] ([SSID], [SourceSystem]) INCLUDE ([SSB_CRMSYSTEM_CONTACT_ID])
GO
CREATE NONCLUSTERED INDEX [idx_SSID_DimcustomerID_SSID_SSBID_SS] ON [dbo].[DimCustomerSSBID] ([SSID], [SSB_CRMSYSTEM_CONTACT_ID], [SourceSystem])
GO
