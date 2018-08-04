SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [sas].[vw_BB_EducationalInvolvements]
AS

SELECT *
FROM ods.BB_EducationalInvolvements (NOLOCK)

GO
