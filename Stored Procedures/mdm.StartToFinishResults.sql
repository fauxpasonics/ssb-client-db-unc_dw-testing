SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [mdm].[StartToFinishResults] @SSBID NVARCHAR(255)
AS


--show golden record
SELECT *
FROM mdm.compositerecord
WHERE SSB_CRMSYSTEM_CONTACT_ID = @SSBID


--show all records in dimcustomer
SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.*
FROM dbo.dimcustomer dc
JOIN dbo.dimcustomerssbid ssbid ON dc.DimCustomerId = ssbid.DimCustomerId
WHERE ssbid.SSB_CRMSYSTEM_CONTACT_ID = @SSBID
ORDER BY sourcesystem, dc.SSUpdatedDate

--show Spectra purchases
SELECT fts.*, ds.*, pd.*
FROM mdm.compositerecord cr
JOIN dbo.dimcustomerssbid ssbid ON cr.SSB_CRMSYSTEM_CONTACT_ID = ssbid.SSB_CRMSYSTEM_CONTACT_ID
JOIN dbo.dimcustomer dc ON ssbid.DimCustomerId = dc.DimCustomerId
JOIN dbo.DimTicketCustomer dtc ON dc.ssid = dtc.ETL__SSID AND dc.SourceSystem = dtc.ETL__SourceSystem
JOIN dbo.factticketsales fts ON dtc.DimTicketCustomerId = fts.DimTicketCustomerId
JOIN dbo.dimseason ds ON fts.DimSeasonId = ds.DimSeasonId
JOIN dbo.DimItem di ON fts.DimItemId = di.DimItemId
JOIN dbo.DimPriceType pd ON fts.DimPriceTypeId = pd.DimPriceTypeId
WHERE cr.SSB_CRMSYSTEM_CONTACT_ID = @SSBID

--show Blackbaud donations
SELECT rev.*
FROM mdm.compositerecord cr
JOIN dbo.dimcustomerssbid ssbid ON cr.SSB_CRMSYSTEM_CONTACT_ID = ssbid.SSB_CRMSYSTEM_CONTACT_ID
JOIN (
		SELECT * FROM dbo.dimcustomer
		WHERE SourceSystem = 'Blackbaud'
	) dc ON ssbid.DimCustomerId = dc.DimCustomerId
JOIN ods.BB_REVENUE rev ON dc.ssid = rev.CONSTITUENTID
WHERE cr.SSB_CRMSYSTEM_CONTACT_ID = @SSBID


GO
