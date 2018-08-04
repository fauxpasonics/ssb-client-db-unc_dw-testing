SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_FactInventory]
WITH SCHEMABINDING
AS
SELECT  FactInventoryId ,
        ETL__SourceSystem ,
        ETL__UpdatedDate ,
        DimArenaId ,
        DimSeasonId ,
        DimEventId ,
        DimSeatId ,
        DimSeatStatusid ,
        SeatPrice ,
        CAST(IsAttended AS INT) IsAttended ,
        ScanDateTime ,
        ScanGate ,
        CAST(IsResold AS INT) IsResold ,
        ResoldDimCustomerId ,
        ResoldDateTime ,
        ResoldPrice ,
        FactTicketSalesId
FROM    dbo.FactInventory (NOLOCK);  

GO
