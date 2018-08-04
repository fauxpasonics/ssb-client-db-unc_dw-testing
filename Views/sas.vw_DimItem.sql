SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimItem]
AS
SELECT  DimItemId ,
        ETL__SSID ,
        ETL__SSID_SEASON ,
        ETL__SSID_ITEM ,
        ETL__SSID_Event_id ,
        ItemCode ,
        ItemName ,
        ItemDesc ,
        ItemClass ,
        Season ,
        Basis ,
        Keywords ,
        Tag 
FROM dbo.DimItem (NOLOCK)             

GO
