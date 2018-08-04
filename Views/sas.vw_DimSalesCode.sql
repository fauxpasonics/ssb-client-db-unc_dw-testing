SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimSalesCode]
AS
SELECT  DimSalesCodeId ,
        ETL__SSID ,
        ETL__SSID_SALECODE ,
        SalesCode ,
        SalesCodeName ,
        SalesCodeDesc ,
        SalesCodeClass
FROM dbo.DimSalesCode (NOLOCK)

GO
