SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [mdm].[AddForceUnMergeRecords]
AS

--=================================================================================================================================
-- Find Blackbaud records identified as 
--=================================================================================================================================
SELECT dca.DimCustomerId DimCustomerID_A, dcb.DimCustomerId DimCustomerID_B
INTO #relationships
FROM ods.BB_Relationship bb (NOLOCK)
JOIN dbo.vwDimCustomer_ModAcctId dca (NOLOCK) ON CAST(bb.CONSTITUENTID AS NVARCHAR(100)) = dca.SSID
JOIN dbo.vwDimCustomer_ModAcctId dcb (NOLOCK) ON CAST(bb.RELATEDCONSTITUENTID AS NVARCHAR(100)) = dcb.ssid AND dca.SSB_CRMSYSTEM_CONTACT_ID = dcb.SSB_CRMSYSTEM_CONTACT_ID

-- Load DimCustomerIDs to UnMerge table that don't already exist
DROP TABLE #dimcustids
SELECT DISTINCT DimCustomerID_A DimCustomerID
INTO #DimCustIDs
FROM #relationships
WHERE DimCustomerID_A NOT IN (SELECT DISTINCT DimCustomerID FROM mdm.ForceUnMergeIds)

UNION

SELECT DISTINCT DimCustomerID_B DimCustomerID
FROM #relationships
WHERE DimCustomerID_B NOT IN (SELECT DISTINCT DimCustomerID FROM mdm.ForceUnMergeIds)



INSERT INTO mdm.ForceUnMergeIds
        ( dimcustomerid ,
          forced_contact_id
        )
SELECT DISTINCT DimCustomerID, NEWID()
FROM #DimCustIDs


-- Identify non-blackbaud records that match existing records in UnMerge table based on customer matchkey
SELECT dc2.DimCustomerId, f.forced_contact_id
INTO #matchkey1
FROM mdm.ForceUnMergeIds f
JOIN dbo.vwDimCustomer_ModAcctId dc ON f.dimcustomerid = dc.DimCustomerId
JOIN dbo.vwDimCustomer_ModAcctId dc2 ON dc.customer_matchkey = dc2.customer_matchkey
WHERE dc.customer_matchkey IS NOT null

CREATE NONCLUSTERED INDEX IDX_LoadDimCust
ON #matchkey1 (DimCustomerId)

-- If records match on matchkey, insert/update records in UnMerge table
MERGE mdm.ForceUnMergeIds AS myTarget

USING (SELECT * FROM #matchkey1) AS mySource
	ON myTarget.dimcustomerid = mySource.dimcustomerid

WHEN MATCHED

THEN UPDATE SET
	myTarget.dimcustomerid = mySource.dimcustomerid
	, myTarget.forced_contact_id = mySource.forced_contact_id

WHEN NOT MATCHED THEN INSERT
(
	dimcustomerid, forced_contact_id
	)
	VALUES (
		mySource.Dimcustomerid
		, mySource.forced_contact_id
		);




-- Identify non-blackbaud records that match existing records in UnMerge table based on extattribute5
SELECT dc2.DimCustomerId, f.forced_contact_id
INTO #matchkey2
FROM mdm.ForceUnMergeIds f
JOIN dbo.vwDimCustomer_ModAcctId dc ON f.dimcustomerid = dc.DimCustomerId
JOIN dbo.vwDimCustomer_ModAcctId dc2 ON dc.extattribute5 = dc2.ExtAttribute5
WHERE dc.extattribute5 IS NOT NULL


CREATE NONCLUSTERED INDEX IDX_LoadDimCust
ON #matchkey2 (DimCustomerId)

-- If records match on extattribute5, insert/update records in UnMerge table
MERGE mdm.ForceUnMergeIds AS myTarget

USING (SELECT * FROM #matchkey2) AS mySource
	ON myTarget.dimcustomerid = mySource.dimcustomerid

WHEN MATCHED

THEN UPDATE SET
	myTarget.dimcustomerid = mySource.dimcustomerid
	, myTarget.forced_contact_id = mySource.forced_contact_id

WHEN NOT MATCHED THEN INSERT
(
	dimcustomerid, forced_contact_id
	)
	VALUES (
		mySource.Dimcustomerid
		, mySource.forced_contact_id
		);


GO
