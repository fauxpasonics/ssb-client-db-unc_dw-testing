SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_Neulion_Contact]
AS

SELECT n.[Member ID] MemberID
	, CAST(d.[Account Status] AS NVARCHAR(255)) AccountStatus
	, CAST(n.[Chapter Name]	AS NVARCHAR(255)) ChapterName
	, CAST(n.[District Abbr] AS NVARCHAR(255)) DistrictAbbr
	, CAST(u.[Davie ID]	AS NVARCHAR(255)) DavieID
	, CAST(n.[Name] AS NVARCHAR(255)) [Name]
	, CAST(n.Salutation	AS NVARCHAR(255)) Salutation
	, CAST(d.[Donor Status]	AS NVARCHAR(255)) DonorStatus
	, CAST(u.[Date of Birth] AS NVARCHAR(255)) BirthDate
	, CAST(u.[Date Joined] AS NVARCHAR(255)) DateJoined
	, CAST(n.[First Name]	AS NVARCHAR(255)) FirstName
	, CAST(n.[Middle Init] AS NVARCHAR(255)) MiddleInit
	, CAST(n.[Last Name] AS NVARCHAR(255)) LastName
	, CAST(n.[Name Suffix] AS NVARCHAR(255)) Suffix
	, CAST(n.[Spouse Name] AS NVARCHAR(255)) SpouseName
	, CAST(n.[Spouse Title] AS NVARCHAR(255)) SpouseTitle
	, CAST(n.[Bill Address1] AS NVARCHAR(255)) BillAddress1
	, CAST(n.[Bill Address2] AS NVARCHAR(255)) BillAddress2
	, CAST(n.[Bill City] AS NVARCHAR(255)) BillCity
	, CAST(n.[Bill State Prov] AS NVARCHAR(255)) BillStateProv
	, CAST(n.[Bill Zip Code] AS NVARCHAR(255)) BillZipCode
	, CAST(n.[Bill Country] AS NVARCHAR(255)) BillCountry
	, CAST(n.[Email Address] AS NVARCHAR(255)) EmailAddress
	, CAST(n.[Home Phone] AS NVARCHAR(255)) HomePhone
	, CAST(n.[Business Phone] AS NVARCHAR(255)) BusinessPhone
	, CAST(n.[Bus. Ext] AS NVARCHAR(255)) BusinessExt
	, CAST(n.[Cell Phone] AS NVARCHAR(255)) CellPhone
	, CAST(n.Fax AS NVARCHAR(255)) Fax
	, n.[Name/Phone/Email Mod Date] NamePhoneEmailModDate
	, n.[Most Recent Contact Change Date] MostRecentContactChangeDate
	, n.[Donor Status Mod Date] DonorStatusModDate
	, n.ETL_CREATED_DATE ETL_CreatedDate
	, n.ETL_LUPDATED_DATE ETL_UpdatedDate
FROM etl.vw_Neulion_Contact n (NOLOCK)
LEFT JOIN etl.vw_Neulion_Designation d (NOLOCK)
	ON n.[Member ID] = d.[Member ID]
LEFT JOIN etl.vw_Neulion_CusData u (NOLOCK)
	ON n.[Member ID] = u.[Member ID]
WHERE n.[Member ID] NOT IN (SELECT DISTINCT [Member ID]
							FROM src.SaasMerge)

GO
GRANT SELECT ON  [sas].[vw_Neulion_Contact] TO [svc_saslimitschema]
GO
GRANT SELECT ON  [sas].[vw_Neulion_Contact] TO [svc_sasVAreadonly]
GO
