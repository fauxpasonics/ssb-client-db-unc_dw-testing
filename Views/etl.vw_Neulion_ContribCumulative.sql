SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Neulion_ContribCumulative]
AS



WITH ContribCumulativeMaxUpdated (MemberID, ETL_UpdatedDate)
AS
	(SELECT [Member ID], MAX(EFF_BEG_DATE)
	FROM SSB_BIMDM.ods.SaasContribCumulative (NOLOCK)
	GROUP BY [Member ID]
	)

SELECT a.*
FROM SSB_BIMDM.ods.SaasContribCumulative a (NOLOCK)
JOIN ContribCumulativeMaxUpdated b
	ON a.[Member ID] = b.MemberID
	AND a.EFF_BEG_DATE = b.ETL_UpdatedDate
	AND a.ROW_NUM = 1



GO
