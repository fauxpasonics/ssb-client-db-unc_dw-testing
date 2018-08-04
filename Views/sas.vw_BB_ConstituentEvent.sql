SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_BB_ConstituentEvent]
AS
SELECT  ce.ID AS ConstituentEventID ,
        CAST(ConstituentID AS NVARCHAR(100)) ConstituentID ,
        e.[Name] AS EventName ,
        CAST(ce.ISGUEST AS INT) AS IsGuest ,
        CAST(ce.DATEADDED AS DATE) DateAdded ,
        CAST(ce.DATECHANGED AS DATE) DateUpdated
FROM    ods.BB_CONSTITUENTEVENTS (NOLOCK) ce
LEFT JOIN ods.BB_EVENTS e (NOLOCK) ON ce.EVENTID = e.ID

GO
