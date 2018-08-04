SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [etl].[ReportingTags]
AS


BEGIN

/*****************************************************************************************************************
													PLAN TYPE
******************************************************************************************************************/

-- FOOTBALL 2016, 2017

		----COMP----

		UPDATE fts
		SET fts.DimPlanTypeId = 1
		FROM    dbo.TicketTagging fts
		WHERE   Season IN ('FB16','FB17')
		AND		(PriceType LIKE '%C' OR PriceType LIKE '%D')



		----NOPLAN----

		UPDATE fts
		SET fts.DimPlanTypeId = 2
		FROM    dbo.TicketTagging fts
		WHERE   Season IN ('FB16','FB17')
		AND		PriceType NOT LIKE '%C' AND PriceType NOT LIKE '%D'



-- MEN'S BASKETBALL 2016-2017

		----COMP----

		UPDATE fts
		SET fts.DimPlanTypeId = 1
		FROM    dbo.TicketTagging fts
		WHERE   Season IN ('MB17')
		AND		PriceType IN ('C','RD','TC','B','CRC')



		----NOPLAN----

		UPDATE fts
		SET fts.DimPlanTypeId = 2
		FROM    dbo.TicketTagging fts
		WHERE   Season IN ('MB17')
		AND		PriceType NOT IN ('C','RD','TC','B','CRC')



-- BASEBALL 2017

		----COMP----

		UPDATE fts
		SET fts.DimPlanTypeId = 1
		FROM    dbo.TicketTagging fts
		WHERE   Season IN ('BB17')
		AND		PriceType IN ('C','DH','BO')



		----NOPLAN----

		UPDATE fts
		SET fts.DimPlanTypeId = 2
		FROM    dbo.TicketTagging fts
		WHERE   Season IN ('BB17')
		AND		PriceType NOT IN ('C','DH','BO')






/*****************************************************************************************************************
													TICKET TYPE
******************************************************************************************************************/

-- FOOTBALL 2016, 2017

		----FULL SEASON----

		UPDATE fts
		SET fts.DimTicketTypeId = 1
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item LIKE 'FS%'



		----MINI PLAN----

		UPDATE fts
		SET fts.DimTicketTypeId = 2
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item = 'F3G'



		----GROUP----

		UPDATE fts
		SET fts.DimTicketTypeId = 3
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item LIKE 'F0%' and PriceType LIKE 'G%'



		----SINGLE GAME TICKET----

		UPDATE fts
		SET fts.DimTicketTypeId = 4
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item LIKE 'F0%' AND PriceType NOT LIKE 'G%' AND PriceType <> 'K'



		----AWAY GAME TICKET----

		UPDATE fts
		SET fts.DimTicketTypeId = 5
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item LIKE 'FA%'



		----STUDENT----

		UPDATE fts
		SET fts.DimTicketTypeId = 6
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item LIKE 'F0%' AND PriceType = 'K'



-- MEN'S BASKETBALL 2016-2017

		----FULL SEASON----

		UPDATE fts
		SET fts.DimTicketTypeId = 1
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		Item LIKE 'BS%'



		----TAR HEEL PACK----

		UPDATE fts
		SET fts.DimTicketTypeId = 7
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		Item LIKE 'TH%'



		----MINI PLAN----

		UPDATE fts
		SET fts.DimTicketTypeId = 2
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item LIKE 'B0%' OR Item LIKE 'B1%') AND PriceType = '5G'



		----GROUP----

		UPDATE fts
		SET fts.DimTicketTypeId = 3
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item LIKE 'B0%' OR Item LIKE 'B1%') AND PriceType = 'G15'



		----SINGLE GAME----

		UPDATE fts
		SET fts.DimTicketTypeId = 4
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item LIKE 'B0%' OR Item LIKE 'B1%') AND PriceType NOT IN ('G15', '5G')



