SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--Composite Record
CREATE VIEW [sas].[vw_CompositeRecord_CS]
AS
SELECT  cr.SSB_CRMSYSTEM_CONTACT_ID,
		DimCustomerId ,
        SourceDB ,
        SourceSystem ,
        SSID ,
        CustomerType ,
        CustomerStatus ,
        CompanyName ,
        SalutationName ,
        DonorMailName ,
        DonorFormalName ,
        Birthday ,
        Gender ,
        MergedRecordFlag ,
        Prefix ,
        FirstName ,
        MiddleName ,
        LastName ,
        Suffix ,
        AddressPrimaryStreet ,
        AddressPrimaryCity ,
        AddressPrimaryState ,
        AddressPrimaryZip ,
        AddressPrimaryCounty ,
        AddressPrimaryCountry ,
        AddressOneStreet ,
        AddressOneCity ,
        AddressOneState ,
        AddressOneZip ,
        AddressOneCounty ,
        AddressOneCountry ,
        AddressTwoStreet ,
        AddressTwoCity ,
        AddressTwoState ,
        AddressTwoZip ,
        AddressTwoCounty ,
        AddressTwoCountry ,
        AddressThreeStreet ,
        AddressThreeCity ,
        AddressThreeState ,
        AddressThreeZip ,
        AddressThreeCounty ,
        AddressThreeCountry ,
        AddressFourStreet ,
        AddressFourCity ,
        AddressFourState ,
        AddressFourZip ,
        AddressFourCounty ,
        AddressFourCountry ,
        PhonePrimary ,
        PhoneHome ,
        PhoneCell ,
        PhoneBusiness ,
        PhoneFax ,
        PhoneOther ,
        EmailPrimary ,
        EmailOne ,
        EmailTwo ,
		CAST(PhonePrimaryDNC AS INT) AS DoNotCall,
        TRY_CAST(ExtAttribute1 AS INT) AS DoNotMail ,
        TRY_CAST(ExtAttribute2 AS INT) AS DoNotEmail ,
        SSCreatedBy ,
        SSUpdatedBy ,
        SSCreatedDate ,
        SSUpdatedDate ,
        CreatedBy ,
        UpdatedBy ,
        CreatedDate ,
        UpdatedDate ,
        AccountId ,
        CAST(IsBusiness AS INT) AS IsBusiness ,
        FullName ,
		cr.AddressPrimaryLatitude,
        AddressPrimaryLongitude ,
        AddressOneLatitude ,
        AddressOneLongitude ,
        AddressTwoLatitude ,
        AddressTwoLongitude ,
        AddressThreeLatitude ,
        AddressThreeLongitude ,
        AddressFourLatitude ,
        AddressFourLongitude ,
        CD_Gender,
		h.HouseholdID,
		h.HouseholdLookupID,
		h.IsPrimaryMember
FROM    mdm.compositerecord_cs cr (NOLOCK)
LEFT JOIN ods.BB_Household h ON cr.SSID = CAST(h.ID AS NVARCHAR(100))
WHERE cr.IsDeleted <> 1;      





GO
