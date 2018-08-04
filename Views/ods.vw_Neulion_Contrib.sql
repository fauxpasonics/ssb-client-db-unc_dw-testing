SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [ods].[vw_Neulion_Contrib]
AS

WITH MaxUpdated (MemberID, ETLUpdatedDate)
AS
	(SELECT MemberID, MAX(ETLUpdatedDate)
	FROM ods.neulion_Contrib
	GROUP BY MemberID)

SELECT n.*
FROM ods.neulion_Contrib n
JOIN MaxUpdated b ON n.MemberID = b.MemberID AND n.ETLUpdatedDate = b.ETLUpdatedDate






GO
