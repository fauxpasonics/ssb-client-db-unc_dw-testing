SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [rpt].[Load_TicketAttendance]
AS

TRUNCATE TABLE rpt.TicketAttendance

INSERT INTO rpt.TicketAttendance ( SSB_CRMSYSTEM_CONTACT_ID, FirstName, LastName
	, Sport, SeasonYear, SeasonCode, SeasonName, EventCode, EventName, ItemCode
	, ItemName, Section, [Row], Seat, PriceType, PriceTypeName, TicketPrice
	, TotalPaid, TicketTypeName, PlanTypeName, TicketClassName, TicketClassType
	, Attended, ScanDate, ScanTime, ScanLocation, ScanGate)

SELECT
	cr.SSB_CRMSYSTEM_CONTACT_ID
	, cr.FirstName
	, cr.LastName
	, CASE WHEN t.Season LIKE 'BB%' THEN 'Baseball'
		WHEN t.Season LIKE 'FB%' THEN 'Football'
		WHEN t.Season LIKE 'FH%' THEN 'Field Hockey'
		WHEN t.Season LIKE 'KC%' THEN 'Kids Club'
		WHEN t.Season LIKE 'MB%' THEN 'Men''s Basketball'
		WHEN t.Season LIKE 'ML%' THEN 'Men''s Lacrosse'
		WHEN t.Season LIKE 'MS%' THEN 'Men''s Soccer'
		WHEN t.Season LIKE 'MT%' THEN 'Men''s Tennis'
		WHEN t.Season LIKE 'SB%' THEN 'Softball'
		WHEN t.Season LIKE 'SE%' THEN 'Special Event'
		WHEN t.Season LIKE 'VB%' THEN 'Volleyball'
		WHEN t.Season LIKE 'WB%' THEN 'Women''s Basketball'
		WHEN t.Season LIKE 'WL%' THEN 'Women''s Lacrosse'
		WHEN t.Season LIKE 'WR%' THEN 'Wrestling'
		WHEN t.Season LIKE 'WS%' THEN 'Women''s Soccer'
		WHEN t.Season LIKE 'WT%' THEN 'Women''s Tennis'
		END AS Sport
	, CASE WHEN RIGHT(t.season,2) LIKE '7%' THEN CAST(CONCAT('19',RIGHT(t.season,2)) AS INT)
		ELSE CAST(CONCAT('20',RIGHT(t.season,2)) AS INT)
		END AS SeasonYear
	, CAST(t.Season AS NVARCHAR(10)) SeasonCode
	, CAST(ts.[NAME] AS NVARCHAR(30)) SeasonName
	, CAST(ss.[Event] AS NVARCHAR(20)) EventCode
	, CAST(te.[NAME] AS NVARCHAR(200)) EventName
	, CAST(t.ITEM AS NVARCHAR(20)) ItemCode
	, CAST(ti.[NAME] AS NVARCHAR(200)) ItemName
	, CAST(ss.Section AS NVARCHAR (20)) Section
	, CAST(ss.[Row] AS NVARCHAR(20)) [Row]
	, CAST(ss.Seat AS NVARCHAR(10)) Seat
	, CAST(t.I_PT AS NVARCHAR(10)) AS PriceType
	, CAST(pt.[Name] AS NVARCHAR(200)) AS PriceTypeName
	, toec.E_PRICE TicketPrice
	, CASE WHEN toec.E_AQTY > 0 THEN CAST((toec.E_PRICE * toec.E_AQTY) AS DECIMAL (15,2))
		ELSE 0.00 END AS TotalPaid
	, tg.TicketTypeName TicketTypeName
	, tg.PlanTypeName PlanTypeName
	, tg.TicketClassName 
	, tg.TicketClass TicketClassType
	, bc.Attended
	, bc.Scan_Date ScanDate
	, bc.Scan_Time ScanTime
	, bc.SCAN_LOC ScanLocation
	, bc.SCAN_GATE ScanGate
--SELECT 
FROM dbo.TK_ODET t (NOLOCK)
JOIN dbo.TK_ODET_EVENT_ASSOC toec (NOLOCK) 
	ON t.SEASON = toec.SEASON
	AND t.CUSTOMER = toec.CUSTOMER AND t.SEQ = toec.SEQ
JOIN dbo.TK_SEAT_SEAT ss (NOLOCK)
	ON toec.SEASON = ss.SEASON
	AND toec.CUSTOMER = ss.CUSTOMER
	AND toec.SEQ = ss.SEQ
	AND toec.EVENT = ss.EVENT
JOIN dbo.TK_BC bc (NOLOCK)
	ON bc.SEASON = ss.SEASON
	AND bc.BC_ID = ss.BARCODE
JOIN dbo.TK_SEASON ts (NOLOCK)
	ON t.SEASON = ts.SEASON
JOIN dbo.TK_EVENT te (NOLOCK)
	ON toec.SEASON = te.SEASON
	AND toec.[EVENT] = te.[EVENT]
JOIN dbo.TK_ITEM ti (NOLOCK)
	ON t.SEASON = ti.SEASON
	AND t.ITEM = ti.ITEM
JOIN dbo.TK_PRTYPE pt (NOLOCK)
	ON t.SEASON = pt.SEASON
	AND t.I_PT = pt.PRTYPE
JOIN dbo.dimcustomerssbid dc (NOLOCK)
	ON t.CUSTOMER = dc.SSID
JOIN mdm.CompositeRecord cr (NOLOCK)
	ON dc.SSB_CRMSYSTEM_CONTACT_ID = cr.SSB_CRMSYSTEM_CONTACT_ID
JOIN dbo.TicketTagging tg (NOLOCK)
	ON t.Season COLLATE SQL_Latin1_General_CP1_CI_AS = tg.Season
	AND t.Item COLLATE SQL_Latin1_General_CP1_CI_AS = tg.Item
	AND t.I_PT COLLATE SQL_Latin1_General_CP1_CI_AS = tg.PriceType
	AND t.I_PL COLLATE SQL_Latin1_General_CP1_CI_AS = tg.PriceLevel
GO