-- BASEBALL 2017

		----FULL SEASON----

		UPDATE fts
		SET fts.DimTicketTypeId = 1
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item LIKE 'BBS%'



		----HALF SEASON----

		UPDATE fts
		SET fts.DimTicketTypeId = 8
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item LIKE '%MINI%'



		----MINI PLAN----

		UPDATE fts
		SET fts.DimTicketTypeId = 2
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item IN ('6G','3G','ACC','ACC1')



		----GROUP----

		UPDATE fts
		SET fts.DimTicketTypeId = 3
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item LIKE 'BB[0-3]%' AND PriceType = 'GRP'



		----SINGLE GAME----

		UPDATE fts
		SET fts.DimTicketTypeId = 4
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item LIKE 'BB[0-3]%' AND PriceType <> 'GRP'




		

/*****************************************************************************************************************
													TICKET CLASS
******************************************************************************************************************/

-- FOOTBALL 2016, 2017

		----FULL SEASON ZONE 1----

		UPDATE fts
		SET fts.DimTicketClassId = 1
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item LIKE 'FS%'
		AND		PriceLevel = '1'
		AND		PriceType IN ('N','M')



		----FULL SEASON ZONE 2----

		UPDATE fts
		SET fts.DimTicketClassId = 2
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item LIKE 'FS%'
		AND		PriceLevel = '2'
		AND		PriceType IN ('N','M')



		----FULL SEASON ZONE 3----

		UPDATE fts
		SET fts.DimTicketClassId = 3
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item LIKE 'FS%'
		AND		PriceLevel = '3'
		AND		PriceType IN ('N','M')



		----FULL SEASON FACULTY----

		UPDATE fts
		SET fts.DimTicketClassId = 4
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FS%'
		AND		(PriceType = 'MZS' OR PriceType LIKE 'S%')



		----FULL SEASON RECENT GRAD----

		UPDATE fts
		SET fts.DimTicketClassId = 5
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FS%'
		AND		PriceType LIKE 'RG%'



		----FULL SEASON CONCOURSE CLUB----

		UPDATE fts
		SET fts.DimTicketClassId = 6
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FS%'
		AND		PriceType IN ('BZ-C','BZ-CM')



		----FULL SEASON UPPER CLUB----

		UPDATE fts
		SET fts.DimTicketClassId = 7
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FS%'
		AND		PriceType IN ('BZ-U','BZ-UM')



		----FULL SEASON SUITE----

		UPDATE fts
		SET fts.DimTicketClassId = 8
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FS%'
		AND		PriceType = 'BZ-S'



		----FULL SEASON NORTH KOURY BOX----

		UPDATE fts
		SET fts.DimTicketClassId = 9
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FS%'
		AND		PriceType = 'NKB'



		----FULL SEASON SOUTH KOURY BOX----

		UPDATE fts
		SET fts.DimTicketClassId = 10
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FS%'
		AND		PriceType = 'SKB'



		----FULL SEASON POPE BOX----

		UPDATE fts
		SET fts.DimTicketClassId = 11
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FS%'
		AND		PriceType = 'PB'



		----FULL SEASON MEZZANINE BOX----

		UPDATE fts
		SET fts.DimTicketClassId = 12
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FS%'
		AND		PriceType = 'MZ'



		----FULL SEASON COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 13
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FS%'
		AND		(PriceType LIKE '%C' OR PriceType LIKE '%D')
		AND		PriceType <> 'BZ-C'



		----AWAY GAME PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 14
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FA%'
		AND		PriceType = 'A'



		----AWAY GAME COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 15
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'FA%'
		AND		PriceType IN ('C','PG')



		----MINI PLAN----

		UPDATE fts
		SET fts.DimTicketClassId = 16
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item = 'F3G'



		----GROUP----

		UPDATE fts
		SET fts.DimTicketClassId = 17
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'F0%'
		AND		(PriceType = 'U' OR PriceType LIKE 'G%')



		----SINGLE GAME PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 18
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'F0%'
		AND		(PriceType IN ('A','AS','V','FR','OR','B','Q','TT','AA','XA') OR PriceType LIKE 'M%')



		----SINGLE GAME COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 19
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'F0%'
		AND		PriceType IN ('C','TC','CRC','VT','AAS','BZIC','S4SC')



		----SINGLE GAME PROMO----

		UPDATE fts
		SET fts.DimTicketClassId = 20
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'F0%'
		AND		(PriceType IN ('X','Y','KC','TE') OR PriceType LIKE 'PR%' OR PriceType LIKE 'LS%')



		----SINGLE GAME STUBHUB----

		UPDATE fts
		SET fts.DimTicketClassId = 21
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'F0%'
		AND		PriceType = 'SH'



		----SINGLE GAME TRANSFER----

		UPDATE fts
		SET fts.DimTicketClassId = 22
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'F0%'
		AND		PriceType LIKE '%T' AND PriceType <> 'TT'



		----SINGLE GAME PREMIUM----

		UPDATE fts
		SET fts.DimTicketClassId = 23
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'F0%'
		AND		PriceType IN ('BZI','BZIS')



		----STUDENT----

		UPDATE fts
		SET fts.DimTicketClassId = 24
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'F0%'
		AND		PriceType = 'K'



		----STUDENT GUEST----

		UPDATE fts
		SET fts.DimTicketClassId = 25
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('FB16','FB17')
		AND		Item like 'F0%'
		AND		PriceType = 'G'



