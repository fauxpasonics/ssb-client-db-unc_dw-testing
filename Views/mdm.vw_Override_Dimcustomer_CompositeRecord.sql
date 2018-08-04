SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



----Alter View (table referenced changed)

CREATE VIEW [mdm].[vw_Override_Dimcustomer_CompositeRecord] 
AS 
SELECT b.SSB_CRMSYSTEM_CONTACT_ID, a.* 
	, ROW_NUMBER() OVER (PARTITION BY b.SSB_CRMSYSTEM_CONTACT_ID, a.ElementID, a.Field ORDER BY a.InsertDate DESC, b.UpdatedDate DESC, a.OverrideID DESC) AS override_ranking 
FROM mdm.override_dimcustomer_compositerecord a 
INNER JOIN mdm.vw_Overrides b ON a.OverrideID = b.OverrideID 
	AND a.DimCustomerID = b.DimCustomerID
WHERE 1=1 
AND b.StatusID = 1 

GO
