SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimSeatStatus]
AS
SELECT  DimSeatStatusId ,
        ETL__SSID ,
        ETL__SSID_SEASON ,
        ETL__SSID_SSTAT ,
        SeatStatusCode ,
        SeatStatusName ,
        SeatStatusDesc ,
        SeatStatusClass ,
        CAST(IsKill AS INT) IsKill ,
        Season 
FROM dbo.DimSeatStatus  (NOLOCK)      

GO