--MEN'S BASKETBALL 2016-2017

		----FULL SEASON PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 26
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		Item like 'BS%'
		AND		PriceType LIKE 'R%' AND PriceType <> 'RD'



		----FULL SEASON FACULTY----

		UPDATE fts
		SET fts.DimTicketClassId = 4
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		Item like 'BS%'
		AND		PriceType IN ('S','X')



		----FULL SEASON STUDENT----

		UPDATE fts
		SET fts.DimTicketClassId = 27
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		Item like 'BS%'
		AND		PriceType = 'KS'




		----FULL SEASON COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 13
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		Item like 'BS%'
		AND		PriceType IN ('C','RD','B','CRC','TC')



		----TAR HEEL PACKAGE----

		UPDATE fts
		SET fts.DimTicketClassId = 28
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		Item like 'TH%'
		AND		PriceType = 'A'



		----MINI PLAN----

		UPDATE fts
		SET fts.DimTicketClassId = 16
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item like 'B0%' OR Item LIKE 'B1%')
		AND		PriceType = '5G'



		----GROUP----

		UPDATE fts
		SET fts.DimTicketClassId = 17
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item like 'B0%' OR Item LIKE 'B1%')
		AND		PriceType = 'G15'



		----SINGLE GAME PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 18
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item like 'B0%' OR Item LIKE 'B1%')
		AND		(PriceType IN ('A', 'AR', 'V', 'W', 'O') OR PriceType LIKE 'M%')



		----SINGLE GAME COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 19
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item like 'B0%' OR Item LIKE 'B1%')
		AND		PriceType IN ('C', 'TC', 'CRC', 'VT')



		----SINGLE GAME PROMO----

		UPDATE fts
		SET fts.DimTicketClassId = 20
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item like 'B0%' OR Item LIKE 'B1%')
		AND		(PriceType LIKE 'PR%' OR PriceType LIKE 'LS%')



		----SINGLE GAME STUBHUB----

		UPDATE fts
		SET fts.DimTicketClassId = 21
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item like 'B0%' OR Item LIKE 'B1%')
		AND		PriceType LIKE 'SH%'



		----SINGLE GAME TRANSFER----

		UPDATE fts
		SET fts.DimTicketClassId = 22
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item like 'B0%' OR Item LIKE 'B1%')
		AND		PriceType LIKE '%T'



		----STUDENT----

		UPDATE fts
		SET fts.DimTicketClassId = 24
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item like 'B0%' OR Item LIKE 'B1%')
		AND		PriceType IN ('K', 'B1', 'B2', 'B3', 'B4', 'B5', 'SO')



		----STUDENT GUEST----

		UPDATE fts
		SET fts.DimTicketClassId = 25
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('MB17')
		AND		(Item like 'B0%' OR Item LIKE 'B1%')
		AND		PriceType = 'SG'



