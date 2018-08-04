SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [sas].[vw_NeulionBlackbaudPotentialMatches]
AS
SELECT dcRamsClub.RamsClub_PatronID, dcRamsClub.RamsClub_First, dcRamsClub.RamsClub_Last, dcRamsClub.RamsClub_Email, dcRamsClub.RamsClub_Phone, dcRamsClub.RamsClub_Address, dcRamsClub.RamsClub_City, dcRamsClub.RamsClub_State, dcRamsClub.RamsClub_ZipCode
	, dcrc.Blackbaud_MemberID, dcrc.Blackbaud_First, dcrc.Blackbaud_Last, dcrc.Blackbaud_Email, dcrc.Blackbaud_Phone, dcrc.Blackbaud_Address, dcrc.Blackbaud_City, dcrc.Blackbaud_State, dcrc.Blackbaud_ZipCode
FROM (
			SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.SSID RamsClub_PatronID, dc.FirstName RamsClub_First, dc.LastName RamsClub_Last, dc.EmailPrimary RamsClub_Email, dc.PhonePrimary RamsClub_Phone
				, dc.AddressPrimaryStreet RamsClub_Address, dc.AddressPrimaryCity RamsClub_City, dc.AddressPrimaryState RamsClub_State, dc.AddressPrimaryZip RamsClub_ZipCode
			FROM dbo.DimCustomer dc (NOLOCK)
			JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
				ON dc.DimCustomerId = ssbid.DimCustomerId
				AND dc.SourceSystem = 'Neulion'
	) dcRamsClub
JOIN  (
			SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.SSID Blackbaud_MemberID, dc.FirstName Blackbaud_First, dc.LastName Blackbaud_Last, dc.EmailPrimary Blackbaud_Email, dc.PhonePrimary Blackbaud_Phone
				, dc.AddressPrimaryStreet Blackbaud_Address, dc.AddressPrimaryCity Blackbaud_City, dc.AddressPrimaryState Blackbaud_State, dc.AddressPrimaryZip Blackbaud_ZipCode
			FROM dbo.DimCustomer dc (NOLOCK)
			JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
				ON dc.DimCustomerId = ssbid.DimCustomerId
				AND dc.SourceSystem = 'Blackbaud'
	) dcrc ON dcRamsClub.RamsClub_First = dcrc.Blackbaud_First
		AND dcRamsClub.RamsClub_Last = dcrc.Blackbaud_Last
		AND dcRamsClub.SSB_CRMSYSTEM_CONTACT_ID <> dcrc.SSB_CRMSYSTEM_CONTACT_ID
WHERE dcRamsClub.RamsClub_First IS NOT NULL AND dcRamsClub.RamsClub_Last IS NOT NULL
AND dcRamsClub.RamsClub_First <> '' AND dcRamsClub.RamsClub_Last <> ''

GO
