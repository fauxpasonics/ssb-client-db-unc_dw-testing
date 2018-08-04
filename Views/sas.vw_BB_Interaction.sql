SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_BB_Interaction]
AS
SELECT  ID AS InteractionID ,
        CAST(ConstituentID AS NVARCHAR(100)) ConstituentID ,
        PlanName ,
        PlanIsActive ,
        Objective ,
        [Status] ,
        CAST(Completed AS INT) AS Completed,
        FundraiserID ,
        Fundraiser ,
        FundraiserLookupID ,
        InteractionType ,
        CAST(EXPECTEDDATE AS DATE) ExpectedDate ,
        CAST(ACTUALDATE AS DATE) ActualDate ,
        CAST([DATE] AS DATE) InteractionDate ,
        CAST(ISINTERACTION AS INT) AS IsInteraction ,
        CAST(ISCONTACTREPORT AS INT) AS IsContactReport ,
        CAST(DATEADDED AS DATE) DateAdded ,
        CAST(DATECHANGED AS DATE) DateUpdated
FROM    ods.BB_INTERACTIONS  (NOLOCK)

GO
