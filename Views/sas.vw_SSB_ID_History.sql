SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_SSB_ID_History]
AS

SELECT
	  a.SSID
	, a.SourceSystem
	, a.SSB_CRMSYSTEM_ACCT_ID
	, a.SSB_CRMSYSTEM_CONTACT_ID
	, a.SSB_CRMSYSTEM_PRIMARY_FLAG
	, a.SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG
	, a.CreatedDate
	, a.SSB_HISTORY_ID
	, a.SSBIDRank Rank_SSB_CRMSYSTEM_CONTACT_ID
	, b.ssb_crmsystem_contact_id AS Prev_SSB_CRMSYSTEM_CONTACT_ID
	, b.ssb_crmsystem_acct_id AS Prev_SSB_CRMSYSTEM_ACCT_ID
FROM (
		SELECT SSID
			, sourcesystem
			, ssb_crmsystem_acct_id
			, ssb_crmsystem_contact_id
			, ssb_crmsystem_primary_flag
			, createddate
			, SSB_HISTORY_ID
			, SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG
			, RANK() OVER(PARTITION BY SSID ORDER BY createddate DESC) AS SSBIDRank
		FROM mdm.SSB_ID_History WITH (NOLOCK)
	) a
LEFT JOIN (
		SELECT SSID
			, ssb_crmsystem_contact_id
			, ssb_crmsystem_acct_id
			, createddate
			, RANK() OVER(PARTITION BY SSID ORDER BY createddate DESC) AS SSBIDRank
		FROM mdm.SSB_ID_History WITH (NOLOCK)
	) b ON a.ssid = b.SSID AND a.SSBIDRank = (b.SSBIDRank - 1)

GO
