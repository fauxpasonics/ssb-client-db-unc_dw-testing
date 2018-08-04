SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [sas].[vw_Neulion_CusData]
AS

SELECT n.[Member ID] MemberID
	, CAST(c.[District Abbr] AS NVARCHAR(255)) DistrictAbbr
	, CAST(n.[Davie ID] AS NVARCHAR(255)) DavieID
	, CAST(c.[Name] AS NVARCHAR(255)) [Name]
	, CAST(c.Salutation AS NVARCHAR(255)) Salutation
	, CAST(n.[Primary Contact] AS NVARCHAR(255)) PrimaryContact
	, CAST(n.[Secondary Contact] AS NVARCHAR(255)) SecondaryContact
	, CAST(d.[Donor Status] AS NVARCHAR(255)) DonorStatus
	, CAST(n.[Donor Status Mod Date] AS DATE) DonorStatusModDate
	, CAST(n.[Prospect Stage] AS NVARCHAR(255)) ProspectStage
	, CAST(n.[Years Received YA Credit] AS NVARCHAR(255)) YearsReceivedYACredit
	, CAST(n.[Highest Giving Level Requirement] AS NVARCHAR(255)) HighestGivingLevelRequirement
	, CAST(n.[Employer (Touchpoints)] AS NVARCHAR(255)) Employer
	, CAST(n.[Title (Touchpoints)] AS NVARCHAR(255)) Title
	, CAST(n.[Matching Gift Ratio (Touchpoints)] AS NVARCHAR(255)) MatchingGiftRatio
	, CAST(n.[Match Min (Touchpoints)] AS NVARCHAR(255)) MatchMin
	, CAST(n.[Match Max (Touchpoints)] AS NVARCHAR(255)) MatchMax
	, CAST(n.[Years the Donor Has Upgraded] AS NVARCHAR(255)) YearsDonorHasUpgraded
	, CAST(n.[Years the Donor has Downgraded] AS NVARCHAR(255)) YearsDonorHasDowngraded
	, CAST(n.[Years the Donor has given 110%] AS NVARCHAR(255)) YearsDonorHasGiven110Percent
	, CAST(n.[SR Years] AS NVARCHAR(255)) SRYears
	, CAST(n.[Previous Types of Payment] AS NVARCHAR(255)) PreviousTypesOfPayment
	, CAST(n.[Years as Student Ram] AS NVARCHAR(255)) YearsAsStudentRam
	, CAST(n.[AF Sign Up] AS NVARCHAR(255)) AFSignUp
	, CAST(n.[IMG Staff Member] AS NVARCHAR(255)) IMGStaffMember
	, CAST(n.[IMG Signup] AS NVARCHAR(255)) IMGSignup
	, TRY_CAST(n.[Date of Birth] AS DATE) BirthDate
	, n.[Number of Courtside Passes (Men's Basketball)] NumberOfCourtsidePassesMensBasketball
	, n.[Number of Peebles Passes (Men's Basketball)] NumberOfPeeblesPassesMensBasketball
	, TRY_CAST(n.[Date Joined] AS DATE) DateJoined
	, CAST(n.[DQ AF16] AS NVARCHAR(255)) DQAF16
	, CAST(n.[DQ AF15] AS NVARCHAR(255)) DQAF15
	, CAST(n.[DQ AF14] AS NVARCHAR(255)) DQAF14
	, CAST(n.[DQ AF13] AS NVARCHAR(255)) DQAF13
	, CAST(n.[DQ AF12] AS NVARCHAR(255)) DQAF12
	, CAST(n.[DQ AF11] AS NVARCHAR(255)) DQAF11
	, CAST(n.[DQ AF10] AS NVARCHAR(255)) DQAF10
	, CAST(n.[Endowed Scholarships] AS NVARCHAR(255)) EndowedScholarships
	, CAST(n.[WE Prospect Rating] AS NVARCHAR(255)) WEProspectRating
	, CAST(n.[WE Net Worth] AS NVARCHAR(255)) WENetWorth
	, CAST(n.[WE Gift Capacity Range] AS NVARCHAR(255)) WEGiftCapacityRange
	, CAST(n.[Abilitec ID] AS NVARCHAR(255)) AbilitecID
	, CAST(n.[Abilitec ID Duplicate?] AS NVARCHAR(255)) AbilitecIDDuplicate
	, n.[Consecutive Years Giving] ConsecutiveYearsGiving
	, n.[Total Years Giving] TotalYearsGiving
	, CAST(n.ExecBoard AS NVARCHAR(255)) ExecBoard
	, CAST(n.BoardAdvisors AS NVARCHAR(255)) BoardAdvisors
	, CAST(n.PastPresident AS NVARCHAR(255)) PastPresident
	, CAST(n.[Board of Trustees] AS NVARCHAR(255)) BoardOfTrustees
	, CAST(n.[Big Hitter] AS NVARCHAR(255)) BigHitter
	, CAST(n.Campaigns AS NVARCHAR(255)) Campaigns
	, n.[Active Date] ActiveDate
	, CAST(n.[RC Primary Title] AS NVARCHAR(255)) PrimaryTitle
	, CAST(n.[RC Primary First] AS NVARCHAR(255)) PrimaryFirst
	, CAST(n.[RC Primary Middle] AS NVARCHAR(255)) PrimaryMiddle
	, CAST(n.[RC Primary Last] AS NVARCHAR(255)) PrimaryLast
	, CAST(n.[RC Primary Suf] AS NVARCHAR(255)) PrimarySuffix
	, CAST(n.[RC Primary Salutation] AS NVARCHAR(255)) PrimarySalutation
	, CAST(n.[RC Secondary Title] AS NVARCHAR(255)) SecondaryTitle
	, CAST(n.[RC Secondary First] AS NVARCHAR(255)) SecondaryFirst
	, CAST(n.[RC Secondary Middle] AS NVARCHAR(255)) SecondaryMiddle
	, CAST(n.[RC Secondary Last] AS NVARCHAR(255)) SecondaryLast
	, CAST(n.[RC Secondary Suf] AS NVARCHAR(255)) SecondarySuffix
	, CAST(n.[RC Secondary Salutation] AS NVARCHAR(255)) SecondarySalutation
	, CAST(n.[RC Secondary Maiden] AS NVARCHAR(255)) SecondaryMaiden
	, CAST(n.[RC Contact Info Notes] AS NVARCHAR(255)) ContactInfoNotes
	, CAST(n.[RC Other Account Name] AS NVARCHAR(255)) OtherAccountName
	, CAST(n.[RC Business Name] AS NVARCHAR(255)) BusinessName
	, CAST(n.[AF06 Retention] AS NVARCHAR(255)) AF06Retention
	, CAST(n.[AF07 Retention] AS NVARCHAR(255)) AF07Retention
	, CAST(n.[AF08 Retention] AS NVARCHAR(255)) AF08Retention
	, CAST(n.[AF09 Retention] AS NVARCHAR(255)) AF09Retention
	, CAST(n.[AF10 Retention] AS NVARCHAR(255)) AF10Retention
	, CAST(n.[AF11 Retention] AS NVARCHAR(255)) AF11Retention
	, CAST(n.[AF12 Retention] AS NVARCHAR(255)) AF12Retention
	, CAST(n.[AF13 Retention] AS NVARCHAR(255)) AF13Retention
	, CAST(n.[AF14 Retention] AS NVARCHAR(255)) AF14Retention
	, CAST(n.[AF15 Retention] AS NVARCHAR(255)) AF15Retention
	, CAST(n.[AF16 Retention] AS NVARCHAR(255)) AF16Retention
	, CAST(n.[AF17 Retention] AS NVARCHAR(255)) AF17Retention
	, CAST(n.[Referring Member] AS NVARCHAR(255)) ReferringMember
	, CAST(n.[Number Referred Members] AS NVARCHAR(255)) NumberReferredMembers
	, CAST(n.[Value Referred Members] AS NVARCHAR(255)) ValueReferredMembers
	, CAST(n.[Referral Credit Issued] AS NVARCHAR(255)) ReferralCreditIssued
	, CAST(n.[New Member Call] AS NVARCHAR(255)) NewMemberCall
	, CAST(n.[Promo Code] AS NVARCHAR(255)) PromoCode
	, CAST(n.[Need to contact donor] AS NVARCHAR(255)) NeedToContactDonor
	, CAST(n.[Assigned need to contact] AS NVARCHAR(255)) AssignedNeedToContact
	, CAST(n.[UNC Athletics Staff] AS NVARCHAR(255)) UNCAthleticsStaff
	, CAST(n.[Prefer ecommunication] AS NVARCHAR(255)) PreferECommunication
	, CAST(n.[Do Not Solicit] AS NVARCHAR(255)) DoNotSolicit
	, CAST(n.[Only eBill] AS NVARCHAR(255)) OnlyEBill
	, CAST(n.[Do Not Email] AS NVARCHAR(255)) DoNotEmail
	, CAST(n.[Do Not Call] AS NVARCHAR(255)) DoNotCall
	, CAST(n.[Do Not Mail] AS NVARCHAR(255)) DoNotMail
	, CAST(n.[Do Not SMS] AS NVARCHAR(255)) DoNotSMS
	, CAST(n.[Membership Packet Sent Date] AS NVARCHAR(255)) MembershipPacketSentDate
	, CAST(n.[RC Special Code] AS NVARCHAR(255)) RCSpecialCode
	, n.[Last Login Date] LastLoginDate
	, n.ETL_CREATED_DATE ETL_CreatedDate
	, n.ETL_LUPDATED_DATE ETL_UpdatedDate
	, n.EFF_BEG_DATE ExportDate
	, n.ETL_CREATED_DATE CreatedDate
	, n.ETL_LUPDATED_DATE LastUpdatedDate
FROM etl.vw_Neulion_CusData n
LEFT JOIN etl.vw_Neulion_Contact c
	ON n.[Member ID] = c.[Member ID]
LEFT JOIN etl.vw_Neulion_Designation d
	ON n.[Member ID] = d.[Member ID]
WHERE n.[Member ID] NOT IN (SELECT DISTINCT [Member ID]
							FROM  src.SaasMerge (NOLOCK))

GO
