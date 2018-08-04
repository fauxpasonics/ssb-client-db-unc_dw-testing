SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_rpt_Constituents]
AS

SELECT
	SSB_CRMSYSTEM_CONTACT_ID
	, SourceSystem WinningRecordSourceSystem
	, FirstName
	, LastName
	, Birthday
	, Gender
	, NameIsCleanStatus
	, CAST(AddressPrimaryStreet AS NVARCHAR(100)) AddressPrimaryStreet
	, AddressPrimarySuite
	, CAST(AddressPrimaryCity AS NVARCHAR(100)) AddressPrimaryCity
	, CAST(AddressPrimaryState AS NVARCHAR(100)) AddressPrimaryState
	, AddressPrimaryZip
	, AddressPrimaryIsCleanStatus
	, AddressPrimaryLongitude
	, AddressPrimaryLatitude
	, PhonePrimary
	, PhonePrimaryIsCleanStatus
	, CAST(EmailPrimary AS NVARCHAR(100)) EmailPrimary
	, EmailPrimaryIsCleanStatus
	, PhonePrimaryDNC DoNotCall
	, CAST(ExtAttribute1 AS NVARCHAR(10)) DoNotMail
	, CAST(ExtAttribute2 AS NVARCHAR(10)) DoNotEmail
	, CAST(ExtAttribute8 AS NVARCHAR(50)) HouseholdID
	, CAST(ExtAttribute9 AS NVARCHAR(20)) HouseholdLookupID
	, CAST(ExtAttribute10 AS NVARCHAR(10)) IsPrimaryHouseholdMember
	, CAST(Extattribute31 AS NVARCHAR(100)) BlackbaudStatus
	, CAST(ExtAttribute32 AS NVARCHAR(100)) NeulionStatus
	, CAST(ExtAttribute33 AS NVARCHAR(100)) PaciolanStatus
	, CAST(ExtAttribute34 AS NVARCHAR(100)) IsPrimaryNeulionMember
	, CAST(ExtAttribute35 AS NVARCHAR(100)) NeulionSalutation
FROM mdm.compositerecord WITH (NOLOCK) 

GO
