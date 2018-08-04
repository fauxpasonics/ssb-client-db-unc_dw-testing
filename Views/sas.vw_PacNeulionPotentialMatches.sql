SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [sas].[vw_PacNeulionPotentialMatches]
AS
SELECT dcpac.Pac_PatronID, dcpac.Pac_First, dcpac.Pac_Last, dcpac.Pac_Email, dcpac.Pac_Phone, dcpac.Pac_Address, dcpac.Pac_City, dcpac.Pac_State, dcpac.Pac_ZipCode
	, dcrc.RamsClub_MemberID, dcrc.RamsClub_First, dcrc.RamsClub_Last, dcrc.RamsClub_Email, dcrc.RamsClub_Phone, dcrc.RamsClub_Address, dcrc.RamsClub_City, dcrc.RamsClub_State, dcrc.RamsClub_ZipCode
FROM (
			SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.SSID Pac_PatronID, dc.FirstName Pac_First, dc.LastName Pac_Last, dc.EmailPrimary Pac_Email, dc.PhonePrimary Pac_Phone
				, dc.AddressPrimaryStreet Pac_Address, dc.AddressPrimaryCity Pac_City, dc.AddressPrimaryState Pac_State, dc.AddressPrimaryZip Pac_ZipCode
			FROM dbo.DimCustomer dc (NOLOCK)
			JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
				ON dc.DimCustomerId = ssbid.DimCustomerId
				AND dc.SourceSystem = 'Pac'
	) dcpac
JOIN  (
			SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.SSID RamsClub_MemberID, dc.FirstName RamsClub_First, dc.LastName RamsClub_Last, dc.EmailPrimary RamsClub_Email, dc.PhonePrimary RamsClub_Phone
				, dc.AddressPrimaryStreet RamsClub_Address, dc.AddressPrimaryCity RamsClub_City, dc.AddressPrimaryState RamsClub_State, dc.AddressPrimaryZip RamsClub_ZipCode
			FROM dbo.DimCustomer dc (NOLOCK)
			JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
				ON dc.DimCustomerId = ssbid.DimCustomerId
				AND dc.SourceSystem = 'Neulion'
	) dcrc ON dcpac.Pac_First = dcrc.RamsClub_First
		AND dcpac.Pac_Last = dcrc.RamsClub_Last
		AND dcpac.SSB_CRMSYSTEM_CONTACT_ID <> dcrc.SSB_CRMSYSTEM_CONTACT_ID
WHERE dcpac.Pac_First IS NOT NULL AND dcpac.Pac_Last IS NOT NULL
AND dcpac.Pac_First <> '' AND dcpac.Pac_Last <> ''

GO
