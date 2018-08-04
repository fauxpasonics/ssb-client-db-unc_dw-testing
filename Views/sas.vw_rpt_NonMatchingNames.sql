SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [sas].[vw_rpt_NonMatchingNames]
AS
SELECT dc1.SourceSystem SourceSystem_A, dc1.SSID SourceSystemID_A, dc1.FirstName FirstName_A, dc1.LastName LastName_A, dc1.customer_matchkey
	, dc2.SourceSystem SourceSystem_B, dc2.SSID SourceSystemID_B, dc2.FirstName FirstName_B, dc2.LastName LastName_B
FROM dbo.vwDimCustomer_ModAcctId dc1 (NOLOCK)
JOIN dbo.vwDimCustomer_ModAcctId dc2 (NOLOCK)
	ON dc1.customer_matchkey = dc2.customer_matchkey
	AND dc1.SSB_CRMSYSTEM_CONTACT_ID = dc2.SSB_CRMSYSTEM_CONTACT_ID
WHERE dc1.LastName <> dc2.LastName
	OR dc1.FirstName <> dc2.FirstName

GO
