SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_BB_ConstituentSolicitCode]
AS
SELECT  ID AS ConstituentSolicitCodeID ,
        CAST(ConstituentID AS NVARCHAR(100)) ConstituentID ,
        [DESCRIPTION] ,
        CAST(DATEADDED AS DATE) DateAdded ,
        CAST(DATECHANGED AS DATE) DateUpdated ,
        CAST(STARTDATE AS DATE) StartDate ,
        CAST(ENDDATE AS DATE) EndDate
FROM    ods.BB_CONSTITUENTSOLICITCODES (NOLOCK)

GO
