SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [etl].[LoadDimCustomer_Neulion_IsDeleted]
AS

UPDATE dc
SET dc.IsDeleted = 1
, dc.DeleteDate = GETDATE()
--SELECT * 
FROM (
	SELECT * 
	FROM dbo.dimcustomer (NOLOCK)
	WHERE sourcesystem = 'Neulion'
	) dc
LEFT JOIN src.SaasMerge m ON dc.ssid = m.[Member ID]
WHERE m.[Member ID] IS NOT null



GO
