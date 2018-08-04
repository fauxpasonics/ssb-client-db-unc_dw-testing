SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimRep]
AS
SELECT  DimRepId ,
        ETL__SSID ,
        ETL__SSID_MARK ,
        FullName ,
        CAST(IsActive AS INT) IsActive ,
        Mark
FROM dbo.DimRep (NOLOCK)

GO
