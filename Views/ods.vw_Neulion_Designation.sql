SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ods].[vw_Neulion_Designation]
AS

WITH Maxupdated (MemberID, ETLUpdatedDate) AS
	(SELECT [Member ID], MAX(EFF_BEG_DATE)
	FROM SSB_BIMDM.ods.SaasDesignation WITH (NOLOCK) 
	GROUP BY [Member ID])

, MaxRow
AS (
	SELECT a.[Member ID] MemberID, a.EFF_BEG_DATE ETLUpdatedDate, MAX(a.ROW_NUM) Row_Num
    FROM SSB_BIMDM.ods.SaasDesignation a (NOLOCK)
	JOIN MaxUpdated b (NOLOCK)
		ON a.[Member ID] = b.MemberID
		AND a.EFF_BEG_DATE = b.ETLUpdatedDate
	GROUP BY a.[Member ID], a.EFF_BEG_DATE
	)

SELECT a.*
FROM SSB_BIMDM.ods.SaasDesignation a
JOIN MaxRow b (NOLOCK)
	ON a.[Member ID] = b.MemberID
	AND a.EFF_BEG_DATE = b.ETLUpdatedDate
	AND a.ROW_NUM = b.Row_Num

GO
