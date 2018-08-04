SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [mdm].[vw_Pac_STH] AS
(
SELECT dc.DimCustomerID, STH, MPH, SG, MaxTransDate, dc.AccountID
FROM dbo.dimcustomer dc
JOIN dbo.DimTicketCustomer dtc
	ON dc.SSID = dtc.ETL__SSID
	AND dc.SourceSystem = dtc.ETL__SourceSystem
LEFT JOIN (
	SELECT DISTINCT a.DimTicketCustomerId, 1 AS 'STH' FROM dbo.factticketsales a
	LEFT JOIN dbo.dimdate dd ON a.DimDateId = dd.DimDateId
	WHERE a.DimTicketTypeId IN (1) AND dd.CalDate >= (GETDATE()-730)) sth ON dtc.dimTicketcustomerid = sth.dimTicketcustomerid

LEFT JOIN (
	SELECT DISTINCT a.DimTicketCustomerId, 1 AS 'MPH' FROM dbo.factticketsales a
	LEFT JOIN dbo.dimdate dd ON a.DimDateId = dd.DimDateId
	WHERE a.DimTicketTypeId IN (2) AND dd.CalDate > (GETDATE()-730)) mph ON dtc.dimTicketcustomerid = mph.dimTicketcustomerid
LEFT JOIN (
	SELECT DISTINCT a.DimTicketCustomerId, 1 AS 'SG' FROM dbo.factticketsales a
	LEFT JOIN dbo.dimdate dd ON a.DimDateId = dd.DimDateId
	WHERE a.DimTicketTypeId IN (3, 4, 5, 6, 7, 8) AND dd.caldate >= (GETDATE()-730)) sg ON dtc.dimTicketcustomerid = sg.dimTicketcustomerid
LEFT JOIN (
		SELECT f.DimTicketCustomerId, MAX(dd.CalDate) MaxTransDate
		--Select * 
		FROM dbo.FactTicketSales f WITH(NOLOCK)
		INNER JOIN dbo.DimDate  dd WITH(NOLOCK) ON dd.DimDateId = f.DimDateId
		WHERE dd.CalDate >= (GETDATE() - 730)
		GROUP BY f.DimTicketCustomerId
	) purchasedate ON purchasedate.DimTicketCustomerId = dtc.DimTicketCustomerId







)








GO
