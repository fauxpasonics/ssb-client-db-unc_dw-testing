SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--Blackbaud Relationship
CREATE VIEW [sas].[vw_BB_Relationship]
AS
SELECT  ID AS RelationshipID ,
        RELATIONSHIPSETID ,
        CAST(ConstituentID AS NVARCHAR(100)) ConstituentID ,
        RELTYPE AS RelationshipType ,
        RECIPRELTYPE AS ReciprocalRelationshipType ,
        CAST(RelatedConstituentID AS NVARCHAR(100)) RELATEDCONSTITUENTID ,
        CAST(ISSPOUSE AS INT) AS IsSpouse ,
        CAST(ISPRIMARYBUSINESS AS INT) AS IsPrimaryBusiness ,
        CAST(ISMATCHINGGIFTRELATIONSHIP AS INT) AS IsMatchingGiftRelationship ,
        STARTDATE ,
        ENDDATE ,
        JOBTITLE ,
        JOBENDDATE ,
        DATEADDED ,
        DATECHANGED AS DateUpdated
FROM    ods.BB_RELATIONSHIP (NOLOCK)

GO
