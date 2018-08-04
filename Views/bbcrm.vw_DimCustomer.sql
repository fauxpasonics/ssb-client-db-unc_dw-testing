SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [bbcrm].[vw_DimCustomer]
AS
    SELECT  SSB_CRMSYSTEM_CONTACT_ID,
			dc.DimCustomerId ,
            dc.SourceDB ,
            dc.SourceSystem ,
            dc.SSID ,
            CustomerType ,
            CustomerStatus ,
            CompanyName ,
            Birthday ,
            Gender ,
			CASE WHEN  isbusiness = 1 THEN NULL ELSE  Prefix END AS Prefix,
            CASE WHEN  isbusiness = 1 THEN NULL ELSE  FirstName END AS FirstName,
            CASE WHEN  isbusiness = 1 THEN NULL ELSE  MiddleName END AS MiddleName,
			CASE WHEN  isbusiness = 1 THEN NULL ELSE  LastName END AS LastName,
			CASE WHEN  isbusiness = 1 THEN NULL ELSE  Suffix END AS Suffix,
			NameIsCleanStatus,
            AddressPrimaryStreet ,
			AddressPrimarySuite,
            AddressPrimaryCity ,
            AddressPrimaryState ,
            AddressPrimaryZip ,
			AddressPrimaryPlus4,
            AddressPrimaryCounty ,
            AddressPrimaryCountry ,
			AddressPrimaryLatitude,
            AddressPrimaryLongitude,
			AddressPrimaryIsCleanStatus,
            AddressOneStreet ,
			AddressOneSuite,
            AddressOneCity ,
            AddressOneState ,
            AddressOneZip ,
            AddressOneCounty ,
            AddressOneCountry ,
			AddressOneIsCleanStatus,
            AddressTwoStreet ,
			AddressTwoSuite,
            AddressTwoCity ,
            AddressTwoState ,
            AddressTwoZip ,
            AddressTwoCounty ,
            AddressTwoCountry ,
			AddressTwoIsCleanStatus,
            AddressThreeStreet ,
			AddressThreeSuite,
            AddressThreeCity ,
            AddressThreeState ,
            AddressThreeZip ,
            AddressThreeCounty ,
            AddressThreeCountry ,
			AddressThreeIsCleanStatus,
            AddressFourStreet ,
			AddressFourSuite,
            AddressFourCity ,
            AddressFourState ,
            AddressFourZip ,
            AddressFourCounty ,
            AddressFourCountry ,
			AddressFourIsCleanStatus,
            PhonePrimary ,
            PhonePrimaryIsCleanStatus,
            PhoneHome ,
			PhoneHomeIsCleanStatus,
            PhoneCell ,
			PhoneCellIsCleanStatus,
            PhoneBusiness ,
			PhoneBusinessIsCleanStatus,
            PhoneFax ,
			PhoneFaxIsCleanStatus,
            PhoneOther ,
			PhoneOtherIsCleanStatus,
            EmailPrimary ,
			EmailPrimaryIsCleanStatus,
            EmailOne ,
			EmailOneIsCleanStatus,
            EmailTwo ,
			EmailTwoIsCleanStatus,
			dc.CD_Gender InferredGender,
            dc.ExtAttribute1 DoNotMail ,
            dc.ExtAttribute2 DoNotEmail ,
			dc.PhonePrimaryDNC DoNotCall,
            SSCreatedBy ,
            SSUpdatedBy ,
            SSCreatedDate ,
            SSUpdatedDate ,
            dc.CreatedBy ,
            dc.UpdatedBy ,
            dc.CreatedDate ,
            dc.UpdatedDate ,
            AccountId ,
            AddressPrimaryNCOAStatus ,
            AddressOneStreetNCOAStatus ,
            AddressTwoStreetNCOAStatus ,
            AddressThreeStreetNCOAStatus ,
            AddressFourStreetNCOAStatus ,
            CAST(IsBusiness AS INT) AS IsBusiness ,
            FullName ,
            CAST(SSB_CRMSYSTEM_PRIMARY_FLAG AS BIT) SSB_CRMSYSTEM_PRIMARY_FLAG ,
            dc.customer_matchkey CustomerMatchkey,
			DimCustomerSSBID,
			CASE WHEN dc.SourceSystem = 'Pac' THEN pa.LAST_DATETIME
				WHEN dc.SourceSystem = 'Blackbaud' THEN ba.DATECHANGED
				END  AddressUpdateDate
    FROM	dbo.DimCustomer dc WITH ( NOLOCK )
	JOIN	dbo.dimcustomerssbid ssbid (NOLOCK) ON dc.DimCustomerId = ssbid.DimCustomerId
	LEFT JOIN dbo.PD_ADDRESS pa (NOLOCK) ON dc.SSID = pa.PATRON AND pa.ADTYPE = 'H'
	LEFT JOIN ods.BB_Address ba (NOLOCK) ON dc.SSID = CAST(ba.CONSTITUENTID AS NVARCHAR(100)) AND ba.ISACTIVE = 1 AND dc.AddressPrimaryStreet = ba.ADDRESSLINE1
    WHERE   (dc.SourceSystem = 'PAC' OR dc.SourceSystem = 'Blackbaud') 


GO