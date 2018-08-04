SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimPriceType]
AS
SELECT  DimPriceTypeId ,
        ETL__SSID ,
        ETL__SSID_SEASON ,
        ETL__SSID_PRTYPE ,
        PriceTypeCode ,
        PriceTypeName ,
        PriceTypeDesc ,
        PriceTypeClass ,
        Season ,
        Kind
FROM    [dbo].[DimPriceType] (NOLOCK);    

GO
