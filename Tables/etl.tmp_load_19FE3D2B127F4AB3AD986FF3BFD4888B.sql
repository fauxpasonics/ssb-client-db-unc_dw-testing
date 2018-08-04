CREATE TABLE [etl].[tmp_load_19FE3D2B127F4AB3AD986FF3BFD4888B]
(
[SourceDB] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceSystem] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceSystemPriority] [int] NULL,
[SSID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerStatus] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AccountType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountRep] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompanyName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalutationName] [nvarchar] (700) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DonorMailName] [nvarchar] (700) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DonorFormalName] [nvarchar] (700) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthday] [date] NULL,
[Gender] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MergedRecordFlag] [int] NOT NULL,
[MergedIntoSSID] [int] NULL,
[FullName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prefix] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryCity] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryState] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryZip] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryCounty] [int] NULL,
[AddressPrimaryCountry] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneCity] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneState] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneZip] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneCounty] [int] NULL,
[AddressOneCountry] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoCity] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoState] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoZip] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoCounty] [int] NULL,
[AddressTwoCountry] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeCity] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeState] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeZip] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeCounty] [int] NULL,
[AddressThreeCountry] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourStreet] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourCity] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourState] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourZip] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourCounty] [int] NULL,
[AddressFourCountry] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhonePrimary] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneHome] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneCell] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneBusiness] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneFax] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneOther] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailPrimary] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailOne] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailTwo] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute1] [int] NOT NULL,
[ExtAttribute2] [int] NOT NULL,
[ExtAttribute3] [tinyint] NULL,
[ExtAttribute4] [bit] NOT NULL,
[ExtAttribute5] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute6] [int] NULL,
[ExtAttribute7] [int] NULL,
[ExtAttribute8] [uniqueidentifier] NULL,
[ExtAttribute9] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute10] [bit] NULL,
[ExtAttribute11] [int] NULL,
[ExtAttribute12] [int] NULL,
[ExtAttribute13] [int] NULL,
[ExtAttribute14] [int] NULL,
[ExtAttribute15] [int] NULL,
[ExtAttribute16] [int] NULL,
[ExtAttribute17] [int] NULL,
[ExtAttribute18] [int] NULL,
[ExtAttribute19] [int] NULL,
[ExtAttribute20] [int] NULL,
[ExtAttribute21] [date] NULL,
[ExtAttribute22] [int] NULL,
[ExtAttribute23] [int] NULL,
[ExtAttribute24] [int] NULL,
[ExtAttribute25] [int] NULL,
[ExtAttribute26] [int] NULL,
[ExtAttribute27] [int] NULL,
[ExtAttribute28] [int] NULL,
[ExtAttribute29] [int] NULL,
[ExtAttribute30] [int] NULL,
[ExtAttribute31] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute32] [int] NULL,
[ExtAttribute33] [int] NULL,
[ExtAttribute34] [int] NULL,
[ExtAttribute35] [int] NULL,
[SSCreatedBy] [int] NULL,
[SSUpdatedBy] [int] NULL,
[SSCreatedDate] [int] NULL,
[CreatedDate] [datetime] NOT NULL,
[IsDeleted] [bit] NOT NULL,
[DeletedDate] [datetime] NULL,
[SSUpdatedDate] [date] NULL,
[AccountId] [int] NULL,
[IsBusiness] [int] NULL,
[customer_MatchKey] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DoNotPhone] [int] NOT NULL,
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
[ContactDirtyHash] [int] NULL,
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
