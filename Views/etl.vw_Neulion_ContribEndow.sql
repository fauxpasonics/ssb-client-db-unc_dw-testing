SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Neulion_ContribEndow]
AS



WITH ContribEndowMaxUpdated (MemberID, ETL_UpdatedDate)
AS
	(SELECT [Member ID], MAX(EFF_BEG_DATE)
	FROM SSB_BIMDM.ods.SaasContribEndow (NOLOCK)
	GROUP BY [Member ID]
	)

SELECT a.*
FROM SSB_BIMDM.ods.SaasContribEndow a (NOLOCK)
JOIN ContribEndowMaxUpdated b
	ON a.[Member ID] = b.MemberID
	AND a.EFF_BEG_DATE = b.ETL_UpdatedDate
	AND a.ROW_NUM = 1



GO
