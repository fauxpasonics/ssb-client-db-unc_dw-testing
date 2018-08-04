CREATE TABLE [etl].[tmp_load_31A780D5BD044DD291AC659338757CFE]
(
[SourceDB] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceSystem] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceSystemPriority] [int] NULL,
[SSID] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerStatus] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[AccountType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountRep] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompanyName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalutationName] [int] NULL,
[DonorMailName] [int] NULL,
[DonorFormalName] [int] NULL,
[Birthday] [date] NULL,
[Gender] [int] NULL,
[MergedRecordFlag] [int] NOT NULL,
[MergedIntoSSID] [int] NULL,
[FullName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prefix] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [int] NULL,
[FirstName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryCity] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryState] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryZip] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryCounty] [int] NULL,
[AddressPrimaryCountry] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[AddressOneStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneCity] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneState] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneZip] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneCounty] [int] NULL,
[AddressOneCountry] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[AddressTwoStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoCity] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoState] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoZip] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoCounty] [int] NULL,
[AddressTwoCountry] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[AddressThreeStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeCity] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeState] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeZip] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeCounty] [int] NULL,
[AddressThreeCountry] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[AddressFourStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourCity] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourState] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourZip] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourCounty] [int] NULL,
[AddressFourCountry] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[PhonePrimary] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneHome] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneCell] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneBusiness] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneFax] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneOther] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailPrimary] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailOne] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailTwo] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute1] [int] NULL,
[ExtAttribute2] [int] NULL,
[ExtAttribute3] [int] NULL,
[ExtAttribute4] [int] NOT NULL,
[ExtAttribute5] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ExtAttribute6] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute7] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute8] [int] NULL,
[ExtAttribute9] [int] NULL,
[ExtAttribute10] [int] NULL,
[ExtAttribute11] [int] NULL,
[ExtAttribute12] [int] NULL,
[ExtAttribute13] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ExtAttribute14] [int] NULL,
[ExtAttribute15] [int] NULL,
[ExtAttribute16] [int] NULL,
[ExtAttribute17] [int] NULL,
[ExtAttribute18] [int] NULL,
[ExtAttribute19] [int] NULL,
[ExtAttribute20] [int] NULL,
[ExtAttribute21] [int] NULL,
[ExtAttribute22] [int] NULL,
[ExtAttribute23] [int] NULL,
[ExtAttribute24] [int] NULL,
[ExtAttribute25] [int] NULL,
[ExtAttribute26] [int] NULL,
[ExtAttribute27] [int] NULL,
[ExtAttribute28] [int] NULL,
[ExtAttribute29] [int] NULL,
[ExtAttribute30] [int] NULL,
[ExtAttribute31] [int] NULL,
[ExtAttribute32] [int] NULL,
[ExtAttribute33] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute34] [int] NULL,
[ExtAttribute35] [int] NULL,
[SSCreatedBy] [int] NULL,
[SSUpdatedBy] [int] NULL,
[SSCreatedDate] [datetime] NULL,
[CreatedDate] [datetime] NULL,
[SSUpdatedDate] [datetime] NOT NULL,
[IsDeleted] [int] NOT NULL,
[AccountId] [int] NULL,
[IsBusiness] [bit] NULL,
[customer_MatchKey] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NameDirtyHash] [varbinary] (8000) NULL,
[NameIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NameMasterId] [int] NULL,
[AddressPrimaryDirtyHash] [varbinary] (8000) NULL,
[AddressPrimaryIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressPrimaryMasterId] [int] NULL,
[AddressOneDirtyHash] [varbinary] (8000) NULL,
[AddressOneIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressOneMasterId] [int] NULL,
[AddressTwoDirtyHash] [varbinary] (8000) NULL,
[AddressTwoIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressTwoMasterId] [int] NULL,
[AddressThreeDirtyHash] [varbinary] (8000) NULL,
[AddressThreeIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressThreeMasterId] [int] NULL,
[AddressFourDirtyHash] [varbinary] (8000) NULL,
[AddressFourIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddressFourMasterId] [int] NULL,
[ContactDirtyHash] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ContactGuid] [uniqueidentifier] NULL,
[PhonePrimaryDirtyHash] [varbinary] (8000) NULL,
[PhonePrimaryIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhonePrimaryMasterId] [int] NULL,
[PhoneHomeDirtyHash] [varbinary] (8000) NULL,
[PhoneHomeIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneHomeMasterId] [int] NULL,
[PhoneCellDirtyHash] [varbinary] (8000) NULL,
[PhoneCellIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneCellMasterId] [int] NULL,
[PhoneBusinessDirtyHash] [varbinary] (8000) NULL,
[PhoneBusinessIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneBusinessMasterId] [int] NULL,
[PhoneFaxDirtyHash] [varbinary] (8000) NULL,
[PhoneFaxIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneFaxMasterId] [int] NULL,
[PhoneOtherDirtyHash] [varbinary] (8000) NULL,
[PhoneOtherIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PhoneOtherMasterId] [int] NULL,
[EmailPrimaryDirtyHash] [varbinary] (8000) NULL,
[EmailPrimaryIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailPrimaryMasterId] [int] NULL,
[EmailOneDirtyHash] [varbinary] (8000) NULL,
[EmailOneIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailOneMasterId] [int] NULL,
[EmailTwoDirtyHash] [varbinary] (8000) NULL,
[EmailTwoIsCleanStatus] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailTwoMasterId] [int] NULL,
[contactattrDirtyHash] [varbinary] (8000) NULL,
[extattr1_10DirtyHash] [varbinary] (8000) NULL,
[extattr11_20DirtyHash] [varbinary] (8000) NULL,
[extattr21_30DirtyHash] [varbinary] (8000) NULL,
[extattr31_35DirtyHash] [varbinary] (8000) NULL,
[RecordRank] [bigint] NULL
)
GO
CREATE NONCLUSTERED INDEX [ix_load_31A780D5BD044DD291AC659338757CFE_ss] ON [etl].[tmp_load_31A780D5BD044DD291AC659338757CFE] ([SourceSystem], [SSID])
GO
