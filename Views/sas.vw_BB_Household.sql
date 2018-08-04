SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_BB_Household]
AS


SELECT DISTINCT CAST(ID AS NVARCHAR(100)) ConstituentID
	, CAST(HouseholdID AS NVARCHAR(100)) AS HouseholdID
	, HouseholdLookupID
	, CAST(IsPrimaryMember AS INT) AS IsPrimaryMember
FROM ods.BB_Household (NOLOCK)

GO
