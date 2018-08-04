SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--Blackbaud Event
CREATE VIEW [sas].[vw_BB_Event]
AS
SELECT  ID AS EventID ,
        [NAME] AS EventName ,
        STARTDATE ,
        ENDDATE ,
        CATEGORY ,
        DATEADDED ,
        DATECHANGED DateUpdated
FROM    ods.BB_EVENTS (NOLOCK)
GO
