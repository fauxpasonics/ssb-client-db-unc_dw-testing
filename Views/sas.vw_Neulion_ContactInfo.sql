SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_Neulion_ContactInfo]
AS

WITH FirstStep (SSB_CRMSYSTEM_CONTACT_ID, SourceSystem, UpdatedDate) AS
	(SELECT SSB_CRMSYSTEM_CONTACT_ID, SourceSystem, MAX(SSUpdatedDate) UpdatedDate
	FROM sas.vw_DimCustomer (NOLOCK)
	WHERE SourceSystem IN ('Neulion','NeulionSpouse')
	GROUP BY SSB_CRMSYSTEM_CONTACT_ID, SourceSystem)

SELECT cr.SSB_CRMSYSTEM_CONTACT_ID
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.DimCustomerId ELSE dcpac.DimCustomerId END AS DimCustomerID
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN CAST(cr.SSID AS INT) ELSE CAST(dcpac.SSID AS INT) END AS MemberID
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.FirstName ELSE dcpac.FirstName END AS FirstName
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.MiddleName ELSE dcpac.MiddleName END AS MiddleName
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.LastName ELSE dcpac.LastName END AS LastName
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.NameIsCleanStatus ELSE dcpac.NameIsCleanStatus END AS NameIsCleanStatus
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.EmailPrimary ELSE dcpac.EmailPrimary END AS Email
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.EmailPrimaryIsCleanStatus ELSE dcpac.EmailPrimaryIsCleanStatus END AS EmailIsCleanStatus
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.PhonePrimary ELSE dcpac.PhonePrimary END AS Phone
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.PhonePrimaryIsCleanStatus ELSE dcpac.PhonePrimaryIsCleanStatus END AS PhoneIsCleanStatus
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.AddressPrimaryStreet ELSE dcpac.AddressPrimaryStreet END AS StreetAddress
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.AddressPrimarySuite ELSE dcpac.AddressPrimarySuite END AS Suite
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.AddressPrimaryCity ELSE dcpac.AddressPrimaryCity END AS City
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.AddressPrimaryState ELSE dcpac.AddressPrimaryState END AS [State]
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.AddressPrimaryZip ELSE dcpac.AddressPrimaryZip END AS Zip
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.AddressPrimaryPlus4 ELSE dcpac.AddressPrimaryPlus4 END AS ZipPlus4
	, CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.AddressPrimaryIsCleanStatus ELSE dcpac.AddressPrimaryIsCleanStatus END AS AddressIsCleanStatus
FROM mdm.compositerecord cr (NOLOCK)
LEFT JOIN (
	SELECT dc.SSB_CRMSYSTEM_CONTACT_ID, DimCustomerID, SSID, dc.FirstName, dc.MiddleName, dc.LastName, dc.NameIsCleanStatus
		, dc.EmailPrimary, dc.EmailPrimaryIsCleanStatus, dc.PhonePrimary, dc.PhonePrimaryIsCleanStatus, dc.AddressPrimaryStreet, dc.AddressPrimarySuite
		, dc.AddressPrimaryCity, dc.AddressPrimaryState, dc.AddressPrimaryZip, dc.AddressPrimaryPlus4, dc.AddressPrimaryCounty, dc.AddressPrimarycountry, dc.AddressPrimaryIsCleanStatus
	FROM sas.vw_DimCustomer dc (NOLOCK)
	JOIN FirstStep fs
		ON fs.SSB_CRMSYSTEM_CONTACT_ID = dc.SSB_CRMSYSTEM_CONTACT_ID AND fs.SourceSystem = dc.SourceSystem AND fs.UpdatedDate = dc.UpdatedDate
	WHERE (dc.SourceSystem = 'Neulion' OR dc.SourceSystem = 'NeulionSpouse')
	) dcpac ON cr.SSB_CRMSYSTEM_CONTACT_ID = dcpac.SSB_CRMSYSTEM_CONTACT_ID
WHERE CASE WHEN (cr.SourceSystem = 'Neulion' OR cr.SourceSystem = 'NeulionSpouse') THEN cr.DimCustomerId ELSE dcpac.DimCustomerId END IS NOT NULL

GO
