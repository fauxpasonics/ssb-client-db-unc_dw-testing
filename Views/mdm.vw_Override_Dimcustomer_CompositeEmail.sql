SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


---Create Composite Email Override View
CREATE VIEW [mdm].[vw_Override_Dimcustomer_CompositeEmail] 
AS 
SELECT c.DimEmailID, a.* 
	, ROW_NUMBER() OVER (PARTITION BY c.DimEmailId, a.ElementID, a.Field ORDER BY a.InsertDate DESC, b.UpdatedDate DESC, a.OverrideID DESC) AS override_ranking 
FROM mdm.override_dimcustomer_compositerecord a 
INNER JOIN mdm.vw_Overrides b ON a.OverrideID = b.OverrideID 
	AND a.DimCustomerID = b.DimCustomerID
INNER JOIN cust.DimCustomerEmail c
ON a.dimcustomerid = c.dimcustomerid
WHERE 1=1 
AND b.StatusID = 1 
GO
