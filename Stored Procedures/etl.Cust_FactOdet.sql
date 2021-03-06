SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [etl].[Cust_FactOdet]
(
	@BatchId INT = 0,
	@LoadDate DATETIME = NULL,
	@Options NVARCHAR(MAX) = NULL
)

AS


BEGIN

/*****************************************************************************************************************
													PLAN TYPE
******************************************************************************************************************/

-- FOOTBALL 2016, 2017

		----COMP----

		UPDATE fts
		SET fts.DimPlanTypeId = 1
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE   (SeasonCode IN ('FB08','FB09','FB10','FB15','FB16','FB17') AND (PriceTypeCode LIKE '%C' OR PriceTypeCode LIKE '%D'))
		OR		(SeasonCode IN ('FB11','FB12','FB13','FB14') AND (PriceTypeCode LIKE '%C' OR PriceTypeCode LIKE '%D') AND PriceTypeCOde <> 'BZ-C')


		----NOPLAN----

		UPDATE fts
		SET fts.DimPlanTypeId = 2
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE   SeasonCode IN ('FB08','FB09','FB10','FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		PriceTypeCode NOT LIKE '%C' AND PriceTypeCode NOT LIKE '%D'



-- MEN'S BASKETBALL 2016-2017

		----COMP----

		UPDATE fts
		SET fts.DimPlanTypeId = 1
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE   SeasonCode IN ('MB17')
		AND		PriceTypeCode IN ('C','RD','TC','B','CRC')



		----NOPLAN----

		UPDATE fts
		SET fts.DimPlanTypeId = 2
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE   SeasonCode IN ('MB17')
		AND		PriceTypeCode NOT IN ('C','RD','TC','B','CRC')



-- BASEBALL 2017

		----COMP----

		UPDATE fts
		SET fts.DimPlanTypeId = 1
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE   SeasonCode IN ('BB17')
		AND		PriceTypeCode IN ('C','DH','BO')



		----NOPLAN----

		UPDATE fts
		SET fts.DimPlanTypeId = 2
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE   SeasonCode IN ('BB17')
		AND		PriceTypeCode NOT IN ('C','DH','BO')






/*****************************************************************************************************************
													TICKET TYPE
******************************************************************************************************************/

-- FOOTBALL 2016, 2017

		----FULL SEASON----

		UPDATE fts
		SET fts.DimTicketTypeId = 1
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE	SeasonCode IN ('FB08','FB09','FB10','FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		ItemCode LIKE 'FS%'



		----MINI PLAN----

		UPDATE fts
		SET fts.DimTicketTypeId = 2
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		ItemCode = 'F3G'



		----GROUP----

		UPDATE fts
		SET fts.DimTicketTypeId = 3
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB08','FB09','FB10','FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		ItemCode LIKE 'F0%' and PriceTypeCode LIKE 'G%'



		----SINGLE GAME TICKET----

		UPDATE fts
		SET fts.DimTicketTypeId = 4
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB08','FB09','FB10','FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		ItemCode LIKE 'F0%' AND PriceTypeCode NOT LIKE 'G%' AND PriceTypeCode <> 'K'



		----AWAY GAME TICKET----

		UPDATE fts
		SET fts.DimTicketTypeId = 5
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB08','FB09','FB10','FB11','FB12','FB13','FB14','FB14','FB15','FB16','FB17')
		AND		ItemCode LIKE 'FA%'



		----STUDENT----

		UPDATE fts
		SET fts.DimTicketTypeId = 6
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB08','FB09','FB10','FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		((ItemCode LIKE 'F0%' AND PriceTypeCode = 'K') OR (SeasonCode IN ('FB08','FB09','FB10') AND ItemCode LIKE 'F0%' AND PriceTypeCode = 'SO'))



		----ACC CHAMPIONSHIP----

		UPDATE fts
		SET fts.DimTicketTypeId = 8
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB15')
		AND		ItemCode = 'ACC'



-- MEN'S BASKETBALL 2016-2017

		----FULL SEASON----

		UPDATE fts
		SET fts.DimTicketTypeId = 1
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE	SeasonCode IN ('MB17')
		AND		ItemCode LIKE 'BS%'



		----TAR HEEL PACK----

		UPDATE fts
		SET fts.DimTicketTypeId = 7
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		ItemCode LIKE 'TH%'



		----MINI PLAN----

		UPDATE fts
		SET fts.DimTicketTypeId = 2
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(ItemCode LIKE 'B0%' OR ItemCode LIKE 'B1%') AND PriceTypeCode = '5G'



		----GROUP----

		UPDATE fts
		SET fts.DimTicketTypeId = 3
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(ItemCode LIKE 'B0%' OR ItemCode LIKE 'B1%') AND PriceTypeCode = 'G15'



		----SINGLE GAME----

		UPDATE fts
		SET fts.DimTicketTypeId = 4
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(ItemCode LIKE 'B0%' OR ItemCode LIKE 'B1%') AND PriceTypeCode NOT IN ('G15', '5G')



-- BASEBALL 2017

		----FULL SEASON----

		UPDATE fts
		SET fts.DimTicketTypeId = 1
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE	SeasonCode IN ('BB17')
		AND		ItemCode LIKE 'BBS%'



		----HALF SEASON----

		UPDATE fts
		SET fts.DimTicketTypeId = 8
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		ItemCode LIKE '%MINI%'



		----MINI PLAN----

		UPDATE fts
		SET fts.DimTicketTypeId = 2
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		ItemCode IN ('6G','3G','ACC','ACC1')



		----GROUP----

		UPDATE fts
		SET fts.DimTicketTypeId = 3
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		ItemCode LIKE 'BB[0-3]%' AND PriceTypeCode = 'GRP'



		----SINGLE GAME----

		UPDATE fts
		SET fts.DimTicketTypeId = 4
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		ItemCode LIKE 'BB[0-3]%' AND PriceTypeCode <> 'GRP'




		

/*****************************************************************************************************************
													TICKET CLASS
******************************************************************************************************************/

-- FOOTBALL

		----RESERVED----

		UPDATE fts
		SET fts.DimTicketClassId = 34
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimPriceLevel pl on fts.dimPriceLevelID = pl.dimPriceLevelID
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE	(SeasonCode IN ('FB15') AND ItemCode LIKE 'FS%' AND PriceLevelCode = '1' AND PriceTypeCode IN ('N','M','NP','RCFF'))
		OR		(SeasonCode IN ('FB14') AND ItemCode LIKE 'FS%' AND PriceTypeCode IN ('AN','FZ','N','M','RF','Z'))
		OR		(SeasonCode IN ('FB13') AND ItemCode LIKE 'FS%' AND PriceTypeCode IN ('EZ','N','M','RF','Z'))
		OR		(SeasonCode IN ('FB12') AND ItemCode LIKE 'FS%' AND PriceTypeCode IN ('F','N','M','RF','Z'))
		OR		(SeasonCode IN ('FB11') AND ItemCode LIKE 'FS%' AND PriceTypeCode IN ('F','N','M','RF','P','G'))
		OR		(SeasonCode IN ('FB10') AND ItemCode LIKE 'FS%' AND PriceTypeCode IN ('F','G','N','M','P','R','L'))
		OR		(SeasonCode IN ('FB09') AND ItemCode LIKE 'FS%' AND PriceTypeCode IN ('F','FL','G','N','M','P','R','L','NL','NP','NPL','PL'))
		
		
		
		----FULL SEASON ZONE 1----

		UPDATE fts
		SET fts.DimTicketClassId = 1
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimPriceLevel pl on fts.dimPriceLevelID = pl.dimPriceLevelID
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE	(SeasonCode IN ('FB16','FB17') AND ItemCode LIKE 'FS%' AND PriceLevelCode = '1' AND PriceTypeCode IN ('N','M'))
		OR		(SeasonCode IN ('FB15') AND ItemCode LIKE 'FS%' AND PriceLevelCode = '2' AND PriceTypeCode IN ('Z1','Z3'))



		----FULL SEASON ZONE 2----

		UPDATE fts
		SET fts.DimTicketClassId = 2
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				join dbo.dimpricelevel dpl on fts.dimpricelevelid = dpl.dimpricelevelid
		WHERE	(SeasonCode IN ('FB16','FB17') AND ItemCode LIKE 'FS%' AND PriceLevelCode = '2' AND PriceTypeCode IN ('N','M'))
		OR		(SeasonCode IN ('FB15') AND ItemCode LIKE 'FS%' AND PriceLevelCode = '3' AND PriceTypeCode IN ('Z2','Z3'))



		----FULL SEASON ZONE 3----

		UPDATE fts
		SET fts.DimTicketClassId = 3
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				join dbo.dimpricelevel dpl on fts.dimpricelevelid = dpl.dimpricelevelid
		WHERE	(SeasonCode IN ('FB16','FB17') AND Itemcode LIKE 'FS%' AND PriceLevelCode = '3' AND PriceTypeCode IN ('N','M'))
		OR		(SeasonCode IN ('FB15') AND ItemCode LIKE 'FS%' AND PriceLevelCode = '4' AND PriceTypeCode IN ('Z3'))



		----FULL SEASON FACULTY----

		UPDATE fts
		SET fts.DimTicketClassId = 4
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE	(SeasonCode IN ('FB16','FB17') AND Itemcode like 'FS%' AND (PriceTypeCode = 'MZS' OR PriceTypeCode LIKE 'S%'))
		OR		(SeasonCode IN ('FB11','FB12','FB13','FB14','FB15') AND ItemCode LIKE 'FS%' AND PriceTypeCode IN ('S','SA','SAP','SP','MZS'))
		OR		(SeasonCode IN ('FB09','FB10') AND ItemCode LIKE 'FS%' AND PriceTypeCode = 'S')



		----FULL SEASON RECENT GRAD----

		UPDATE fts
		SET fts.DimTicketClassId = 5
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE	SeasonCode IN ('FB09','FB10','FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'FS%'
		AND		PriceTypeCode LIKE 'RG%'



		----FULL SEASON CONCOURSE CLUB----

		UPDATE fts
		SET fts.DimTicketClassId = 6
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE	SeasonCode IN ('FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'FS%'
		AND		PriceTypeCode IN ('BZ-C','BZ-CM')



		----FULL SEASON UPPER CLUB----

		UPDATE fts
		SET fts.DimTicketClassId = 7
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE	SeasonCode IN ('FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'FS%'
		AND		PriceTypeCode IN ('BZ-U','BZ-UM')



		----FULL SEASON SUITE----

		UPDATE fts
		SET fts.DimTicketClassId = 8
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE	SeasonCode IN ('FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'FS%'
		AND		PriceTypeCode = 'BZ-S'



		----FULL SEASON NORTH KOURY BOX----

		UPDATE fts
		SET fts.DimTicketClassId = 9
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		WHERE	SeasonCode IN ('FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'FS%'
		AND		PriceTypeCode = 'NKB'



		----FULL SEASON SOUTH KOURY BOX----

		UPDATE fts
		SET fts.DimTicketClassId = 10
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'FS%'
		AND		((PriceTypeCode = 'SKB') OR (SeasonCode IN ('FB11','FB12','FB13','FB14','FB15') AND PriceTypeCode = 'SKBRF'))



		----FULL SEASON POPE BOX----

		UPDATE fts
		SET fts.DimTicketClassId = 11
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'FS%'
		AND		((PriceTypeCode = 'PB') OR (SeasonCode IN ('FB11','FB12','FB13','FB14','FB15') AND PriceTypeCode = 'PBRF'))



		----FULL SEASON MEZZANINE BOX----

		UPDATE fts
		SET fts.DimTicketClassId = 12
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'FS%'
		AND		PriceTypeCode = 'MZ'



		----FULL SEASON COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 13
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB09','FB10','FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'FS%'
		AND		(PriceTypeCode LIKE '%C' OR PriceTypeCode LIKE '%D')
		AND		PriceTypeCode <> 'BZ-C'



		----AWAY GAME PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 14
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	(SeasonCode IN ('FB12','FB16','FB17') AND Itemcode like 'FA%' AND PriceTypeCode = 'A')
		OR		(SeasonCode IN ('FB14','FB15') AND ItemCode LIKE 'FA%' AND (PriceTypeCode LIKE 'A%' OR PriceTypeCode = 'K'))
		OR		(SeasonCode IN ('FB13') AND ItemCode LIKE 'FA%' AND (PriceTypeCode LIKE 'A%' OR PriceTypeCode IN ('K','Q')))
		OR		(SeasonCode IN ('FB11') AND ItemCode LIKE 'FA%' AND (PriceTypeCode IN ('A','U','Q')))
		OR		(SeasonCode IN ('FB10') AND ItemCode LIKE 'FA%' AND (PriceTypeCode IN ('A','U','Q','K')))
		OR		(SeasonCode IN ('FB09') AND ItemCode LIKE 'FA%' AND (PriceTypeCode IN ('A','U')))



		----AWAY GAME COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 15
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	(SeasonCode IN ('FB14','FB16','FB17') AND Itemcode like 'FA%' AND PriceTypeCode IN ('C','PG'))
		OR		(SeasonCode IN ('FB09','FB10','FB11','FB12','FB13','FB15') AND ItemCode LIKE 'FA%' AND PriceTypeCode = 'C')



		----MINI PLAN----

		UPDATE fts
		SET fts.DimTicketClassId = 16
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode = 'F3G'



		----GROUP----

		UPDATE fts
		SET fts.DimTicketClassId = 17
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	(SeasonCode IN ('FB12','FB13','FB14','FB15','FB16','FB17')
					AND		Itemcode like 'F0%'
					AND		(PriceTypeCode = 'U' OR PriceTypeCode LIKE 'G%'))
		OR		(SeasonCode IN ('FB09','FB10','FB11')
					AND		ItemCode LIKE 'F0%'
					AND		PriceTypeCode LIKE 'G%')



		----SINGLE GAME PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 18
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	(SeasonCode IN ('FB16','FB17')
					AND Itemcode like 'F0%'
					AND (PriceTypeCode IN ('A','AS','V','FR','OR','B','Q','TT','AA','XA') OR PriceTypeCode LIKE 'M%'))
		OR		(SeasonCode IN ('FB15')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('A','AS','MI','V','FR','O','B','Q','TT','AA','XA','FFP','GG','HC','THW','W'))
		OR		(SeasonCode IN ('FB14')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('A','AS','MI','V','FR','O','B','Q','TT','AA','XA','FFP','BB','MIL','O'))
		OR		(SeasonCode IN ('FB13')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('A','MI','V','B','TT','XA','FFP','BB','MIL','O','W','GG'))
		OR		(SeasonCode IN ('FB12')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('A','MI','V','B','TT','XA','FD','MIL','O','W','GG','U'))
		OR		(SeasonCode IN ('FB11')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('A','MI','V','B','TT','XA','FD','MIL','O','W','GG','U','FFP'))
		OR		(SeasonCode IN ('FB10')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('A','V','B','XA','O','W','GG','U','M'))
		OR		(SeasonCode IN ('FB08','FB09')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('A','V','B','XA','O','W','GG','U','M','BG','E'))



		----SINGLE GAME COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 19
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	(SeasonCode IN ('FB16','FB17')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('C','TC','CRC','VT','AAS','BZIC','S4SC'))
		OR		(SeasonCode IN ('FB15')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('C','TC','CRC','VT','AAS','BZIC','S4SC', 'CA','FA'))
		OR		(SeasonCode IN ('FB14')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('C','TC','CRC','VT','AAS','CA','MA'))
		OR		(SeasonCode IN ('FB08','FB09','FB10','FB11','FB12','FB13')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('C','TC','CRC','VT'))



		----SINGLE GAME PROMO----

		UPDATE fts
		SET fts.DimTicketClassId = 20
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	(SeasonCode IN ('FB16','FB17')
					AND Itemcode like 'F0%'
					AND (PriceTypeCode IN ('X','Y','KC','TE') OR PriceTypeCode LIKE 'PR%' OR PriceTypeCode LIKE 'LS%'))
		OR		(SeasonCode IN ('FB15')
					AND Itemcode like 'F0%'
					AND (PriceTypeCode IN ('X','Y','KC','TE','AAA','AAS2','BS','CA2','CD','FS','FS2','H') OR PriceTypeCode LIKE 'PR%' OR PriceTypeCode LIKE 'LS%'))
		OR		(SeasonCode IN ('FB14')
					AND Itemcode like 'F0%'
					AND (PriceTypeCode IN ('X','Y','KC','TE','AAS2','CA2','CD','FS','MAA') OR PriceTypeCode LIKE 'PR%' OR PriceTypeCode LIKE 'LS%'))
		OR		(SeasonCode IN ('FB13')
					AND Itemcode like 'F0%'
					AND (PriceTypeCode IN ('X','Y','KC','TE','CD','FS','220','RG','TD') OR PriceTypeCode LIKE 'PR%' OR PriceTypeCode LIKE 'LS%'))
		OR		(SeasonCode IN ('FB12')
					AND Itemcode like 'F0%'
					AND (PriceTypeCode IN ('X','Y','KC','TE','FS','TD','H','MILD') OR PriceTypeCode LIKE 'PR%' OR PriceTypeCode LIKE 'LS%'))
		OR		(SeasonCode IN ('FB11')
					AND Itemcode like 'F0%'
					AND (PriceTypeCode IN ('X','Y','H','MILD','CRD','FA','H-D','J') OR PriceTypeCode LIKE 'PR%' OR PriceTypeCode LIKE 'LS%'))
		OR		(SeasonCode IN ('FB09','FB10')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('X','Y','H','CRD','FA','J'))
		OR		(SeasonCode IN ('FB08')
					AND Itemcode like 'F0%'
					AND PriceTypeCode IN ('X','Y','H'))



		----SINGLE GAME STUBHUB----

		UPDATE fts
		SET fts.DimTicketClassId = 21
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'F0%'
		AND		PriceTypeCode LIKE 'SH%'



		----SINGLE GAME TRANSFER----

		UPDATE fts
		SET fts.DimTicketClassId = 22
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB08','FB09','FB10','FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'F0%'
		AND		((PriceTypeCode LIKE '%T' AND PriceTypeCode <> 'TT') OR (SeasonCode IN ('FB09','FB09') AND PriceTypeCode = 'FTE'))



		----SINGLE GAME PREMIUM----

		UPDATE fts
		SET fts.DimTicketClassId = 23
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	(SeasonCode IN ('FB15','FB16','FB17') AND Itemcode like 'F0%' AND PriceTypeCode IN ('BZI','BZIS'))
		OR		(SeasonCode IN ('FB13','FB14') AND ItemCode LIKE 'F0%' AND PriceTypeCode IN ('BZI','BZ-STE','SI'))
		OR		(SeasonCode IN ('FB12') AND ItemCode = 'F0%' AND PriceTypeCode IN ('SI','SIM'))
		OR		(SeasonCode IN ('FB11') AND ItemCode = 'F0%' AND PriceTypeCode IN ('SI','SIM','BZ-STE'))



		----STUDENT----

		UPDATE fts
		SET fts.DimTicketClassId = 24
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB08','FB09','FB10','FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'F0%'
		AND		((PriceTypeCode = 'K') OR (SeasonCode IN ('FB08','FB09','FB10','FB11','FB12') AND PriceTypeCode = 'SO'))



		----STUDENT GUEST----

		UPDATE fts
		SET fts.DimTicketClassId = 25
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('FB08','FB09','FB10','FB11','FB12','FB13','FB14','FB15','FB16','FB17')
		AND		Itemcode like 'F0%'
		AND		PriceTypeCode = 'G'



--MEN'S BASKETBALL 2016-2017

		----FULL SEASON PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 26
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		Itemcode like 'BS%'
		AND		PriceTypeCode LIKE 'R%' AND PriceTypeCode <> 'RD'



		----FULL SEASON FACULTY----

		UPDATE fts
		SET fts.DimTicketClassId = 4
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		Itemcode like 'BS%'
		AND		PriceTypeCode IN ('S','X')



		----FULL SEASON STUDENT----

		UPDATE fts
		SET fts.DimTicketClassId = 27
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		Itemcode like 'BS%'
		AND		PriceTypeCode = 'KS'




		----FULL SEASON COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 13
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		Itemcode like 'BS%'
		AND		PriceTypeCode IN ('C','RD','B','CRC','TC')



		----TAR HEEL PACKAGE----

		UPDATE fts
		SET fts.DimTicketClassId = 28
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		Itemcode like 'TH%'
		AND		PriceTypeCode = 'A'



		----MINI PLAN----

		UPDATE fts
		SET fts.DimTicketClassId = 16
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(Itemcode like 'B0%' OR ItemCode LIKE 'B1%')
		AND		PriceTypeCode = '5G'



		----GROUP----

		UPDATE fts
		SET fts.DimTicketClassId = 17
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(Itemcode like 'B0%' OR ItemCode LIKE 'B1%')
		AND		PriceTypeCode = 'G15'



		----SINGLE GAME PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 18
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(Itemcode like 'B0%' OR ItemCode LIKE 'B1%')
		AND		(PriceTypeCode IN ('A', 'AR', 'V', 'W', 'O') OR PriceTypeCode LIKE 'M%')



		----SINGLE GAME COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 19
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(Itemcode like 'B0%' OR ItemCode LIKE 'B1%')
		AND		PriceTypeCode IN ('C', 'TC', 'CRC', 'VT')



		----SINGLE GAME PROMO----

		UPDATE fts
		SET fts.DimTicketClassId = 20
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(Itemcode like 'B0%' OR ItemCode LIKE 'B1%')
		AND		(PriceTypeCode LIKE 'PR%' OR PriceTypeCode LIKE 'LS%')



		----SINGLE GAME STUBHUB----

		UPDATE fts
		SET fts.DimTicketClassId = 21
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(Itemcode like 'B0%' OR ItemCode LIKE 'B1%')
		AND		PriceTypeCode LIKE 'SH%'



		----SINGLE GAME TRANSFER----

		UPDATE fts
		SET fts.DimTicketClassId = 22
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(Itemcode like 'B0%' OR ItemCode LIKE 'B1%')
		AND		PriceTypeCode LIKE '%T'



		----STUDENT----

		UPDATE fts
		SET fts.DimTicketClassId = 24
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(Itemcode like 'B0%' OR ItemCode LIKE 'B1%')
		AND		PriceTypeCode IN ('K', 'B1', 'B2', 'B3', 'B4', 'B5', 'SO')



		----STUDENT GUEST----

		UPDATE fts
		SET fts.DimTicketClassId = 25
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('MB17')
		AND		(Itemcode like 'B0%' OR ItemCode LIKE 'B1%')
		AND		PriceTypeCode = 'SG'



--BASEBALL 2017

		----FULL SEASON PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 26
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode like 'BBS%'
		AND		PriceTypeCode = 'A'



		----FULL SEASON FACULTY----

		UPDATE fts
		SET fts.DimTicketClassId = 4
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode like 'BBS%'
		AND		PriceTypeCode = 'C'



		----FULL SEASON COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 13
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode like 'BBS%'
		AND		PriceTypeCode IN ('C','DH','BO')



		----FULL SEASON RECENT GRAD----

		UPDATE fts
		SET fts.DimTicketClassId = 5
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode like 'BBS%'
		AND		PriceTypeCode LIKE 'RG%'



		----HALF SEASON PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 29
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode = 'MINI'
		AND		PriceTypeCode = 'A'



		----HALF SEASON FACULTY----

		UPDATE fts
		SET fts.DimTicketClassId = 30
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode = 'MINI'
		AND		PriceTypeCode = 'U'



		----HALF SEASON COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 31
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode = 'MINI'
		AND		PriceTypeCode = 'C'



		----HALF SEASON RECENT GRAD----

		UPDATE fts
		SET fts.DimTicketClassId = 32
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode = 'MINI'
		AND		PriceTypeCode LIKE 'RG%'



		----MINI PLAN PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 16
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode = '3G/6G/ACC'
		AND		PriceTypeCode = '3G/6G/A'



		----MINI PLAN COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 33
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode = '3G/6G/ACC'
		AND		PriceTypeCode = 'C'



		----GROUP----

		UPDATE fts
		SET fts.DimTicketClassId = 17
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode LIKE 'BB[0-3]%'
		AND		PriceTypeCode = 'GRP'



		----SINGLE GAME PAID----

		UPDATE fts
		SET fts.DimTicketClassId = 18
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode LIKE 'BB[0-3]%'
		AND		PriceTypeCode IN ('A','MIL','SEN')



		----SINGLE GAME COMP----

		UPDATE fts
		SET fts.DimTicketClassId = 19
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode LIKE 'BB[0-3]%'
		AND		PriceTypeCode IN ('C','DH','KC','VT')



		----SINGLE GAME PROMO----

		UPDATE fts
		SET fts.DimTicketClassId = 20
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode LIKE 'BB[0-3]%'
		AND		PriceTypeCode IN ('KCP','HP','BK')



		----STUDENT----

		UPDATE fts
		SET fts.DimTicketClassId = 24
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode LIKE 'BB[0-3]%'
		AND		PriceTypeCode = 'K'



		----STUDENT GUEST----

		UPDATE fts
		SET fts.DimTicketClassId = 25
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceType PriceType ON PriceType.DimPriceTypeId = fts.DimPriceTypeId
				INNER JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
				JOIN dbo.DimDate DimDate ON DimDate.DimDateId = fts.DimDateId	
				JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
				JOIN dbo.dimplan p ON p.DimPlanId = fts.DimPlanId
		WHERE	SeasonCode IN ('BB17')
		AND		Itemcode LIKE 'BB[0-3]%'
		AND		PriceTypeCode = 'SG'







/*****************************************************************************************************************
															SEAT TYPE
******************************************************************************************************************/

--FOOTBALL

		----ZONE 1----

		UPDATE fts
		SET fts.DimSeatTypeId = 1
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('FB15','FB16')
		AND		PriceLevelCode = '1'
		AND		SectionName NOT IN ('132','133','134','135','136','137','138','232','233','234','235','236','NKB','SKB')
		AND		SectionName NOT LIKE 'Suite:%' AND SectionName NOT LIKE '30%' AND SectionName NOT LIKE '50%'



		----ZONE 2----

		UPDATE fts
		SET fts.DimSeatTypeId = 2
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('FB15','FB16')
		AND		PriceLevelCode = '2'


	   
		----ZONE 3----

		UPDATE fts
		SET fts.DimSeatTypeId = 3
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('FB15','FB16')
		AND		PriceLevelCode = '3'



		----RESERVED----

		UPDATE fts
		SET fts.DimSeatTypeId = 11
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('FB08','FB09','FB10','FB11','FB12','FB13','FB14')
		AND		PriceLevelCode = '1'
		AND		(SectionName NOT IN ('132','133','134','135','136','137','138','232','233','234','235','236','NKB','SKB')
		AND		SectionName NOT LIKE 'Suite:%' AND SectionName NOT LIKE '30%' AND SectionName NOT LIKE '50%')


	   
		----PREMIUM----

		UPDATE fts
		SET fts.DimSeatTypeId = 4
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('FB12','FB13','FB14','FB15','FB16')
		AND		PriceLevelCode = '1'
		AND		(SectionName IN ('132','133','134','135','136','137','138','232','233','234','235','236','NKB','SKB')
		OR		SectionName LIKE 'Suite:%' OR SectionName LIKE '30%' OR SectionName LIKE '50%')



		----GENERAL ADMISSION----

		UPDATE fts
		SET fts.DimSeatTypeId = 10
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	(ds.SeasonCode IN ('FB15') AND PriceLevelCode = '5')
		OR		(ds.SeasonCode IN ('FB11','FB12','FB13','FB14') AND PriceLevelCode = '2')



--FOOTBALL 2017

		----ZONE 1----

		UPDATE fts
		SET fts.DimSeatTypeId = 1
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('FB17')
		AND		PriceLevelCode = '1'



		----ZONE 2----

		UPDATE fts
		SET fts.DimSeatTypeId = 2
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('FB17')
		AND		PriceLevelCode = '2'


	   
		----ZONE 3----

		UPDATE fts
		SET fts.DimSeatTypeId = 3
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('FB17')
		AND		PriceLevelCode = '3'


	   
		----PREMIUM----

		UPDATE fts
		SET fts.DimSeatTypeId = 4
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('FB17')
		AND		PriceLevelCode = '4'



		----STUDENT----

		UPDATE fts
		SET fts.DimSeatTypeId = 5
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('FB17')
		AND		PriceLevelCode = '5'



--MEN'S BASKETBALL 2016-2017

		----LOWER LEVEL----

		UPDATE fts
		SET fts.DimSeatTypeId = 6
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('MB17')
		AND		PriceLevelCode = '1'
		AND		LevelName = 'LL'



		----MEZZANINE LEVEL----

		UPDATE fts
		SET fts.DimSeatTypeId = 7
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('MB17')
		AND		PriceLevelCode = '2'
		AND		LevelName = 'MZ'



		----UPPER LEVEL----

		UPDATE fts
		SET fts.DimSeatTypeId = 8
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('MB17')
		AND		PriceLevelCode IN ('3','4')
		AND		LevelName = 'UL'



		----FLOOR LEVEL----

		UPDATE fts
		SET fts.DimSeatTypeId = 9
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('MB17')
		AND		PriceLevelCode = '1'
		AND		LevelName = 'FL'



--BASEBALL 2017

		----MAIN GRAND STAND----

		UPDATE fts
		SET fts.DimSeatTypeId =10
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('BB17')
		AND		PriceLevelCode = '1'
		AND		LevelName = 'LL'



		----LEFT & RIGHT FIELD GRAND STAND----

		UPDATE fts
		SET fts.DimSeatTypeId = 11
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('BB17')
		AND		PriceLevelCode = '2'
		AND		LevelName = 'LL'



		----GENERAL ADMISSION----

		UPDATE fts
		SET fts.DimSeatTypeId = 12
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('BB17')
		AND		PriceLevelCode = '3'
		AND		LevelName = 'LL'



		----STANDING ROOM ONLY----

		UPDATE fts
		SET fts.DimSeatTypeId = 14
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('BB17')
		AND		LevelName = 'SRO'



		----SUITE----

		UPDATE fts
		SET fts.DimSeatTypeId = 13
		FROM    stg.FactOdet fts
				INNER JOIN dbo.DimPriceLevel PriceLevel ON fts.dimpricelevelid = PriceLevel.DimPriceLevelID
				INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.dimseasonID
				JOIN dbo.DimSeat s ON s.DimSeatID = fts.DimSeatID_Start
		WHERE	ds.SeasonCode IN ('BB17')
		AND		LevelName = 'SUITE'



		



/*****************************************************************************************************************
													FACT TAGS
******************************************************************************************************************/


UPDATE f
SET f.IsComp = 1
FROM stg.FactOdet f
	JOIN dbo.DimPriceType dpc
	ON dpc.DimPriceTypeId = f.DimPriceTypeId
WHERE f.DimPlanTypeID = 1
	  OR PriceTypeDesc LIKE '%Comp %'
	  OR f.TotalRevenue = 0


UPDATE f
SET f.IsComp = 0
FROM stg.FactOdet f
	JOIN dbo.DimPriceType dpc
	ON dpc.DimPriceTypeId = f.DimPriceTypeId
WHERE f.DimPlanTypeID <> 1
		   OR PriceTypeDesc NOT LIKE '%Comp %'
		   OR f.TotalRevenue = 0

UPDATE f
SET f.IsPlan = 1
, f.IsPartial = 0
, f.IsSingleEvent = 0
, f.IsGroup = 0
FROM stg.FactOdet f
WHERE DimTicketTypeId IN (1) 



UPDATE f
SET f.IsPlan = 1
, f.IsPartial = 1
, f.IsSingleEvent = 0
, f.IsGroup = 0
FROM stg.FactOdet f
WHERE DimTicketTypeId IN (2, 3, 7, 8) 


UPDATE f
SET f.IsPlan = 0
, f.IsPartial = 0
, f.IsSingleEvent = 1
, f.IsGroup = 1
FROM stg.FactOdet f
WHERE DimTicketTypeId IN (3) 


UPDATE f
SET f.IsPlan = 0
, f.IsPartial = 0
, f.IsSingleEvent = 1
, f.IsGroup = 0
FROM stg.FactOdet f
WHERE DimTicketTypeId IN (4, 5, 6) 

/*
UPDATE f
SET f.IsPremium = 1
FROM stg.FactOdet f
INNER JOIN dbo.DimSeatType dst ON f.DimSeatTypeId = dst.DimSeatTypeId
WHERE dst.SeatTypeCode <> 'GA'


UPDATE f
SET f.IsPremium = 0
FROM stg.FactOdet f
INNER JOIN dbo.DimSeatType dst ON f.DimSeatTypeId = dst.DimSeatTypeId
WHERE dst.SeatTypeCode = 'GA'
*/


UPDATE f
SET f.IsRenewal = 0
FROM stg.FactOdet f


UPDATE f
SET f.IsDiscount = 0
FROM stg.FactOdet f
where CAST(discount AS DECIMAL(10,2)) = 0.00


UPDATE f
SET f.IsDiscount = 1
FROM stg.FactOdet f
where CAST(discount AS DECIMAL(10,2)) > 0.00





	

END





















































GO
