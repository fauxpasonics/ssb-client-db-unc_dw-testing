SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimPriceLevel]
AS
SELECT  DimPriceLevelId ,
        ETL__SSID ,
        ETL__SSID_SEASON ,
        ETL__SSID_PTable ,
        ETL__SSID_PL ,
        PriceLevelCode ,
        PriceLevelName ,
        PriceLevelDesc ,
        PriceLevelClass ,
        Season ,
        PTable
FROM    [dbo].[DimPriceLevel] (NOLOCK);      

GO
