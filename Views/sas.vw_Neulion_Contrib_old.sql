SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



--Neulion Contrib
CREATE VIEW [sas].[vw_Neulion_Contrib_old] 
AS

WITH Maxupdated (MemberID, ETLUpdatedDate) AS
	(SELECT [Member ID], MAX(EFF_BEG_DATE)
	FROM SSB_BIMDM.ods.SaasContrib WITH (NOLOCK) 
	GROUP BY [Member ID])

SELECT n.[Member ID] MemberID ,
	CAST([n].[Account Status] AS NVARCHAR(255)) AccountStatus,
	[n].[Rank],
	[n].Points,
	[n].[Lifetime Giving Amount] LifetimeGivingAmount,
	[n].[Lifetime Pledges] LifetimePledges,
	[n].[Lifetime Paid] LifetimePaid,
	[n].[Largest Gift Amount] LargestGiftAmount,
	[n].[Largest Gift Date] LargestGiftDate,
	CAST([n].[Largest Gift Fund] AS NVARCHAR(255)) LargestGiftFund,
	[n].[First Paid Date to Annual Fund] FirstPaidDateToAnnualFund,
	[n].[Last Paid to Annual Fund] LastPaidDateToAnnualFund,
	[n].[Last FY Paid to Annual Fund] LastFYPaidToAnnualFund,
	[n].[University Campaign 2022 Pledged] UniversityCampaign2022Pledged,
	[n].[University Campaign 2022 Paid] UniversityCampaign2022Paid,
	NULL AllGiftsFY18,
	[n].[All Gifts FY17] AllGiftsFY17,
	[n].[All Gifts FY16] AllGiftsFY16,
	[n].[All Gifts FY15] AllGiftsFY15,
	[n].[All Gifts FY14] AllGiftsFY14,
	[n].[All Gifts FY13] AllGiftsFY13,
	[All Gifts FY12] AllGiftsFY12,
	[All Gifts FY11] AllGiftsFY11,
	[All Gifts FY10] AllGiftsFY10,
	[All Gifts FY09] AllGiftsFY09,
	CAST(REPLACE(NULL,'**','')  AS NVARCHAR(255)) AS [Status18],
	NULL AS [Pledge18],
	NULL AS [Paid18],
	NULL AS [Balance18],
	CAST(REPLACE([n].[17 Status],'**','') AS NVARCHAR(255)) [Status17],
	[17 Pledge] [Pledge17],
	[17 Paid] [Paid17],
	[17 Balance] [Balance17],
	CAST(REPLACE([n].[16 Status],'**','') AS NVARCHAR(255)) [Status16],
	[16 Pledge] [Pledge16],
	[16 Paid] [Paid16],
	[16 Balance] [Balance16],
	CAST(REPLACE([n].[15 Status],'**','') AS NVARCHAR(255)) [Status15],
	[15 Pledge] [Pledge15],
	[15 Paid] [Paid15],
	[15 Balance] [Balance15],
	CAST(REPLACE([n].[14 Status],'**','') AS NVARCHAR(255)) [Status14],
	[14 Paid] [Paid14],
	CAST(REPLACE([n].[13 Status],'**','') AS NVARCHAR(255)) [Status13],
	[13 Paid] [Paid13],
	CAST(REPLACE([n].[12 Status],'**','') AS NVARCHAR(255)) [Status12],
	[12 Paid] [Paid12],
	CAST(REPLACE([n].[11 Status],'**','') AS NVARCHAR(255)) [Status11],
	[11 Paid] [Paid11],
	CAST(REPLACE([n].[10 Status],'**','') AS NVARCHAR(255)) [Status10],
	[10 Paid] [Paid10],
	CAST(REPLACE([n].[09 Status],'**','') AS NVARCHAR(255)) [Status09],
	[09 Paid] [Paid09],
	CAST(REPLACE([n].[08 Status],'**','') AS NVARCHAR(255)) [Status08],
	[08 Paid] [Paid08],
	CAST(REPLACE([n].[07 Status],'**','') AS NVARCHAR(255)) [Status07],
	[07 Paid] [Paid07],
	CAST(NULL AS NVARCHAR(255)) AS [YA2018],
	CAST(n.[YA-2017?] AS NVARCHAR(255)) [YA2017],
	CAST(n.[YA-2016?] AS NVARCHAR(255)) [YA2016],
	CAST(n.[YA-2015?] AS NVARCHAR(255)) [YA2015],
	CAST(n.[YA-2014?] AS NVARCHAR(255)) [YA2014],
	CAST(n.[Car Dealer?] AS NVARCHAR(255)) [CarDealer],
	CAST(n.[Insurance Policy?] AS NVARCHAR(255)) [InsurancePolicy],
	CAST(n.[Endowment Requirement] AS NVARCHAR(255)) [EndowmentRequirement],
	CAST(n.[Blue Zone Requirement] AS NVARCHAR(255)) [BlueZoneRequirement],
	CAST(n.[Endowment Heir?] AS NVARCHAR(255)) [EndowmentHeir],
	CAST([n].[750K MB Endowment] AS NVARCHAR(255)) [Endowment750KMB],
	[n].[750K MB Endowment Pd] [EndowmentPd750KMB],
	CAST([n].[500K MB Endowment] AS NVARCHAR(255)) [Endowment500KMB],
	[n].[500K MB Endowment Pd] [EndowmentPd500KMB],
	CAST([n].[500K Endowment] AS NVARCHAR(255)) [Endowment500K],
	[n].[500K Endowment Pd] [EndowmentPd500K],
	CAST([n].[200K Endowment] AS NVARCHAR(255)) [Endowment200K],
	[n].[200K Endowment Pd] [EndowmentPd200K],
	CAST([n].[150K Endowment] AS NVARCHAR(255)) [Endowment150K],
	[n].[150K Endowment Pd] [EndowmentPd150K],
	CAST([n].[100K Endowment] AS NVARCHAR(255)) [Endowment100K],
	[n].[100K Endowment Pd] [EndowmentPd100K],
	CAST([n].[75K Endowment] AS NVARCHAR(255)) [Endowment75K],
	[n].[75K Endowment Pd] [EndowmentPd75K],
	CAST([n].[$35K-$50K Endowment] AS NVARCHAR(255)) [Endowment35K_50K],
	[n].[$35K-$50K Endowment Pd] [EndowmentPd35K_50K],
	CAST([n].[100K Half Endowment] AS NVARCHAR(255)) [HalfEndowment100K],
	[n].[100K Half Endowment Pd] [HalfEndowmentPd100K],
	CAST([n].[75K Half Endowment] AS NVARCHAR(255)) [HalfEndowment75K],
	[n].[75K Half Endowment Pd] [HalfEndowmentPd75K],
	CAST([n].[50K Half Endowment] AS NVARCHAR(255)) [HalfEndowment50K],
	[n].[50K Half Endowment Pd] [HalfEndowmentPd50K],
	CAST([n].[40K Half Endowment]  AS NVARCHAR(255))[HalfEndowment40K],
	[n].[40K Half Endowment Pd] [HalfEndowmentPd40K],
	CAST([n].[30K SR Life] AS NVARCHAR(255)) [Life30KSR],
	[n].[30K SR Life Pd] [LifePd30KSR],
	CAST([n].[20K SR Life] AS NVARCHAR(255)) [Life20KSR],
	[n].[20K SR Life Pd] [LifePd20KSR],
	CAST([n].[15K BR Life] AS NVARCHAR(255)) [Life15KBR],
	[n].[15K BR Life Pd] [LifePd15KBR],
	CAST([n].[10K BR Life] AS NVARCHAR(255)) [Life10KBR],
	[n].[10K BR Life Pd] [LifePd10KBR],
	[n].[Smith Center Heir?][SmithCenterHeir],
	[n].[CBFF Pledged] [CBFFPledged],
	[n].[CBFF Paid] [CBFFPaid],
	[n].[Endow Donor?] [EndowDonor],
	[n].[Endow Pledged] EndowPledged,
	[n].[Endow Paid] EndowPaid,
	[n].[Insur Heir?][InsurHeir],
	[n].[SPECPROJ Level] [SPECPROJLevel],
	[n].[SPECPROJ Pledged] SPECPROJPledged,
	[n].[SPECPROJ Paid] SPECPROJPaid,
	[n].[SPECPROJ Balance] SPECPROJBalance,
	[n].[Basketball Practice Facility] BasketballPracticeFacility,
	[n].[Boshamer Stadium Maintenance Endowment] BosStaMaintenanceEndow,
	[n].[Boshamer Stadium Renovation] BoshamerStadiumRenovation,
	[n].[Boshamer MLB,Visitors Lkr Rm And Team Room] BosMLBVisitorsLkrRmAndTeamRoom,
	[n].[Boshamer Stadium Improvements] BoshamerStadiumImprovements,
	[n].[Boshamer Stadium-Videoboard] BoshamerStadium_Videoboard,
	[n].[Brick Campaign-Sports Med Facility] BrickCamp_SportsMedFacility,
	[n].[Cheerleading Pride Floor Naming Opportunity] CheerleadingPrideFloorNamingOp,
	[n].[Football Practice Complex] FootballPracticeComplex,
	[n].[Football Coaches' Locker Room] FootballCoachesLockerRoom,
	[n].[Football Special Funds] FootballSpecialFunds,
	[n].[Finley Clubhouse Pro] FinleyClubhousePro,
	[n].[Field Hockey Stadium New Renovation] FieldHockeyStadiumNewRenov,
	[n].[Gymnastics Practice Facility] GymnasticsPracticeFacility,
	[n].[Henry Stadium Turf Project] HenryStadiumTurfProject,
	[n].[James Gray Fball Mngr Schol Endowment] JGFballMngrScholEndo,
	[n].[Koury Box/Mezzanine Program] KouryBoxMezzanineProgram,
	[n].[Kenan Stadium Expansion] KenanStadiumExpansion,
	[n].[RG70s Lacrosse Film Room-Kenan] RG70sUNCMensLXFilmRoomKenanExp,
	[n].[Kevin Reichardt-UNC Lacrosse Head Coach's Office in Memory] KR_UNCLXHeadCoachsOfficeinMem,
	[n].[Lacrosse Lkr Room-Kenan Expansion] LacrosseLkrRoom_KenanExpansion,
	[n].[Locker Room Project Boshamer Stadium] LockerRoomProjectBosSta,
	[n].[Nutrition Center - Kenan Expansion] NutritionCenter_KenanExpansion,
	[n].[Softball Hitting Facility] SoftballHittingFacility,
	[n].[Smith Center Basketball Offices Renovation] SCBasketballOfficesRenov,
	[n].[Smith Center Locker Suite Renovation] SCLockerSuiteRenov,
	[n].[Misc-Soccer Lkr Room Renov] Misc_SoccerLkrRoomRenov,
	[n].[Soccer/Lacrosse Stadium - Future Designation] SoccerLXStadium_FutureDesig,
	[n].[Sports Medicine Facility Proj] SportsMedicineFacilityProj,
	[n].[Sports Medicine - M Thorp Performance Rehab Area] SportsMedicine_MTPerfRehabArea,
	[n].[Track And Field Sound System] TrackAndFieldSoundSystem,
	[n].[Volleyball Locker Room Project] VolleyballLockerRoomProject,
	[n].[Ernie Williamson Athletics Center] ErnieWilliamsonAthleticsCenter,
	[n].[Wrestling/Gymnastics Locker Room Project] WresGymLockerRoomProject,
	[n].[Willie Scroggs Locker Room Project] WillieScroggsLockerRoomProject,
	[n].[Academic Support Center Operating Endowment] AcademicSCOperatingEndo,
	[n].[Charlie Justice Football Operating Endowment] CharlieJusticeFootballOpEndo,
	[n].[Football Operating Endowment] FootballOperatingEndowment,
	[n].[Baseball Operating Endowment] BaseballOperatingEndowment,
	[n].[Eugene F. Brigham Track and Field Operating Endowment] EugeneFBrighamTnFieldOpEndo,
	[n].[Carolina Family Basketball Project] CaroFamilyBBProject,
	[n].[Carolina Leadership Academy Endowment] CaroLeadershipAcademyEndo,
	[n].[Men's And Women's Cross Country Operating Endowment] MnWCrossCountryOperatingEndo,
	[n].[Carolina Football Lettermens Operating Endowment] CaroFBLettermensOperatingEndo,
	[n].[Mens Basketball Excellence Fund] MensBasketballExcellenceFund,
	[n].[Men's And Women's Fencing Operating Endowment] MnWFencingOperatingEndo,
	[n].[Field Hockey Operating Endowment] FieldHockeyOperatingEndowment,
	[n].[Gymnastics Operating Endowment] GymnasticsOperatingEndowment,
	[n].[JV Basketball Operating Endowment] JVBasketballOperatingEndowment,
	[n].[J Knox Hillman Memorial Scholarship] JKnoxHillmanMemorialSchol,
	[n].[Joe Maddux Football Operating Endowment] JoeMadduxFBOperatingEndo,
	[n].[The 22 Club-Football Operating Endowment] The22Club_FBOperatingEndo,
	[n].[William R. Kenan, Jr. Endowment for Women's Soccer in Honor of Braxton Schell] WKEndoforWomensSoccerHonorofBS,
	[n].[Men's And Women's Track Operating Endowment] MnWTrackOperatingEndo,
	[n].[Men's Basketball Operating Endowment] MensBBOperatingEndo,
	[n].[Men's Golf Operating Endowment] MensGolfOperatingEndowment,
	[n].[Volleyball Operating Endowment] VolleyballOperatingEndowment,
	[n].[Noah K Duncan Memorial Scholarship] NoahKDuncanMemorialScholarship,
	[n].[Men's Soccer Operating Endowment] MensSoccerOperatingEndowment,
	[n].[The Pope Performance Fund] ThePopePerformanceFund,
	[n].[Women's Lacrosse Operating Endowment] WomensLXOperatingEndo,
	[n].[Dean Smith Scholarship Endowment] DeanSmithScholarshipEndowment,
	[n].[Men's Tennis Operating Endowment] MensTennisOperatingEndowment,
	[n].[Women's Basketball Operating Endowment] WomensBBOperatingEndo,
	[n].[Women's Golf Operating Endowment] WomensGolfOperatingEndowment,
	[n].[Men's Lacrosse Operating Endowment] MensLacrosseOperatingEndowment,
	[n].[Women's Soccer Operating Endowment] WomensSoccerOperatingEndowment,
	[n].[Endowment Insurance Policy] EndowmentInsurancePolicy,
	[n].[Rowing Operating Endowment] RowingOperatingEndowment,
	[n].[Endowment-Campaign Carolina] Endowment_CampaignCarolina,
	[n].[Women's Tennis Operating Endowment] WomensTennisOperatingEndowment,
	[n].[Softball Operating Endowment] SoftballOperatingEndowment,
	[n].[Women's Sports Endowment] WomensSportsEndowment,
	[n].[Frank Comfort Scholarship Endowment] FrankComfortScholEndo,
	[n].[Carolina Swimming And Diving Operating Endowment] CaroSnDOperatingEndo,
	[n].[Wrestling Operating Endowment] WrestlingOperatingEndowment,
	[n].[ETL_CREATED_DATE],
	n.[Donor Status] DonorStatus,
	n.[Donor Status Mod Date] DonorStatusModDate,
	n.[National Championship Fund] NationalChampionshipFund,
	n.[The 42 Campaign Fund] The42CampaignFund
FROM    SSB_BIMDM.ods.SaasContrib n (NOLOCK)
JOIN	Maxupdated m ON n.[Member ID] = m.MemberID AND n.EFF_BEG_DATE = m.ETLUpdatedDate
WHERE n.[Member ID] NOT IN (SELECT DISTINCT [Member ID]
							FROM SSB_BIMDM.src.SaasMerge WITH (NOLOCK) )





















GO
