SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vwDimCustomer_ModAcctId]   
AS   
SELECT          
	a.DimCustomerId, a.BatchId, a.ODSRowLastUpdated, a.SourceDB, a.SourceSystem, a.SourceSystemPriority, a.SSID, a.CustomerType, a.CustomerStatus, a.AccountType, a.AccountRep, a.CompanyName,  a.CompanyNameIsCleanStatus,  
	a.SalutationName, a.DonorMailName, a.DonorFormalName, a.Birthday, a.Gender, a.MergedRecordFlag, a.MergedIntoSSID, a.Prefix, a.FirstName, a.MiddleName, a.LastName, a.Suffix, a.NameDirtyHash,    
	a.NameIsCleanStatus, a.NameMasterId, a.AddressPrimaryStreet, a.AddressPrimaryCity, a.AddressPrimaryState, a.AddressPrimaryZip, a.AddressPrimaryCounty, zp.CBSA_Name AS AddressPrimaryCBSA, a.AddressPrimaryCountry, a.AddressPrimaryLatitude, a.AddressPrimaryLongitude,    
	a.AddressPrimaryDirtyHash, a.AddressPrimaryIsCleanStatus, a.AddressPrimaryMasterId, a.ContactDirtyHash, a.ContactGUID, a.AddressOneStreet, a.AddressOneCity, a.AddressOneState, a.AddressOneZip,    
	a.AddressOneCounty, z1.CBSA_Name AS AddressOneCBSA, a.AddressOneCountry, a.AddressOneLatitude, a.AddressOneLongitude, a.AddressOneDirtyHash, a.AddressOneIsCleanStatus, a.AddressOneMasterId, a.AddressTwoStreet, a.AddressTwoCity, a.AddressTwoState, a.AddressTwoZip,    
	a.AddressTwoCounty, z2.CBSA_Name AS AddressTwoCBSA, a.AddressTwoCountry, a.AddressTwoLatitude, a.AddressTwoLongitude, a.AddressTwoDirtyHash, a.AddressTwoIsCleanStatus, a.AddressTwoMasterId, a.AddressThreeStreet, a.AddressThreeCity, a.AddressThreeState, a.AddressThreeZip,    
	a.AddressThreeCounty, z3.CBSA_Name AS AddressThreeCBSA, a.AddressThreeCountry, a.AddressThreeLatitude, a.AddressThreeLongitude, a.AddressThreeDirtyHash, a.AddressThreeIsCleanStatus, a.AddressThreeMasterId, a.AddressFourStreet, a.AddressFourCity, a.AddressFourState,    
	a.AddressFourZip, a.AddressFourCounty, z4.CBSA_Name AS AddressFourCBSA, a.AddressFourCountry, a.AddressFourLatitude, a.AddressFourLongitude, a.AddressFourDirtyHash, a.AddressFourIsCleanStatus, a.AddressFourMasterId,   
	a.PhonePrimary, d.PhonePrimaryLineType, a.PhonePrimaryDirtyHash,a.PhonePrimaryIsCleanStatus, a.PhonePrimaryMasterId,   
	a.PhoneHome, d.PhoneHomeLineType, a.PhoneHomeDirtyHash, a.PhoneHomeIsCleanStatus, a.PhoneHomeMasterId,   
	a.PhoneCell, d.PhoneCellLineType, a.PhoneCellDirtyHash, a.PhoneCellIsCleanStatus, a.PhoneCellMasterId,   
	a.PhoneBusiness, d.PhoneBusinessLineType, a.PhoneBusinessDirtyHash, a.PhoneBusinessIsCleanStatus, a.PhoneBusinessMasterId,   
	a.PhoneFax, d.PhoneFaxLineType, a.PhoneFaxDirtyHash, a.PhoneFaxIsCleanStatus, a.PhoneFaxMasterId,   
	a.PhoneOther, d.PhoneOtherLineType, a.PhoneOtherDirtyHash, a.PhoneOtherIsCleanStatus, a.PhoneOtherMasterId,   
	e.EmailPrimary, e.EmailPrimaryDirtyHash, e.EmailPrimaryIsCleanStatus, a.EmailPrimaryMasterId,   
	e.EmailOne, e.EmailOneDirtyHash, e.EmailOneIsCleanStatus, a.EmailOneMasterId,   
	e.EmailTwo, e.EmailTwoDirtyHash, e.EmailTwoIsCleanStatus, a.EmailTwoMasterId,   
	a.ExtAttribute1, a.ExtAttribute2, a.ExtAttribute3, a.ExtAttribute4, a.ExtAttribute5, a.ExtAttribute6, a.ExtAttribute7, a.ExtAttribute8, a.ExtAttribute9, a.ExtAttribute10, a.ExtAttribute11,    
	a.ExtAttribute12, a.ExtAttribute13, a.ExtAttribute14, a.ExtAttribute15, a.ExtAttribute16, a.ExtAttribute17, a.ExtAttribute18, a.ExtAttribute19, a.ExtAttribute20, a.ExtAttribute21, a.ExtAttribute22, a.ExtAttribute23,    
	a.ExtAttribute24, a.ExtAttribute25, a.ExtAttribute26, a.ExtAttribute27, a.ExtAttribute28, a.ExtAttribute29, a.ExtAttribute30, a.SSCreatedBy, a.SSUpdatedBy, a.SSCreatedDate, a.SSUpdatedDate, a.CreatedBy,    
	a.UpdatedBy, a.CreatedDate, a.UpdatedDate, a.AccountId, a.AddressPrimaryNCOAStatus, a.AddressOneStreetNCOAStatus, a.AddressTwoStreetNCOAStatus, a.AddressThreeStreetNCOAStatus,    
	a.AddressFourStreetNCOAStatus, a.IsDeleted, a.DeleteDate, a.IsBusiness, a.FullName, a.ExtAttribute31, a.ExtAttribute32, a.ExtAttribute33, a.ExtAttribute34, a.ExtAttribute35, a.AddressPrimarySuite,    
	a.AddressOneSuite, a.AddressTwoSuite, a.AddressThreeSuite, a.AddressFourSuite   
	, SSB_CRMSYSTEM_CONTACTACCT_ID SSB_CRMSYSTEM_ACCT_ID   
	--, ISNULL(c.SSB_CRMSYSTEM_ACCT_ID, c.SSB_CRMSYSTEM_CONTACT_ID) AS SSB_CRMSYSTEM_ACCT_ID,    
	, CASE WHEN c.SSB_CRMSYSTEM_ACCT_ID IS NULL THEN 1 ELSE 0 END AS SSB_CRMSYSTEM_ACCTID_IsNull, c.SSB_CRMSYSTEM_CONTACT_ID, c.SSB_CRMSYSTEM_PRIMARY_FLAG   
	, CASE WHEN c.SSB_CRMSYSTEM_ACCT_ID IS NOT NULL AND c.SSB_CRMSYSTEM_ACCT_ID = c.SSB_CRMSYSTEM_CONTACT_ID AND c.SSB_CRMSYSTEM_PRIMARY_FLAG = 1 THEN 1 ELSE 0 END SSB_CRMSYSTEM_ACCT_PRIMARY_CONTACT   
	, c.SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG   
	, CASE WHEN c.SSB_CRMSYSTEM_ACCT_ID IS NULL THEN 0 ELSE 1 END SSB_CRMSYSTEM_IsBusinessAccount   
	, CASE WHEN c.SSB_CRMSYSTEM_ACCT_ID IS NULL AND c.SSB_CRMSYSTEM_PRIMARY_FLAG = 1 THEN 1 ELSE 0 END SSB_CRMSYSTEM_PERSON_PRIMARY_CONTACT   
	, a.customer_matchkey   
	, c.SSB_CRMSYSTEM_HOUSEHOLD_ID, c.SSB_CRMSYSTEM_HOUSEHOLD_PRIMARY_FLAG  
FROM dbo.DimCustomer AS a WITH (NOLOCK)   
LEFT JOIN dbo.DimCustomerSSBID AS c WITH (NOLOCK) ON a.DimCustomerId = c.DimCustomerId   
LEFT JOIN dbo.vw_DimCustomerPhone_PIVOT d ON a.DimCustomerId = d.DimCustomerID  
LEFT JOIN cust.vw_DimCustomerEmail_PIVOT e ON a.DimCustomerId = e.DimCustomerID 
LEFT JOIN dbo.ZipCode zp WITH (NOLOCK) ON a.AddressPrimaryZip = zp.ZipCode  
LEFT JOIN dbo.ZipCode z1 WITH (NOLOCK) ON a.AddressOneZip = z1.ZipCode  
LEFT JOIN dbo.ZipCode z2 WITH (NOLOCK) ON a.AddressTwoZip = z2.ZipCode  
LEFT JOIN dbo.ZipCode z3 WITH (NOLOCK) ON a.AddressThreeZip = z3.ZipCode  
LEFT JOIN dbo.ZipCode z4 WITH (NOLOCK) ON a.AddressFourZip = z4.ZipCode  
WHERE 1=1  
AND a.isdeleted = 0  
;
GO
