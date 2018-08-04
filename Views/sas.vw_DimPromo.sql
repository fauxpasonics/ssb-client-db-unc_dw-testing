SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimPromo]
AS
SELECT  DimPromoId ,
        ETL__SSID ,
        ETL__SSID_Promo ,
        ETL__SSID_Promo_Code ,
        PromoCode ,
        PromoName ,
        PromoDesc ,
        PromoClass
FROM    [dbo].[DimPromo] (NOLOCK);    

GO
