SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[LoadDimCustomer_BB_IsDeleted]
AS

UPDATE dc
SET dc.IsDeleted = 1
, dc.DeleteDate = GETDATE()
--SELECT * 
FROM (
	SELECT * 
	FROM dbo.dimcustomer (NOLOCK)
	WHERE sourcesystem = 'Blackbaud'
	) dc
LEFT JOIN ods.BB_Constituent bc (NOLOCK) ON dc.ssid = bc.ID
WHERE bc.id IS null



GO
