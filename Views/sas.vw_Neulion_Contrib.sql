SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--Neulion Contrib
CREATE VIEW [sas].[vw_Neulion_Contrib] 
AS

SELECT n.[Member ID] MemberID ,
	CAST([d].[Account Status] AS NVARCHAR(255)) AccountStatus,
	d.[Rank],
	d.Points,
	cc.[Lifetime Giving Amount] AS LifetimeGivingAmount,
	cc.[Lifetime Pledges] AS LifetimePledges,
	cc.[Lifetime Paid] AS LifetimePaid,
	cc.[Largest Gift Amount] AS LargestGiftAmount,
	cc.[Largest Gift Date] AS LargestGiftDate,
	CAST(cc.[Largest Gift Fund] AS NVARCHAR(255)) LargestGiftFund,
	ca.[First Paid Date to Annual Fund] AS FirstPaidDateToAnnualFund,
	ca.[Last Paid to Annual Fund] AS LastPaidDateToAnnualFund,
	ca.[Last FY Paid to Annual Fund] AS LastFYPaidToAnnualFund,
	cc.[University Campaign 2022 Pledged] AS UniversityCampaign2022Pledged,
	cc.[University Campaign 2022 Paid] AS UniversityCampaign2022Paid,
	cc.[All Gifts FY18] AS AllGiftsFY18,
	cc.[All Gifts FY17] AS AllGiftsFY17,
	cc.[All Gifts FY16] AS AllGiftsFY16,
	cc.[All Gifts FY15] AS AllGiftsFY15,
	cc.[All Gifts FY14] AS AllGiftsFY14,
	cc.[All Gifts FY13] AS AllGiftsFY13,
	cc.[All Gifts FY12] AS AllGiftsFY12,
	cc.[All Gifts FY11] AS AllGiftsFY11,
	cc.[All Gifts FY10] AS AllGiftsFY10,
	cc.[All Gifts FY09] AS AllGiftsFY09,
	CAST(REPLACE([ca].[2018 Giving Level],'**','')  AS NVARCHAR(255)) AS [Status18],
	ca.[2018 Pledge] AS [Pledge18],
	[ca].[2018 Paid] AS [Paid18],
	[ca].[2018 Balance] AS [Balance18],
	CAST(REPLACE([ca].[2017 Giving Level],'**','') AS NVARCHAR(255)) AS [Status17],
	ca.[2017 Pledge] AS [Pledge17],
	[ca].[2017 Paid] AS [Paid17],
	[ca].[2017 Balance] AS [Balance17],
	CAST(REPLACE([ca].[2016 Giving Level],'**','') AS NVARCHAR(255)) AS [Status16],
	ca.[2016 Pledge] AS [Pledge16],
	[ca].[2016 Paid] AS [Paid16],
	[ca].[2016 Balance] AS [Balance16],
	CAST(REPLACE([ca].[2015 Giving Level],'**','') AS NVARCHAR(255)) AS [Status15],
	ca.[2015 Pledge] AS [Pledge15],
	ca.[2015 Paid] AS [Paid15],
	ca.[2015 Balance] AS [Balance15],
	CAST(REPLACE([ca].[2014 Giving Level],'**','') AS NVARCHAR(255)) AS [Status14],
	[ca].[2014 Paid] AS [Paid14],
	CAST(REPLACE([ca].[2013 Giving Level],'**','') AS NVARCHAR(255)) AS [Status13],
	[ca].[2013 Paid] AS [Paid13],
	CAST(REPLACE([ca].[2012 Giving Level],'**','') AS NVARCHAR(255)) AS [Status12],
	[ca].[2012 Paid] [Paid12],
	CAST(REPLACE([ca].[2011 Giving Level],'**','') AS NVARCHAR(255)) AS [Status11],
	[ca].[2011 Paid] AS [Paid11],
	CAST(REPLACE([ca].[2010 Giving Level],'**','') AS NVARCHAR(255)) AS [Status10],
	[ca].[2010 Paid] AS [Paid10],
	CAST(REPLACE([ca].[2009 Giving Level],'**','') AS NVARCHAR(255)) AS [Status09],
	[ca].[2009 Paid] AS [Paid09],
	CAST(REPLACE([ca].[2008 Giving Level],'**','') AS NVARCHAR(255)) AS [Status08],
	[ca].[2008 Paid] AS [Paid08],
	CAST(REPLACE([ca].[2007 Giving Level],'**','') AS NVARCHAR(255)) AS [Status07],
	[ca].[2007 Paid] AS [Paid07],
	CAST([ca].[RG-2018] AS NVARCHAR(255)) AS [YA2018],
	CAST([ca].[RG-2017] AS NVARCHAR(255)) AS [YA2017],
	CAST([ca].[RG-2016] AS NVARCHAR(255)) AS [YA2016],
	CAST([ca].[RG-2015] AS NVARCHAR(255)) AS [YA2015],
	CAST([ca].[RG-2014] AS NVARCHAR(255)) AS [YA2014],
	CAST([d].[Car Dealer] AS NVARCHAR(255)) AS [CarDealer],
	CAST([d].[Insurance] AS NVARCHAR(255)) AS [InsurancePolicy],
	CAST(d.[Endowment Requirement] AS NVARCHAR(255)) AS [EndowmentRequirement],
	CAST(d.[Blue Zone Requirement] AS NVARCHAR(255)) AS [BlueZoneRequirement],
	CAST(d.[Endowment Heir] AS NVARCHAR(255)) AS [EndowmentHeir],
	CAST(ce.[750K MB Endowment] AS NVARCHAR(255)) AS [Endowment750KMB],
	ce.[750K MB Endowment Pd] AS [EndowmentPd750KMB],
	CAST(ce.[500K MB Endowment] AS NVARCHAR(255)) AS [Endowment500KMB],
	ce.[500K MB Endowment Pd] AS [EndowmentPd500KMB],
	CAST(ce.[500K Endowment] AS NVARCHAR(255)) AS [Endowment500K],
	ce.[500K Endowment Pd] AS [EndowmentPd500K],
	CAST(ce.[200K Endowment] AS NVARCHAR(255)) AS [Endowment200K],
	ce.[200K Endowment Pd] AS [EndowmentPd200K],
	CAST(ce.[150K Endowment] AS NVARCHAR(255)) AS [Endowment150K],
	ce.[150K Endowment Pd] AS [EndowmentPd150K],
	CAST(ce.[100K Endowment] AS NVARCHAR(255)) AS [Endowment100K],
	ce.[100K Endowment Pd] AS [EndowmentPd100K],
	CAST(ce.[75K Endowment] AS NVARCHAR(255)) AS [Endowment75K],
	ce.[75K Endowment Pd] AS [EndowmentPd75K],
	CAST(ce.[35K-$50K Endowment] AS NVARCHAR(255)) AS [Endowment35K_50K],
	ce.[35K-$50K Endowment Pd] [EndowmentPd35K_50K],
	CAST(ce.[100K Half Endowment] AS NVARCHAR(255)) AS [HalfEndowment100K],
	ce.[100K Half Endowment Pd] AS [HalfEndowmentPd100K],
	CAST(ce.[75K Half Endowment] AS NVARCHAR(255)) AS [HalfEndowment75K],
	ce.[75K Half Endowment Pd] AS [HalfEndowmentPd75K],
	CAST(ce.[50K Half Endowment] AS NVARCHAR(255)) AS [HalfEndowment50K],
	ce.[50K Half Endowment Pd] AS [HalfEndowmentPd50K],
	CAST(ce.[40K Half Endowment] AS NVARCHAR(255)) AS [HalfEndowment40K],
	ce.[40K Half Endowment Pd] AS [HalfEndowmentPd40K],
	CAST(ce.[30K SR Life] AS NVARCHAR(255)) AS [Life30KSR],
	ce.[30K SR Life Pd] AS [LifePd30KSR],
	CAST(ce.[20K SR Life] AS NVARCHAR(255)) AS [Life20KSR],
	ce.[20K SR Life Pd] AS [LifePd20KSR],
	CAST(ce.[15K BR Life] AS NVARCHAR(255)) AS [Life15KBR],
	ce.[15K BR Life Pd] AS [LifePd15KBR],
	CAST(ce.[10K BR Life] AS NVARCHAR(255)) AS [Life10KBR],
	ce.[10K BR Life Pd] AS [LifePd10KBR],
	d.[Smith Center Heir] AS [SmithCenterHeir],
	CAST(0.00 AS MONEY) [CBFFPledged], -- Rams Club removed this field
	CAST(0.00 AS MONEY) [CBFFPaid], -- Rams Club removed this field
	[d].[Endowment Donor] AS [EndowDonor],
	[cc].[Lifetime Endowment Pledged] AS EndowPledged,
	[cc].[Lifetime Endowment Paid] AS EndowPaid,
	d.[Insur Heir] AS [InsurHeir],
	[d].[Special Project Donor] AS [SPECPROJLevel],
	[cc].[Lifetime Special Pledged] AS SPECPROJPledged,
	[cc].[Lifetime Special Paid] AS SPECPROJPaid,
	[cc].[Lifetime Special Balance] SPECPROJBalance,
	cs.[Basketball Practice Facility] AS BasketballPracticeFacility,
	cs.[Boshamer Stadium Maintenance Endowment] AS BosStaMaintenanceEndow,
	cs.[Boshamer Stadium Renovation] AS BoshamerStadiumRenovation,
	cs.[Boshamer MLB,Visitors Lkr Rm And Team Room] AS BosMLBVisitorsLkrRmAndTeamRoom,
	cs.[Boshamer Stadium Improvements] AS BoshamerStadiumImprovements,
	cs.[Boshamer Stadium-Videoboard] AS BoshamerStadium_Videoboard,
	cs.[Brick Campaign-Sports Med Facility] AS BrickCamp_SportsMedFacility,
	cs.[Cheerleading Pride Floor Naming Opportunity] AS CheerleadingPrideFloorNamingOp,
	cs.[Football Practice Complex] AS FootballPracticeComplex,
	cs.[Football Coaches' Locker Room] AS FootballCoachesLockerRoom,
	cs.[Football Special Funds] AS FootballSpecialFunds,
	cs.[Finley Clubhouse Pro] FinleyClubhousePro,
	cs.[Field Hockey Stadium New Renovation] FieldHockeyStadiumNewRenov,
	cs.[Gymnastics Practice Facility] GymnasticsPracticeFacility,
	cs.[Henry Stadium Turf Project] HenryStadiumTurfProject,
	cs.[James Gray Fball Mngr Schol Endowment] JGFballMngrScholEndo,
	cs.[Koury Box/Mezzanine Program] KouryBoxMezzanineProgram,
	cs.[Kenan Stadium Expansion] KenanStadiumExpansion,
	cs.[Randy Gilbert/70s UNC Men's Lacrosse Film Room-Kenan Expansion] RG70sUNCMensLXFilmRoomKenanExp,
	cs.[Kevin Reichardt-UNC Lacrosse Head Coach's Office in Memory] KR_UNCLXHeadCoachsOfficeinMem,
	cs.[Lacrosse Lkr Room-Kenan Expansion] LacrosseLkrRoom_KenanExpansion,
	cs.[Locker Room Project Boshamer Stadium] LockerRoomProjectBosSta,
	cs.[Nutrition Center - Kenan Expansion] NutritionCenter_KenanExpansion,
	cs.[Softball Hitting Facility] SoftballHittingFacility,
	cs.[Smith Center Basketball Offices Renovation] SCBasketballOfficesRenov,
	cs.[Smith Center Locker Suite Renovation] SCLockerSuiteRenov,
	cs.[Misc-Soccer Lkr Room Renov] Misc_SoccerLkrRoomRenov,
	cs.[Soccer/Lacrosse Stadium - Future Designation] SoccerLXStadium_FutureDesig,
	cs.[Sports Medicine Facility Proj] SportsMedicineFacilityProj,
	cs.[Sports Medicine - M Thorp Performance Rehab Area] SportsMedicine_MTPerfRehabArea,
	cs.[Track And Field Sound System] TrackAndFieldSoundSystem,
	cs.[Volleyball Locker Room Project] VolleyballLockerRoomProject,
	cs.[Ernie Williamson Athletics Center] ErnieWilliamsonAthleticsCenter,
	cs.[Wrestling/Gymnastics Locker Room Project] WresGymLockerRoomProject,
	cs.[Willie Scroggs Locker Room Project] WillieScroggsLockerRoomProject,
	cs.[Academic Support Center Operating Endowment] AcademicSCOperatingEndo,
	csp.[Charlie Justice Football Operating Endowment] CharlieJusticeFootballOpEndo,
	csp.[Football Operating Endowment] FootballOperatingEndowment,
	csp.[Baseball Operating Endowment] BaseballOperatingEndowment,
	csp.[Eugene F. Brigham Track and Field Operating Endowment] EugeneFBrighamTnFieldOpEndo,
	cs.[Carolina Family Basketball Project] CaroFamilyBBProject,
	cs.[Carolina Leadership Academy Endowment] CaroLeadershipAcademyEndo,
	csp.[Men's And Women's Cross Country Operating Endowment] MnWCrossCountryOperatingEndo,
	cs.[Carolina Football Lettermens Operating Endowment] CaroFBLettermensOperatingEndo,
	cs.[Mens Basketball Excellence Fund] MensBasketballExcellenceFund,
	csp.[Men's And Women's Fencing Operating Endowment] MnWFencingOperatingEndo,
	csp.[Field Hockey Operating Endowment] FieldHockeyOperatingEndowment,
	csp.[Gymnastics Operating Endowment] GymnasticsOperatingEndowment,
	csp.[JV Basketball Operating Endowment] JVBasketballOperatingEndowment,
	cs.[J Knox Hillman Memorial Scholarship] JKnoxHillmanMemorialSchol,
	csp.[Joe Maddux Football Operating Endowment] JoeMadduxFBOperatingEndo,
	csp.[The 22 Club-Football Operating Endowment] The22Club_FBOperatingEndo,
	cs.[William R. Kenan, Jr. Endowment for Women's Soccer in Honor of Braxton Schell] WKEndoforWomensSoccerHonorofBS,
	csp.[Men's And Women's Track Operating Endowment] MnWTrackOperatingEndo,
	csp.[Men's Basketball Operating Endowment] MensBBOperatingEndo,
	csp.[Men's Golf Operating Endowment] MensGolfOperatingEndowment,
	csp.[Volleyball Operating Endowment] VolleyballOperatingEndowment,
	cs.[Noah K Duncan Memorial Scholarship] NoahKDuncanMemorialScholarship,
	csp.[Men's Soccer Operating Endowment] MensSoccerOperatingEndowment,
	cs.[The Pope Performance Fund] ThePopePerformanceFund,
	csp.[Women's Lacrosse Operating Endowment] WomensLXOperatingEndo,
	cs.[Dean Smith Scholarship Endowment] DeanSmithScholarshipEndowment,
	csp.[Men's Tennis Operating Endowment] MensTennisOperatingEndowment,
	csp.[Women's Basketball Operating Endowment] WomensBBOperatingEndo,
	csp.[Women's Golf Operating Endowment] WomensGolfOperatingEndowment,
	csp.[Men's Lacrosse Operating Endowment] MensLacrosseOperatingEndowment,
	csp.[Women's Soccer Operating Endowment] WomensSoccerOperatingEndowment,
	cs.[Endowment Insurance Policy] EndowmentInsurancePolicy,
	csp.[Rowing Operating Endowment] AS RowingOperatingEndowment,
	cs.[Endowment-Campaign Carolina] AS Endowment_CampaignCarolina,
	csp.[Women's Tennis Operating Endowment] AS WomensTennisOperatingEndowment,
	csp.[Softball Operating Endowment] AS SoftballOperatingEndowment,
	cs.[Women's Sports Endowment] AS WomensSportsEndowment,
	cs.[Frank Comfort Scholarship Endowment] AS FrankComfortScholEndo,
	csp.[Carolina Swimming And Diving Operating Endowment] AS CaroSnDOperatingEndo,
	csp.[Wrestling Operating Endowment] AS WrestlingOperatingEndowment,
	n.[ETL_CREATED_DATE],
	d.[Donor Status] AS DonorStatus,
	d.[Donor Status Mod Date] AS DonorStatusModDate,
	cs.[National Championship Fund] AS NationalChampionshipFund,
	cs.[The 42 Campaign Fund] AS The42CampaignFund,
	cc.[Lifetime Balance] AS LifetimeBalance,
	cc.[Lifetime Annual Pledged] AS LifetimeAnnualPledged,
	cc.[Lifetime Annual Paid] AS LifetimeAnnualPaid,
	cc.[Lifetime Annual Balance] AS LifetimeAnnualBalance,
	cc.[Lifetime Endowment Balance] AS LifetimeEndowmentBalance,
	CAST(ce.[1M-Olympic Sport Position Endowment] AS NVARCHAR(255)) AS OlympicSportPositionEndowment1M,
	ce.[1M-Olympic Sport Position Endowment Pd] AS OlympicSportPositionEndowment1MPd,
	CAST(ce.[250K Endowment] AS NVARCHAR(255)) AS Endowment250K,
	ce.[250K Endowment Pd] AS Endowment250KPd,
	CAST(ce.[250K Half Endowment] AS NVARCHAR(255)) AS HalfEndowment250K,
	ce.[250K Half Endowment Pd] AS HalfEndowment250KPd,
	CAST(ce.[100K Partial Scholarship No Benefits] AS NVARCHAR(255)) AS PartialScholarshipNoBenefits100K,
	ce.[100K Partial Scholarship No Benefits Pd] AS PartialScholarshipNoBenefits100KPd,
	cs.[Our Blue is Best] AS OurBlueIsBest,
	cs.[Track Complex/Finley Fields Renovation] AS TrackComplexFinleyFieldsRenovation,
	cs.[Ticket Exchange Credit - Basketball] AS TicketExchangeCreditBasketball,
	cs.[Ticket Exchange Credit - Football] AS TicketExchangeCreditFootball,
	cs.[Basketball Championship-Special Funds] AS BasketballChampionshipSpecialFunds,
	cs.[North Koury/Pope Box Seating Project] AS NorthKouryPopeBoxSeatingProject,
	cs.[Pope Box Exterior Seat Purchase] AS PopeBoxExteriorSeatPurchase,
	cs.[Smith Center Seats Purchase] AS SmithCenterSeatsPurchase,
	cs.[Women's Basketball Baseline Seats] AS WomensBasketballBaselineSeats,
	cs.[Boshamer Baseball Suite] AS BoshamerBaseballSuite,
	cs.[Carolina Excellence Fund] AS CarolinaExcellenceFund,
	cs.[Memorial],
	cs.[Tennis - B Clark Fund] AS TennisBClarkFund,
	cs.[Tennis-Other] AS TennisOther,
	cs.[Basketball Baseline Seats] AS BasketballBaselineSeats,
	cs.[Annual Other] AS AnnualOther,
	cs.[BZCC 2018 Pledge] AS BZCCPledge2018,
	cs.[BZCC 2018 Paid] AS BZCCPaid2018,
	cs.[BZCC 2018 Balance] AS BZCCBalance2018,
	cs.[BZUC 2018 Pledge] AS BZUCPledge2018,
	cs.[BZUC 2018 Paid] AS BZUCPaid2018,
	cs.[BZUC 2018 Balance] AS BZUCBalance2018,
	cs.[BZCL 2018 Pledge] AS BZCLPledge2018,
	cs.[BZCL 2018 Paid] AS BZCLPaid2018,
	cs.[BZCL 2018 Balance] AS BZCLBalance2018,
	cs.[BZUL 2018 Pledge] AS BZULPledge2018,
	cs.[BZUL 2018 Paid] AS BZULPaid2018,
	cs.[BZUL 2018 Balance] AS BZULBalance2018,
	cs.[BZS 2018 Pledge] AS BZSPledge2018,
	cs.[BZS 2018 Paid] AS BZSPaid2018,
	cs.[BZS 2018 Balance] AS BZSBalance2018,
	cs.[MEZ 2018 Pledge] AS MEZPledge2018,
	cs.[MEZ 2018 Paid] AS MEZPaid2018,
	cs.[MEZ 2018 Balance] AS MEZBalance2018,
	cs.[SKB 2018 Pledge] AS SKBPledge2018,
	cs.[SKB 2018 Paid] AS SKBPaid2018,
	cs.[SKB 2018 Balance] AS SKBBalance2018,
	d.[Donor Status Abbreviation] AS DonorStatusAbbreviation,
	CAST(d.[Major Gift Donor] AS NVARCHAR(255)) AS MajorGiftDonor,
	d.[Num Annual Sch Pay] AS NumAnnualSchPay,
	d.[Num Annual Sch Pay Remaining] AS NumAnnualSchPayRemaining,
	d.[Amt Annual Sch Pay Remaining] AS AmtAnnualSchPayRemaining,
	CAST(REPLACE(ca.[2019 Giving Level],'**','') AS NVARCHAR(255)) AS Status2019,
	ca.[2019 Pledge] AS Pledge2019,
	ca.[2019 Paid] AS Paid2019,
	ca.[2019 Balance]AS Balance2019,
	CAST(REPLACE(ca.[2020 Giving Level],'**','') AS NVARCHAR(255)) AS Status2020,
	ca.[2020 Pledge] AS Pledge2020,
	ca.[2020 Paid] AS Paid2020,
	ca.[2020 Balance] AS Balance2020,
	CAST(REPLACE(ca.[2021 Giving Level],'**','') AS NVARCHAR(255)) AS Status2021,
	ca.[2021 Pledge] AS Pledge2021,
	ca.[2021 Paid] AS Paid2021,
	ca.[2021 Balance] AS Balance2021,
	CAST(ca.[RG-2019] AS NVARCHAR(255)) AS YA2019,
	CAST(ca.[RG-2020] AS NVARCHAR(255)) AS YA2020,
	CAST(ca.[RG-2021] AS NVARCHAR(255)) AS YA2021,
	CAST(ca.[RG-2022] AS NVARCHAR(255)) AS YA2022,
	CAST(ca.[SR-2010] AS NVARCHAR(255)) AS SR2010,
	CAST(ca.[SR-2011] AS NVARCHAR(255)) AS SR2011,
	CAST(ca.[SR-2012] AS NVARCHAR(255)) AS SR2012,
	CAST(ca.[SR-2013] AS NVARCHAR(255)) AS SR2013,
	CAST(ca.[SR-2014] AS NVARCHAR(255)) AS SR2014,
	CAST(ca.[SR-2015] AS NVARCHAR(255)) AS SR2015,
	CAST(ca.[SR-2016] AS NVARCHAR(255)) AS SR2016,
	CAST(ca.[SR-2017] AS NVARCHAR(255)) AS SR2017,
	CAST(ca.[SR-2018] AS NVARCHAR(255)) AS SR2018,
	CAST(ca.[SR-2019] AS NVARCHAR(255)) AS SR2019,
	CAST(ca.[SR-2020] AS NVARCHAR(255)) AS SR2020,
	CAST(ca.[SR-2021] AS NVARCHAR(255)) AS SR2021,
	CAST(ca.[SR-2022] AS NVARCHAR(255)) AS SR2022
--SELECT COUNT(*), COUNT(DISTINCT n.[Member ID])
FROM etl.vw_Neulion_Contact n (NOLOCK)
LEFT JOIN etl.vw_Neulion_ContribCumulative cc (NOLOCK)
	ON cc.[Member ID] = n.[Member ID]
LEFT JOIN etl.vw_Neulion_ContribAnnual ca (NOLOCK)
	ON ca.[Member ID] = n.[Member ID]
LEFT JOIN etl.vw_Neulion_ContribEndow ce (NOLOCK)
	ON ce.[Member ID] = n.[Member ID]
LEFT JOIN etl.vw_Neulion_ContribSpecial cs (NOLOCK)
	ON cs.[Member ID] = n.[Member ID]
LEFT JOIN etl.vw_Neulion_ContribSportopendow csp (NOLOCK)
	ON csp.[Member ID] = n.[Member ID]
LEFT JOIN etl.vw_Neulion_Designation d (NOLOCK)
	ON d.[Member ID] = n.[Member ID]
WHERE n.[Member ID] NOT IN
	(
		SELECT DISTINCT [Member ID]
		FROM SSB_BIMDM.src.SaasMerge WITH (NOLOCK)
	)
GO
