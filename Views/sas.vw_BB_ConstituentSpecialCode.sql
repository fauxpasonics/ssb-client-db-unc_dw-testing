SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_BB_ConstituentSpecialCode]
AS
SELECT csc.ID AS ConstituentSpecialCodeID
   , CAST(ConstituentID AS NVARCHAR(100)) ConstituentID
   , csc.SpecialCodeID
   , csc.SpecialCode
   , sc.[Description] AS SpecialCodeDesc
   , CAST(csc.DateAdded AS DATE) DateAdded
   , CAST(csc.DateChanged AS DATE) DateUpdated
FROM ods.BB_ConstituentSPECIALCODES (NOLOCK) csc
LEFT JOIN ods.BB_SPECIALCODES sc (NOLOCK) ON csc.SPECIALCODEID = sc.ID

GO
