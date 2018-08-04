SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [sas].[vw_rpt_ConstituentSummary_bkp]
AS

WITH FirstStep (DimTicketCustomerID, TotalTicketSales, TotalTicketRevenue)
AS
	(SELECT DimTicketCustomerId, SUM(QtySeat) TotalTicketSales, SUM(TotalRevenue) TotalTicketRevenue
	FROM dbo.FactTicketSales f (NOLOCK)
	--JOIN dbo.DimEvent e (NOLOCK)
	--	ON f.DimEventId = e.DimEventId
	--WHERE e.EventCode NOT LIKE 'P%' --removes parking
	GROUP BY DimTicketCustomerId)

	
, SecondStep (Customer, TotalScanned)
AS
	(SELECT Customer, SUM(REDEEMED) TotalScanned
	FROM dbo.TK_BC (NOLOCK)
	--WHERE EVENT NOT LIKE 'P%' -- removes parking
	GROUP BY CUSTOMER)

SELECT
	dc.SSB_CRMSYSTEM_CONTACT_ID
	, SUM(fts.TotalTicketSales) TotalTicketsPurchased
	, SUM(fts.TotalTicketRevenue) TotalTicketRevenue
	, SUM(bc.TotalScanned) TotalTicketsScanned
	, SUM(nc.LifetimeGivingAmount) RamsClubLifetimeGivingAmount
	, SUM(nc.LifetimePledges) RamsClubLifetimePledges
	, SUM(nc.LifetimePaid) RamsClubLifetimePaid
	, SUM(bb.AMOUNT) UniversityAllTimeAmountDonated
FROM dbo.vwDimCustomer_ModAcctId dc
LEFT JOIN dbo.DimTicketCustomer dtc (NOLOCK) ON dc.SourceSystem = dtc.ETL__SourceSystem AND dc.SSID = dtc.ETL__SSID
LEFT JOIN FirstStep fts ON dtc.DimTicketCustomerId = fts.DimTicketCustomerId
LEFT JOIN SecondStep bc ON bc.CUSTOMER = dc.SSID AND dc.SourceSystem = 'PAC'
LEFT JOIN sas.vw_Neulion_Contrib nc (NOLOCK) ON dc.ssid = CAST(nc.MemberID AS NVARCHAR(100)) AND dc.SourceSystem <> 'Pac'
LEFT JOIN ods.BB_RevenueSummary bb (NOLOCK) ON dc.SSID = CAST(bb.CONSTITUENTID AS NVARCHAR(100))
GROUP BY dc.SSB_CRMSYSTEM_CONTACT_ID
GO
