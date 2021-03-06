SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_Neulion_Customer]
AS

SELECT  dc.SSB_CRMSYSTEM_CONTACT_ID ,
        CAST(dc.SSB_CRMSYSTEM_PRIMARY_FLAG AS BIT) SSB_CRMSYSTEM_PRIMARY_FLAG ,
        dc.DimCustomerSSBID ,
        dc.DimCustomerId ,
		dc.SourceSystem,
        TRY_CAST(dc.SSID AS INT) AS MemberID,
        nc.DavieID,
		nc.AccountStatus,
		nc.ChapterName,
		nc.DistrictAbbr,
		cd.PrimaryContact,
		cd.PrimaryTitle,
		cd.PrimaryFirst,
		cd.PrimaryMiddle,
		cd.PrimaryLast,
		cd.PrimarySuffix,
		cd.PrimarySalutation,
		cd.SecondaryTitle,
		cd.SecondaryFirst,
		cd.SecondaryMiddle,
		cd.SecondaryLast,
		cd.SecondarySuffix,
		cd.SecondarySalutation,
		cd.SecondaryMaiden,
		nc.SpouseName,
		nc.SpouseTitle,
		nc.DonorStatus,
		cd.YearsReceivedYACredit,
		cd.HighestGivingLevelRequirement,
        cd.Employer ,
        cd.MatchingGiftRatio ,
        cd.MatchMin ,
        cd.MatchMax ,
        cd.YearsDonorHasUpgraded ,
        cd.YearsDonorHasDowngraded ,
        cd.YearsDonorHasGiven110Percent ,
        cd.SRYears ,
        cd.PreviousTypesofPayment ,
        cd.YearsasStudentRam ,
        cd.AFSignUp ,
        cd.IMGStaffMember ,
        cd.IMGSignup ,
        nc.DonorStatusModDate ,
        cd.ActiveDate ,
        cd.LastLoginDate ,
        cd.NumberOfCourtsidePassesMensBasketball NumberOfCourtsidePassesMB ,
        cd.NumberOfPeeblesPassesMensBasketball NumberOfPeeblesPassesMB ,
        nc.DateJoined ,
		CAST(NULL AS NVARCHAR(100)) AS DQAF25 ,
        CAST(NULL AS NVARCHAR(100)) AS DQAF24 ,
        CAST(NULL AS NVARCHAR(100)) AS DQAF23 ,
        CAST(NULL AS NVARCHAR(100)) AS DQAF22 ,
        CAST(NULL AS NVARCHAR(100)) AS DQAF21 ,
        CAST(NULL AS NVARCHAR(100)) AS DQAF20 ,
        CAST(NULL AS NVARCHAR(100)) AS DQAF19 ,
        CAST(NULL AS NVARCHAR(100)) AS DQAF18 ,
        CAST(NULL AS NVARCHAR(100)) AS DQAF17,
        cd.DQAF16 ,
        cd.DQAF15 ,
        cd.DQAF14 ,
        cd.DQAF13 ,
        cd.DQAF12 ,
        cd.DQAF11 ,
        cd.DQAF10 ,
        cd.EndowedScholarships ,
        cd.WEProspectRating ,
        cd.WENetWorth ,
        cd.WEGiftCapacityRange ,
        cd.AbilitecID ,
        cd.[AbilitecIDDuplicate] AS AbilitecIDDuplicate ,
        cd.ConsecutiveYearsGiving ,
        cd.TotalYearsGiving ,
        nc.[NamePhoneEmailModDate] AS NamePhoneEmailModDate ,
        nc.MostRecentContactChangeDate ,
        cd.ExecBoard ,
        cd.BoardAdvisors ,
        cd.PastPresident ,
        cd.BoardofTrustees ,
        cd.BigHitter,
		dc.DoNotMail,
		dc.DoNotEmail,
		dc.DoNotCall,
		dc.CustomerType,
		dc.CustomerStatus,
		cd.ContactInfoNotes,
		cd.BusinessName,
		nc.BirthDate,
		cd.Campaigns,
		cd.OtherAccountName,
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
		dc.IsPrimaryNeulionMember,
		dc.NeulionSalutation
FROM    sas.vw_DimCustomer dc WITH (NOLOCK) 
LEFT JOIN sas.vw_Neulion_Contact nc WITH (NOLOCK)
	ON TRY_CAST(dc.SSID AS INT) = nc.MemberID
LEFT JOIN sas.vw_Neulion_CusData cd WITH (NOLOCK)
	ON TRY_CAST(dc.SSID AS INT) = cd.MemberID
WHERE   (dc.SourceSystem = 'Neulion' OR dc.SourceSystem = 'NeulionSpouse');

GO
