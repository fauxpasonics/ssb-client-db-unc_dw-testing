SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_FactTicketScans]
AS
SELECT  CAST(CUSTOMER AS NVARCHAR(100)) AS PatronID,
        SEASON SeasonCode ,
        ITEM ItemCode ,
        I_PT PriceTypeCode ,
        EVENT EventCode ,
        LEVEL ,
        SECTION ,
        ROW ,
        SEAT ,
        SCAN_DATE ScanDate ,
        SCAN_TIME ScanTime ,
        SCAN_LOC ScanLocation ,
        SCAN_CLUSTER ScanCluster ,
        SCAN_GATE ScanGate ,
        REDEEMED ,
        ATTENDED
FROM	dbo.TK_BC with (nolock) 

GO
