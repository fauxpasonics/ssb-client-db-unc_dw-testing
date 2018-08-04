CREATE TABLE [dbo].[PotentialAddressMatches]
(
[ssb_crmsystem_contact_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dimcustomerid] [int] NOT NULL,
[firstname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lastname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[suffix] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contactguid] [uniqueidentifier] NULL,
[addressonestreet] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[addressonecity] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailprimary] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ssb_crmsystem_contact_id2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dimcustomerid2] [int] NOT NULL,
[firstname2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lastname2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[suffix2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contactguid2] [uniqueidentifier] NULL,
[addressStreet2] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressCity2] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressStatus2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailprimary2] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[matchtype] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
