SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_BB_Customer]
AS

SELECT  dc.SSB_CRMSYSTEM_CONTACT_ID ,
        CAST(dc.SSB_CRMSYSTEM_PRIMARY_FLAG AS BIT) SSB_CRMSYSTEM_PRIMARY_FLAG ,
        dc.DimCustomerSSBID ,
        dc.DimCustomerId ,
        dc.SSID AS ConstituentID,
        bb.LOOKUPID AS DavieID ,
		CAST(bb.IsInactive AS INT) AS IsInactive,
		CAST(bb.IsConstituent AS INT) AS IsConstituent,
		CAST(bb.IsOrganization AS INT) AS IsOrganization,
		CAST(bb.IsGroup AS INT) AS IsGroup,
		CAST(bb.IsIndividual AS INT) AS IsIndividual,
		CAST(bb.IsConfidential AS INT) AS IsConfidential,
		CAST(bb.GivesAnonymously AS INT) AS GivesAnonymously,
		bb.CareerCode1,
		bb.CareerCode2,
		bb.CareerCode3,
		CAST(bb.DECEASEDCONFIRMATIONCODE AS INT) AS IsDeceased,
		bb.DeceasedConfirmation,
		bb.DeceaseDate,
		bb.PRIMARY_EMPLOYER AS PrimaryEmployer,
		bb.PRIMARY_JOBTITLE AS PrimaryJobTitle,
		CAST(bb.IsRetired AS INT) AS IsRetired,
		CAST(bb.IsSelfEmployed AS INT) AS IsSelfEmployed,
		bb.PrimaryConstituency,
		bb.Nickname,
		bb.GoesBy,
		dc.DoNotEmail,
		dc.DoNotCall,
		dc.DoNotMail,
		dc.CustomerType,
		dc.CustomerStatus,
		dc.NameIsCleanStatus,
		dc.AddressPrimaryIsCleanStatus,
		dc.AddressOneIsCleanStatus,
		dc.AddressTwoIsCleanStatus,
		dc.AddressThreeIsCleanStatus,
		dc.AddressFourIsCleanStatus,
		dc.EmailPrimaryIsCleanStatus,
		dc.EmailOneIsCleanStatus,
		dc.EmailTwoIsCleanStatus,
		dc.PhonePrimaryIsCleanStatus,
		dc.PhoneHomeIsCleanStatus,
		dc.PhoneCellIsCleanStatus,
		dc.PhoneBusinessIsCleanStatus,
		dc.PhoneFaxIsCleanStatus,
		dc.PhoneOtherIsCleanStatus,
		dc.HouseholdID,
		dc.HouseholdLookupID,
		dc.IsPrimaryHouseholdMember
FROM    sas.vw_DimCustomer dc (NOLOCK)
JOIN ods.BB_CONSTITUENT bb (NOLOCK)
		ON dc.SSID = bb.ID
WHERE   dc.SourceSystem = 'Blackbaud'
AND		bb.ISINACTIVE = 0;

GO