--BASEBALL 2017

		----FULL SEASON PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 26
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item like 'BBS%'
		AND		PriceType = 'A'



		----FULL SEASON FACULTY----

		UPDATE fts
		SET fts.DimTicketClassId = 4
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item like 'BBS%'
		AND		PriceType = 'C'



		----FULL SEASON COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 13
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item like 'BBS%'
		AND		PriceType IN ('C','DH','BO')



		----FULL SEASON RECENT GRAD----

		UPDATE fts
		SET fts.DimTicketClassId = 5
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item like 'BBS%'
		AND		PriceType LIKE 'RG%'



		----HALF SEASON PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 29
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item = 'MINI'
		AND		PriceType = 'A'



		----HALF SEASON FACULTY----

		UPDATE fts
		SET fts.DimTicketClassId = 30
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item = 'MINI'
		AND		PriceType = 'U'



		----HALF SEASON COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 31
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item = 'MINI'
		AND		PriceType = 'C'



		----HALF SEASON RECENT GRAD----

		UPDATE fts
		SET fts.DimTicketClassId = 32
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item = 'MINI'
		AND		PriceType LIKE 'RG%'



		----MINI PLAN PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 16
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item = '3G/6G/ACC'
		AND		PriceType = '3G/6G/A'



		----MINI PLAN COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 33
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item = '3G/6G/ACC'
		AND		PriceType = 'C'



		----GROUP----

		UPDATE fts
		SET fts.DimTicketClassId = 17
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item LIKE 'BB[0-3]%'
		AND		PriceType = 'GRP'



		----SINGLE GAME PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 18
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item LIKE 'BB[0-3]%'
		AND		PriceType IN ('A','MIL','SEN')



		----SINGLE GAME COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 19
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item LIKE 'BB[0-3]%'
		AND		PriceType IN ('C','DH','KC','VT')



		----SINGLE GAME PROMO----

		UPDATE fts
		SET fts.DimTicketClassId = 20
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item LIKE 'BB[0-3]%'
		AND		PriceType IN ('KCP','HP','BK')



		----STUDENT----

		UPDATE fts
		SET fts.DimTicketClassId = 24
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item LIKE 'BB[0-3]%'
		AND		PriceType = 'K'



		----STUDENT GUEST----

		UPDATE fts
		SET fts.DimTicketClassId = 25
		FROM    dbo.TicketTagging fts
		WHERE	Season IN ('BB17')
		AND		Item LIKE 'BB[0-3]%'
		AND		PriceType = 'SG'









/*****************************************************************************************************************
													FACT TAGS
******************************************************************************************************************/


UPDATE f
SET f.IsComp = 1
FROM dbo.TicketTagging f
WHERE f.DimPlanTypeID = 1


UPDATE f
SET f.IsComp = 0
FROM dbo.TicketTagging f
WHERE f.DimPlanTypeID <> 1

UPDATE f
SET f.IsPlan = 1
, f.IsPartial = 0
, f.IsSingleEvent = 0
, f.IsGroup = 0
FROM dbo.TicketTagging f
WHERE DimTicketTypeId IN (1) 



UPDATE f
SET f.IsPlan = 1
, f.IsPartial = 1
, f.IsSingleEvent = 0
, f.IsGroup = 0
FROM dbo.TicketTagging f
WHERE DimTicketTypeId IN (2, 3, 7, 8) 


UPDATE f
SET f.IsPlan = 0
, f.IsPartial = 0
, f.IsSingleEvent = 1
, f.IsGroup = 1
FROM dbo.TicketTagging f
WHERE DimTicketTypeId IN (3) 


UPDATE f
SET f.IsPlan = 0
, f.IsPartial = 0
, f.IsSingleEvent = 1
, f.IsGroup = 0
FROM dbo.TicketTagging f
WHERE DimTicketTypeId IN (4, 5, 6)



Update f
set f.TicketTypeCode = t.TicketTypeCode
, f.TicketTypeName = t.TicketTypeName
FROM dbo.TicketTagging f
JOIN dbo.DimTicketType t on f.DimTicketTypeID = t.DimTicketTypeID


Update f
set f.PlanTypeCode = t.PlanTypeCode
, f.PlanTypeName = t.PlanTypeName
FROM dbo.TicketTagging f
JOIN dbo.DimPlanType t on f.DimPlanTypeID = t.DimPlanTypeID


Update f
set f.TicketClassCode = t.TicketClassCode
, f.TicketClassName = t.TicketClassName
, f.TicketClass = t.TicketClass
FROM dbo.TicketTagging f
JOIN dbo.DimTicketClass t on f.DimTicketClassID = t.DimTicketClassID





	

END




















































GO
