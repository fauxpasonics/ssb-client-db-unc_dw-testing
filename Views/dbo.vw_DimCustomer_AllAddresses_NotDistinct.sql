SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_DimCustomer_AllAddresses_NotDistinct]
AS

-- Address Primary --
SELECT DISTINCT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.DimCustomerId, dc.SourceSystem, dc.SSID
	, Prefix, FirstName, MiddleName, LastName, Suffix, FullName, NameDirtyHash, NameIsCleanStatus
	, AddressPrimaryStreet Street, AddressPrimarySuite Suite, AddressPrimaryCity City, AddressPrimaryState [State], AddressPrimaryZip Zip
	, AddressPrimaryDirtyHash AddressDirtyHash, AddressPrimaryIsCleanStatus AddressIsCleanStatus
	, 'AddressPrimary' AS AddressType
FROM dbo.DimCustomer dc (NOLOCK)
JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
	ON dc.DimCustomerId = ssbid.DimCustomerID
WHERE AddressPrimaryIsCleanStatus LIKE '%Valid%'
	AND NameIsCleanStatus LIKE '%Valid%'

UNION

-- Address One --
SELECT DISTINCT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.DimCustomerId, dc.SourceSystem, dc.SSID
	, Prefix, FirstName, MiddleName, LastName, Suffix, FullName, NameDirtyHash, NameIsCleanStatus
	, AddressOneStreet Street, AddressOneSuite Suite, AddressOneCity City, AddressOneState [State], AddressOneZip Zip
	, AddressOneDirtyHash AddressDirtyHash, AddressOneIsCleanStatus AddressIsCleanStatus
	, 'AddressOne' AS AddressType
FROM dbo.DimCustomer dc (NOLOCK)
JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
	ON dc.DimCustomerId = ssbid.DimCustomerID
WHERE AddressOneIsCleanStatus LIKE '%Valid%'
	AND NameIsCleanStatus LIKE '%Valid%'

UNION

-- Address Two --
SELECT DISTINCT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.DimCustomerId, dc.SourceSystem, dc.SSID
	, Prefix, FirstName, MiddleName, LastName, Suffix, FullName, NameDirtyHash, NameIsCleanStatus
	, AddressTwoStreet Street, AddressTwoSuite Suite, AddressTwoCity City, AddressTwoState [State], AddressTwoZip Zip
	, AddressTwoDirtyHash AddressDirtyHash, AddressTwoIsCleanStatus AddressIsCleanStatus
	, 'AddressTwo' AS AddressType
FROM dbo.DimCustomer dc (NOLOCK)
JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
	ON dc.DimCustomerId = ssbid.DimCustomerID
WHERE AddressTwoIsCleanStatus LIKE '%Valid%'
	AND NameIsCleanStatus LIKE '%Valid%'

UNION

-- Address Three --
SELECT DISTINCT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.DimCustomerId, dc.SourceSystem, dc.SSID
	, Prefix, FirstName, MiddleName, LastName, Suffix, FullName, NameDirtyHash, NameIsCleanStatus
	, AddressThreeStreet Street, AddressThreeSuite Suite, AddressThreeCity City, AddressThreeState [State], AddressThreeZip Zip
	, AddressThreeDirtyHash AddressDirtyHash, AddressThreeIsCleanStatus AddressIsCleanStatus
	, 'AddressThree' AS AddressType
FROM dbo.DimCustomer dc (NOLOCK)
JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
	ON dc.DimCustomerId = ssbid.DimCustomerID
WHERE AddressThreeIsCleanStatus LIKE '%Valid%'
	AND NameIsCleanStatus LIKE '%Valid%'

UNION

-- Address Four --
SELECT DISTINCT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.DimCustomerId, dc.SourceSystem, dc.SSID
	, Prefix, FirstName, MiddleName, LastName, Suffix, FullName, NameDirtyHash, NameIsCleanStatus
	, AddressFourStreet Street, AddressFourSuite Suite, AddressFourCity City, AddressFourState [State], AddressFourZip Zip
	, AddressFourDirtyHash AddressDirtyHash, AddressFourIsCleanStatus AddressIsCleanStatus
	, 'AddressFour' AS AddressType
FROM dbo.DimCustomer dc (NOLOCK)
JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
	ON dc.DimCustomerId = ssbid.DimCustomerID
WHERE AddressFourIsCleanStatus LIKE '%Valid%'
	AND NameIsCleanStatus LIKE '%Valid%'


-- Total Records (3018-03-27): 
GO
