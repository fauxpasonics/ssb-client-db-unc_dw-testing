CREATE TABLE [mdm].[DimCustomer_AllAddresses]
(
[DimCustomerId] [int] NOT NULL,
[SourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SSID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Prefix] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FullName] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NameDirtyHash] [binary] (32) NULL,
[NameIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NameMasterId] [bigint] NULL,
[Street] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suite] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Zip] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plus4] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[County] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Country] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressDirtyHash] [binary] (32) NULL,
[AddressIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
CREATE CLUSTERED INDEX [ix_DC_AA_DimCustID_AddressHash] ON [mdm].[DimCustomer_AllAddresses] ([DimCustomerId], [AddressDirtyHash])
GO
