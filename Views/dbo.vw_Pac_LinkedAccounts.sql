SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_Pac_LinkedAccounts]
AS

WITH FirstStep
AS (
	SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, MIN(p.BuyerTypeRank) BuyerTypeRank, MAX(p.SSUpdatedDate) UpdatedDate
	FROM dbo.Pac_LinkedAccounts p
	JOIN dbo.dimcustomerssbid ssbid
		ON p.PatronID = ssbid.ssid
		AND ssbid.SourceSystem = 'Pac'
	GROUP BY ssbid.SSB_CRMSYSTEM_CONTACT_ID

)


SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, MAX(p.Linked) Linked, MAX(p.PIN) PIN
FROM dbo.Pac_LinkedAccounts p
JOIN dbo.dimcustomerssbid ssbid 
	ON p.PatronID = ssbid.ssid
	AND ssbid.SourceSystem = 'Pac'
JOIN FirstStep fs
	ON fs.SSB_CRMSYSTEM_CONTACT_ID = ssbid.SSB_CRMSYSTEM_CONTACT_ID
	AND fs.BuyerTypeRank = p.BuyerTypeRank
	AND fs.UpdatedDate = CASE WHEN p.BuyerTypeRank = 4 THEN p.SSUpdatedDate
							ELSE fs.UpdatedDate
							END
GROUP BY ssbid.SSB_CRMSYSTEM_CONTACT_ID
GO
