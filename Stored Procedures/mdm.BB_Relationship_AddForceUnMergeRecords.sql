SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [mdm].[BB_Relationship_AddForceUnMergeRecords]
AS


SELECT dca.DimCustomerId DimCustomerID_A, dcb.DimCustomerId DimCustomerID_B
INTO #relationships
FROM ods.BB_Relationship bb (NOLOCK)
JOIN dbo.vwDimCustomer_ModAcctId dca (NOLOCK) ON CAST(bb.CONSTITUENTID AS NVARCHAR(100)) = dca.SSID
JOIN dbo.vwDimCustomer_ModAcctId dcb (NOLOCK) ON CAST(bb.RELATEDCONSTITUENTID AS NVARCHAR(100)) = dcb.ssid AND dca.SSB_CRMSYSTEM_CONTACT_ID = dcb.SSB_CRMSYSTEM_CONTACT_ID



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




GO
