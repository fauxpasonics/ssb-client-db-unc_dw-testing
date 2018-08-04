SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Neulion_CusData]
AS



WITH CusDataMaxUpdated (MemberID, ETL_UpdatedDate)
AS
	(SELECT [Member ID], MAX(EFF_BEG_DATE)
	FROM  ods.SaasCusData (NOLOCK)
	GROUP BY [Member ID]
	)

SELECT a.*
FROM  ods.SaasCusData a (NOLOCK)
JOIN CusDataMaxUpdated b
	ON a.[Member ID] = b.MemberID
	AND a.EFF_BEG_DATE = b.ETL_UpdatedDate
	AND a.ROW_NUM = 1



GO
