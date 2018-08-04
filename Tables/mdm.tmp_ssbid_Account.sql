CREATE TABLE [mdm].[tmp_ssbid_Account]
(
[dimcustomerid] [int] NULL,
[ssid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sourcesystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressCompany_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[composite_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_ACCT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_HOUSEHOLD_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdby] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[updatedby] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[createddate] [datetime] NOT NULL,
[updateddate] [datetime] NOT NULL,
[composite_id_assigned] [bit] NULL,
[ssbid_updated] [bit] NULL
)
GO
