SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ods].[vw_Neulion_ContribAnnual]
AS

WITH MaxUpdated (MemberID, ETLUpdatedDate)
AS
	(SELECT [Member ID], MAX(EFF_BEG_DATE)
	FROM SSB_BIMDM.ods.SaasContribAnnual (NOLOCK)
	GROUP BY [Member ID]
	)
, MaxRow
AS (
	SELECT a.[Member ID] MemberID, a.EFF_BEG_DATE ETLUpdatedDate, MAX(a.ROW_NUM) Row_Num
    FROM SSB_BIMDM.ods.SaasContribAnnual a (NOLOCK)
	JOIN MaxUpdated b
		ON a.[Member ID] = b.MemberID
		AND a.EFF_BEG_DATE = b.ETLUpdatedDate
	GROUP BY a.[Member ID], a.EFF_BEG_DATE
	)

SELECT n.*
FROM SSB_BIMDM.ods.SaasContribAnnual n (NOLOCK)
JOIN MaxRow b
	ON n.[Member ID] = b.MemberID
	AND n.[EFF_BEG_DATE] = b.ETLUpdatedDate
	AND n.ROW_NUM = b.Row_Num

GO
