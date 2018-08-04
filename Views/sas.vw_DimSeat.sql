SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimSeat]
AS
SELECT  DimSeatId ,
        ETL__SSID ,
        ETL__SSID_SEASON ,
        ETL__SSID_LEVEL ,
        ETL__SSID_SECTION ,
        ETL__SSID_ROW ,
        ETL__SSID_PacSeat ,
        Season ,
        LevelName ,
        SectionName ,
        RowName ,
        Seat ,
        DefaultPriceLevel ,
        Config_Location
FROM    [dbo].[DimSeat] (NOLOCK);          

GO
