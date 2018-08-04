SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimSeason]
AS
SELECT  DimSeasonId ,
        ETL__SSID ,
        ETL__SSID_SEASON ,
        SeasonCode ,
        SeasonName ,
        SeasonDesc ,
        SeasonClass ,
        Activity ,
        Status ,
        CAST(IsActive AS INT) IsActive ,
        SeasonYear ,
        DimSeasonId_Prev 
FROM    [dbo].[DimSeason] (NOLOCK);

GO
