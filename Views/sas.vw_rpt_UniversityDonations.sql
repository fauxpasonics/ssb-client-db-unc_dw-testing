SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_rpt_UniversityDonations]
AS

SELECT
	cr.SSB_CRMSYSTEM_CONTACT_ID
	, cr.FirstName
	, cr.LastName
	, rev.TransactionType
	, rev.[Application]
	, rev.ApplicationTypeCode
	, CAST(rev.PAYMENTMETHOD AS NVARCHAR(100)) PaymentMethod
	, rev.TransactionAmount
	, rev.ReceiptAmount
	, rev.[Anonymous]
	, rev.ANONYMOUS_TRANSACTION AnonymousTransction
	, rev.ANONYMOUS_DONOR AnonymousDonor
	, CAST(s.[NAME] AS NVARCHAR(100)) SiteName
	, s.SHORTNAME SiteShortName
	, CAST(d.DESCRIPTION AS NVARCHAR(100)) DesignationDescription
	, d.DesignationLevelType
	, d.PSBUSINESSUNIT DesignationPSBusinessUnit
	, rev.TransactionDate
	, rev.PostDate
	, rev.Appeal
	, rev.Channel
	, CAST(rev.REFERENCE AS NVARCHAR(100)) Reference
	, rev.RevenueCategoryName
	, rev.GiftInKindSubTypeCode
	, rev.MedianPrice
	, rev.NumberOfUnits
	, rev.Symbol
	, rev.DateAdded
FROM mdm.compositerecord cr (NOLOCK)
JOIN (
		SELECT *
		FROM dbo.vwDimCustomer_ModAcctId (NOLOCK)
		WHERE SourceSystem = 'Blackbaud'
	) dc ON cr.SSB_CRMSYSTEM_CONTACT_ID = dc.SSB_CRMSYSTEM_CONTACT_ID
JOIN ods.BB_Revenue rev (NOLOCK)
	ON dc.ssid = rev.CONSTITUENTID
JOIN ods.BB_Designations d (NOLOCK)
	ON rev.DESIGNATIONID = d.ID
JOIN ods.BB_Sites s (NOLOCK)
	ON rev.SITEID = s.ID

GO
