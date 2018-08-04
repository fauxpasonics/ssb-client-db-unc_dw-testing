SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_rpt_RamsClubDonations]
AS


SELECT
	cr.SSB_CRMSYSTEM_CONTACT_ID
	, cr.FirstName
	, cr.LastName
	, nc.MemberID
	, CAST(nca.DonorStatus AS NVARCHAR(100)) DonorStatus
	, CAST(nc.AccountStatus AS NVARCHAR(100)) AccountStatus
	, CAST(CASE WHEN nca.[DonorStatus] IN ('Active Group Member', 'Active Member', 'Active Student Ram', 'Active No Benefits', 'Active - Complementary') THEN 'Active Member'
							WHEN nca.[DonorStatus] = 'Active Group Account' THEN 'Active Group'
							WHEN nca.[DonorStatus] IN ('Deliquent Downgrade', 'Delinquent', 'Delinquent Group Account', 'Delinquent Group Member') THEN 'Delinquent Member'
							WHEN nca.[DonorStatus] IN ('Account suspended for benefit rights', 'Inactive member') THEN 'Inactive Member'
							WHEN nca.[DonorStatus] = 'Deceased Member' THEN 'Deceased Member'
							WHEN nca.[DonorStatus] IN ('ClosedAccount - Historical', 'Duplicate', 'Former Group Account-Closed', 'Former Group Mem Acct - Closed') THEN 'Closed'
							ELSE 'Not Member'
							END AS NVARCHAR(50)) AS [CustomerStatus]
	, nc.[Rank]
	, nc.Points
	, nc.LifetimeGivingAmount
	, nc.LifetimePledges
	, nc.LifetimePaid
	, nc.LargestGiftAmount
	, nc.LargestGiftDate
	, CAST(nc.LargestGiftFund AS NVARCHAR(100)) LargestGiftFund
	, nc.FirstPaidDateToAnnualFund
	, nc.LastPaidDateToAnnualFund
	, nc.LastFYPaidToAnnualFund
	, nc.UniversityCampaign2022Pledged
	, nc.UniversityCampaign2022Paid
	, nc.AllGiftsFY18
	, nc.AllGiftsFY17
	, nc.AllGiftsFY16
	, nc.AllGiftsFY15
	, nc.AllGiftsFY14
	, nc.AllGiftsFY13
	, nc.AllGiftsFY12
	, nc.AllGiftsFY11
	, nc.AllGiftsFY10
	, nc.AllGiftsFY09
	, CAST(REPLACE(nc.Status18,'**','') AS NVARCHAR(100)) Status18
	, nc.Pledge18
	, nc.Paid18
	, nc.Balance18
	, CAST(REPLACE(nc.Status17,'**','') AS NVARCHAR(100)) Status17
	, nc.Pledge17
	, nc.Paid17
	, nc.Balance17
	, CAST(REPLACE(nc.Status16,'**','') AS NVARCHAR(100)) Status16
	, nc.Pledge16
	, nc.Paid16
	, nc.Balance16
	, CAST(REPLACE(nc.Status15,'**','') AS NVARCHAR(100)) Status15
	, nc.Pledge15
	, nc.Paid15
	, nc.Balance15
	, CAST(REPLACE(nc.Status14,'**','') AS NVARCHAR(100)) Status14
	, nc.Paid14
	, CAST(REPLACE(nc.Status13,'**','') AS NVARCHAR(100)) Status13
	, nc.Paid13
	, CAST(REPLACE(nc.Status12,'**','') AS NVARCHAR(100)) Status12
	, nc.Paid12
	, CAST(REPLACE(nc.Status11,'**','') AS NVARCHAR(100)) Status11
	, nc.Paid11
	, CAST(REPLACE(nc.Status10,'**','') AS NVARCHAR(100)) Status10
	, nc.Paid10
	, CAST(REPLACE(nc.Status09,'**','') AS NVARCHAR(100)) Status09
	, nc.Paid09
	, CAST(REPLACE(nc.Status08,'**','') AS NVARCHAR(100)) Status08
	, nc.Paid08
	, CAST(REPLACE(nc.Status07,'**','') AS NVARCHAR(100)) Status07
	, nc.Paid07
	, CAST(nc.YA2018 AS NVARCHAR(100)) YA2018
	, CAST(nc.YA2017 AS NVARCHAR(100)) YA2017
	, CAST(nc.YA2016 AS NVARCHAR(100)) YA2016
	, CAST(nc.YA2015 AS NVARCHAR(100)) YA2015
	, CAST(nc.YA2014 AS NVARCHAR(100)) YA2014
	, CAST(ncd.DQAF16 AS NVARCHAR(100)) DQAF16
	, CAST(ncd.DQAF15 AS NVARCHAR(100)) DQAF15
	, CAST(ncd.DQAF14 AS NVARCHAR(100)) DQAF14
	, CAST(ncd.DQAF13 AS NVARCHAR(100)) DQAF13
	, CAST(ncd.DQAF12 AS NVARCHAR(100)) DQAF12
	, CAST(ncd.DQAF11 AS NVARCHAR(100)) DQAF11
	, CAST(ncd.DQAF10 AS NVARCHAR(100)) DQAF10
	, ncd.TotalYearsGiving
	, CAST(ncd.YearsAsStudentRam AS NVARCHAR(100)) YearsAsStudentRam
	, ncd.ConsecutiveYearsGiving
	, CAST(ncd.YearsReceivedYACredit AS NVARCHAR(100)) YearsReceivedYACredit
	, CAST(ncd.YearsDonorHasUpgraded AS NVARCHAR(100)) YearsDonorHasUpgraded
	, CAST(ncd.YearsDonorHasDowngraded AS NVARCHAR(100)) YearsDonorHasDowngraded
	, CAST(ncd.YearsDonorHasGiven110Percent AS NVARCHAR(100)) YearsDonorHasGiven110Percent
	, CAST(nc.CarDealer AS NVARCHAR(100)) CarDealer
	, CAST(nc.InsurancePolicy AS NVARCHAR(100)) InsurancePolicy
	, CAST(nc.EndowmentRequirement AS NVARCHAR(100)) EndowmentRequirement
	, CAST(nc.BlueZoneRequirement AS NVARCHAR(100)) BlueZoneRequirement
	, CAST(nc.EndowmentHeir AS NVARCHAR(100)) EndowmentHeir
	, CAST(nc.Endowment750KMB AS NVARCHAR(100)) Endowment750KMB
	, nc.EndowmentPd750KMB
	, CAST(nc.Endowment500KMB AS NVARCHAR(100)) Endowment500KMB
	, nc.EndowmentPd500KMB
	, CAST(nc.Endowment500K AS NVARCHAR(100)) Endowment500K
	, nc.EndowmentPd500K
	, CAST(nc.Endowment200K AS NVARCHAR(100)) Endowment200K
	, nc.EndowmentPd200K
	, CAST(nc.Endowment150K AS NVARCHAR(100)) Endowment150K
	, nc.EndowmentPd150K
	, CAST(nc.Endowment100K AS NVARCHAR(100)) Endowment100K
	, nc.EndowmentPd100K
	, CAST(nc.Endowment75K AS NVARCHAR(100)) Endowment75K
	, nc.EndowmentPd75K
	, CAST(nc.Endowment35K_50K AS NVARCHAR(100)) Endowment35K_50K
	, nc.EndowmentPd35K_50K
	, CAST(nc.HalfEndowment100K AS NVARCHAR(100)) HalfEndowment100K
	, nc.HalfEndowmentPd100K
	, CAST(nc.HalfEndowment75K AS NVARCHAR(100)) HalfEndowment75K
	, nc.HalfEndowmentPd75K
	, CAST(nc.HalfEndowment50K AS NVARCHAR(100)) HalfEndowment50K
	, nc.HalfEndowmentPd50K
	, CAST(nc.HalfEndowment40K AS NVARCHAR(100)) HalfEndowment40K
	, nc.HalfEndowmentPd40K
	, CAST(nc.Life30KSR AS NVARCHAR(100)) Life30KSR
	, nc.LifePd30KSR
	, CAST(nc.Life20KSR AS NVARCHAR(100)) Life20KSR
	, nc.LifePd20KSR
	, CAST(nc.Life15KBR AS NVARCHAR(100)) Life15KSR
	, nc.LifePd15KBR
	, CAST(nc.Life10KBR AS NVARCHAR(100)) Life10KSR
	, nc.LifePd10KBR
	, nc.SmithCenterHeir
	, nc.CBFFPledged
	, nc.CBFFPaid
	, nc.EndowDonor
	, nc.EndowPledged
	, nc.EndowPaid
	, nc.InsurHeir
	, nc.SPECPROJLevel
	, nc.SPECPROJPledged
	, nc.SPECPROJPaid
	, nc.SPECPROJBalance
	, nc.BasketballPracticeFacility
	, nc.BosStaMaintenanceEndow
	, nc.BoshamerStadiumRenovation
	, nc.BosMLBVisitorsLkrRmAndTeamRoom
	, nc.BoshamerStadiumImprovements
	, nc.BoshamerStadium_Videoboard
	, nc.BrickCamp_SportsMedFacility
	, nc.CheerleadingPrideFloorNamingOp
	, nc.FootballPracticeComplex
	, nc.FootballCoachesLockerRoom
	, nc.FootballSpecialFunds
	, nc.FinleyClubhousePro
	, nc.FieldHockeyStadiumNewRenov
	, nc.GymnasticsPracticeFacility
	, nc.HenryStadiumTurfProject
	, nc.JGFballMngrScholEndo
	, nc.KouryBoxMezzanineProgram
	, nc.KenanStadiumExpansion
	, nc.RG70sUNCMensLXFilmRoomKenanExp
	, nc.KR_UNCLXHeadCoachsOfficeinMem
	, nc.LacrosseLkrRoom_KenanExpansion
	, nc.LockerRoomProjectBosSta
	, nc.NutritionCenter_KenanExpansion
	, nc.SoftballHittingFacility
	, nc.SCBasketballOfficesRenov
	, nc.SCLockerSuiteRenov
	, nc.Misc_SoccerLkrRoomRenov
	, nc.SoccerLXStadium_FutureDesig
	, nc.SportsMedicineFacilityProj
	, nc.SportsMedicine_MTPerfRehabArea
	, nc.TrackAndFieldSoundSystem
	, nc.VolleyballLockerRoomProject
	, nc.ErnieWilliamsonAthleticsCenter
	, nc.WresGymLockerRoomProject
	, nc.WillieScroggsLockerRoomProject
	, nc.AcademicSCOperatingEndo
	, nc.CharlieJusticeFootballOpEndo
	, nc.FootballOperatingEndowment
	, nc.BaseballOperatingEndowment
	, nc.EugeneFBrighamTnFieldOpEndo
	, nc.CaroFamilyBBProject
	, nc.CaroLeadershipAcademyEndo
	, nc.MnWCrossCountryOperatingEndo
	, nc.CaroFBLettermensOperatingEndo
	, nc.MensBasketballExcellenceFund
	, nc.MnWFencingOperatingEndo
	, nc.FieldHockeyOperatingEndowment
	, nc.GymnasticsOperatingEndowment
	, nc.JVBasketballOperatingEndowment
	, nc.JKnoxHillmanMemorialSchol
	, nc.JoeMadduxFBOperatingEndo
	, nc.The22Club_FBOperatingEndo
	, nc.WKEndoforWomensSoccerHonorofBS
	, nc.MnWTrackOperatingEndo
	, nc.MensBBOperatingEndo
	, nc.MensGolfOperatingEndowment
	, nc.VolleyballOperatingEndowment
	, nc.NoahKDuncanMemorialScholarship
	, nc.MensSoccerOperatingEndowment
	, nc.ThePopePerformanceFund
	, nc.WomensLXOperatingEndo
	, nc.DeanSmithScholarshipEndowment
	, nc.MensTennisOperatingEndowment
	, nc.WomensBBOperatingEndo
	, nc.WomensGolfOperatingEndowment
	, nc.MensLacrosseOperatingEndowment
	, nc.WomensSoccerOperatingEndowment
	, nc.EndowmentInsurancePolicy
	, nc.RowingOperatingEndowment
	, nc.Endowment_CampaignCarolina
	, nc.WomensTennisOperatingEndowment
	, nc.SoftballOperatingEndowment
	, nc.WomensSportsEndowment
	, nc.FrankComfortScholEndo
	, nc.CaroSnDOperatingEndo
	, nc.WrestlingOperatingEndowment
FROM sas.vw_Neulion_Contrib nc WITH (NOLOCK)
JOIN dbo.dimcustomerssbid dcssbid (NOLOCK) 
	ON dcssbid.SSID = nc.MemberID
JOIN mdm.compositerecord cr (NOLOCK)
	ON cr.SSB_CRMSYSTEM_CONTACT_ID = dcssbid.SSB_CRMSYSTEM_CONTACT_ID
JOIN sas.vw_Neulion_Contact nca (NOLOCK)
	ON nc.MemberID = nca.MemberID
LEFT JOIN sas.vw_Neulion_CusData ncd (NOLOCK)
	ON nc.MemberID = ncd.MemberID
WHERE dcssbid.SourceSystem = 'Neulion'

GO
