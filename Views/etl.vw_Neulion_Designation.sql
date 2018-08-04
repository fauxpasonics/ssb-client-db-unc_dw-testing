SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Neulion_Designation]
AS



WITH DesignationMaxUpdated (MemberID, ETL_UpdatedDate)
AS
	(SELECT [Member ID], MAX(EFF_BEG_DATE)
	FROM  ods.SaasDesignation (NOLOCK)
	GROUP BY [Member ID]
	)

SELECT a.*
FROM  ods.SaasDesignation a (NOLOCK)
JOIN DesignationMaxUpdated b
	ON a.[Member ID] = b.MemberID
	AND a.EFF_BEG_DATE = b.ETL_UpdatedDate
	AND a.ROW_NUM = 1



GO
