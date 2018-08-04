SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Neulion_ContribSpecial]
AS



WITH ContribSpecialMaxUpdated (MemberID, ETL_UpdatedDate)
AS
	(SELECT [Member ID], MAX(EFF_BEG_DATE)
	FROM SSB_BIMDM.ods.SaasContribSpecial (NOLOCK)
	GROUP BY [Member ID]
	)

SELECT a.*
FROM SSB_BIMDM.ods.SaasContribSpecial a (NOLOCK)
JOIN ContribSpecialMaxUpdated b
	ON a.[Member ID] = b.MemberID
	AND a.EFF_BEG_DATE = b.ETL_UpdatedDate
	AND a.ROW_NUM = 1



GO
