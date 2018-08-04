SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_rpt_Constituents_RegistryView]
AS

SELECT
	  ssbid.SSB_CRMSYSTEM_CONTACT_ID
	, ssbid.SSB_CRMSYSTEM_PRIMARY_FLAG
	, dc.SourceSystem
	, dc.SSID
	, dc.CustomerType
	, dc.CustomerStatus
	, dc.Prefix
	, dc.FirstName
	, dc.MiddleName
	, dc.LastName
	, CAST(dc.Suffix AS VARCHAR(50)) Suffix
	, dc.Birthday
	, dc.Gender
	, dc.NameIsCleanStatus
	, CAST(dc.AddressPrimaryStreet AS VARCHAR(100)) AddressPrimaryStreet
	, dc.AddressPrimarySuite
	, CAST(dc.AddressPrimaryCity AS VARCHAR(100)) AddressPrimaryCity
	, CAST(dc.AddressPrimaryState AS VARCHAR(100)) AddressPrimaryState
	, dc.AddressPrimaryZip
	, dc.AddressPrimaryIsCleanStatus
	, dc.AddressPrimaryLongitude
	, dc.AddressPrimaryLatitude
	, dc.PhonePrimary
	, dc.PhonePrimaryIsCleanStatus
	, CAST(dc.EmailPrimary AS NVARCHAR(100)) EmailPrimary
	, dc.EmailPrimaryIsCleanStatus
	, dc.PhonePrimaryDNC DoNotCall
	, dc.ExtAttribute1 DoNotMail
	, dc.ExtAttribute2 DoNotEmail
	, CAST(dc.ExtAttribute31 AS NVARCHAR(100)) BlackbaudStatus
	, CAST(dc.ExtAttribute32 AS NVARCHAR(100)) NeulionStatus
	, CAST(dc.ExtAttribute33 AS NVARCHAR(100)) PaciolanStatus
	, CAST(dc.ExtAttribute8 AS NVARCHAR(50)) HouseholdID
	, CAST(dc.ExtAttribute9 AS NVARCHAR(20)) HouseholdLookupID
	, CAST(dc.ExtAttribute10 AS NVARCHAR(10)) IsPrimaryHouseholdMember
FROM dbo.dimcustomerssbid ssbid WITH (NOLOCK) 
JOIN dbo.DimCustomer dc WITH (NOLOCK)  ON ssbid.DimCustomerId = dc.DimCustomerId

GO
