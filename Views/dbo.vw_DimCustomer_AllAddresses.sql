SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_DimCustomer_AllAddresses]
AS

-- Address Primary --
SELECT DISTINCT DimCustomerId, SourceSystem, SSID
	, Prefix, FirstName, MiddleName, LastName, Suffix, FullName, NameDirtyHash, NameIsCleanStatus, NameMasterId
	, AddressPrimaryStreet Street, AddressPrimarySuite Suite, AddressPrimaryCity City, AddressPrimaryState [State], AddressPrimaryZip Zip, AddressPrimaryPlus4 Plus4
	, AddressPrimaryCounty County, AddressPrimaryCountry Country--, AddressPrimaryLatitude Latitude, AddressPrimaryLongitude Longitude
	, AddressPrimaryDirtyHash AddressDirtyHash, AddressPrimaryIsCleanStatus AddressIsCleanStatus
	--, AddressPrimaryNCOAStatus AddressNCOAStatus, AddressPrimaryMasterId AddressMasterID
	--, 'AddressPrimary' AS AddressType
FROM dbo.DimCustomer (NOLOCK)
WHERE AddressPrimaryIsCleanStatus LIKE '%Valid%'
	AND NameIsCleanStatus LIKE '%Valid%'

UNION

-- Address One --
SELECT DISTINCT DimCustomerId, SourceSystem, SSID
	, Prefix, FirstName, MiddleName, LastName, Suffix, FullName, NameDirtyHash, NameIsCleanStatus, NameMasterId
	, AddressOneStreet Street, AddressOneSuite Suite, AddressOneCity City, AddressOneState [State], AddressOneZip Zip, AddressOnePlus4 Plus4
	, AddressOneCounty County, AddressOneCountry Country--, AddressOneLatitude Latitude, AddressOneLongitude Longitude
	, AddressOneDirtyHash AddressDirtyHash, AddressOneIsCleanStatus AddressIsCleanStatus
	--, AddressOneStreetNCOAStatus AddressNCOAStatus, AddressOneMasterId AddressMasterID
	--, 'AddressOne' AS AddressType
FROM dbo.DimCustomer (NOLOCK)
WHERE AddressOneIsCleanStatus LIKE '%Valid%'
	AND NameIsCleanStatus LIKE '%Valid%'

UNION

-- Address Two --
SELECT DISTINCT DimCustomerId, SourceSystem, SSID
	, Prefix, FirstName, MiddleName, LastName, Suffix, FullName, NameDirtyHash, NameIsCleanStatus, NameMasterId
	, AddressTwoStreet Street, AddressTwoSuite Suite, AddressTwoCity City, AddressTwoState [State], AddressTwoZip Zip, AddressTwoPlus4 Plus4
	, AddressTwoCounty County, AddressTwoCountry Country--, AddressTwoLatitude Latitude, AddressTwoLongitude Longitude
	, AddressTwoDirtyHash AddressDirtyHash, AddressTwoIsCleanStatus AddressIsCleanStatus
	--, AddressTwoStreetNCOAStatus AddressNCOAStatus, AddressTwoMasterId AddressMasterID
	--, 'AddressTwo' AS AddressType
FROM dbo.DimCustomer (NOLOCK)
WHERE AddressTwoIsCleanStatus LIKE '%Valid%'
	AND NameIsCleanStatus LIKE '%Valid%'

UNION

-- Address Three --
SELECT DISTINCT DimCustomerId, SourceSystem, SSID
	, Prefix, FirstName, MiddleName, LastName, Suffix, FullName, NameDirtyHash, NameIsCleanStatus, NameMasterId
	, AddressThreeStreet Street, AddressThreeSuite Suite, AddressThreeCity City, AddressThreeState [State], AddressThreeZip Zip, AddressThreePlus4 Plus4
	, AddressThreeCounty County, AddressThreeCountry Country--, AddressThreeLatitude Latitude, AddressThreeLongitude Longitude
	, AddressThreeDirtyHash AddressDirtyHash, AddressThreeIsCleanStatus AddressIsCleanStatus
	--, AddressThreeStreetNCOAStatus AddressNCOAStatus, AddressThreeMasterId AddressMasterID
	--, 'AddressThree' AS AddressType
FROM dbo.DimCustomer (NOLOCK)
WHERE AddressThreeIsCleanStatus LIKE '%Valid%'
	AND NameIsCleanStatus LIKE '%Valid%'

UNION

-- Address Four --
SELECT DISTINCT DimCustomerId, SourceSystem, SSID
	, Prefix, FirstName, MiddleName, LastName, Suffix, FullName, NameDirtyHash, NameIsCleanStatus, NameMasterId
	, AddressFourStreet Street, AddressFourSuite Suite, AddressFourCity City, AddressFourState [State], AddressFourZip Zip, AddressFourPlus4 Plus4
	, AddressFourCounty County, AddressFourCountry Country--, AddressFourLatitude Latitude, AddressFourLongitude Longitude
	, AddressFourDirtyHash AddressDirtyHash, AddressFourIsCleanStatus AddressIsCleanStatus
	--, AddressFourStreetNCOAStatus AddressNCOAStatus, AddressFourMasterId AddressMasterID
	--, 'AddressFour' AS AddressType
FROM dbo.DimCustomer (NOLOCK)
WHERE AddressFourIsCleanStatus LIKE '%Valid%'
	AND NameIsCleanStatus LIKE '%Valid%'


-- Total Records (3018-03-27): 
GO
