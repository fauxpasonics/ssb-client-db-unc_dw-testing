SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [sas].[vw_PacBlackbaudPotentialMatches]
AS
SELECT dcpac.Pac_PatronID, dcpac.Pac_First, dcpac.Pac_Last, dcpac.Pac_Email, dcpac.Pac_Phone, dcpac.Pac_Address, dcpac.Pac_City, dcpac.Pac_State, dcpac.Pac_ZipCode
	, dcrc.Blackbaud_MemberID, dcrc.Blackbaud_First, dcrc.Blackbaud_Last, dcrc.Blackbaud_Email, dcrc.Blackbaud_Phone, dcrc.Blackbaud_Address, dcrc.Blackbaud_City, dcrc.Blackbaud_State, dcrc.Blackbaud_ZipCode
FROM (
			SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.SSID Pac_PatronID, dc.FirstName Pac_First, dc.LastName Pac_Last, dc.EmailPrimary Pac_Email, dc.PhonePrimary Pac_Phone
				, dc.AddressPrimaryStreet Pac_Address, dc.AddressPrimaryCity Pac_City, dc.AddressPrimaryState Pac_State, dc.AddressPrimaryZip Pac_ZipCode
			FROM dbo.DimCustomer dc (NOLOCK)
			JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
				ON dc.DimCustomerId = ssbid.DimCustomerId
				AND dc.SourceSystem = 'Pac'
	) dcpac
JOIN  (
			SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, dc.SSID Blackbaud_MemberID, dc.FirstName Blackbaud_First, dc.LastName Blackbaud_Last, dc.EmailPrimary Blackbaud_Email, dc.PhonePrimary Blackbaud_Phone
				, dc.AddressPrimaryStreet Blackbaud_Address, dc.AddressPrimaryCity Blackbaud_City, dc.AddressPrimaryState Blackbaud_State, dc.AddressPrimaryZip Blackbaud_ZipCode
			FROM dbo.DimCustomer dc (NOLOCK)
			JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
				ON dc.DimCustomerId = ssbid.DimCustomerId
				AND dc.SourceSystem = 'Blackbaud'
	) dcrc ON dcpac.Pac_First = dcrc.Blackbaud_First
		AND dcpac.Pac_Last = dcrc.Blackbaud_Last
		AND dcpac.SSB_CRMSYSTEM_CONTACT_ID <> dcrc.SSB_CRMSYSTEM_CONTACT_ID
WHERE dcpac.Pac_First IS NOT NULL AND dcpac.Pac_Last IS NOT NULL
AND dcpac.Pac_First <> '' AND dcpac.Pac_Last <> ''

GO
