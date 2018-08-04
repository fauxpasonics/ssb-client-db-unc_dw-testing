SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimArena]
AS
SELECT  DimArenaId ,
        ETL__SSID ,
        ETL__SSID_FACILITY ,
        ETL__SSID_arena_id ,
        ArenaCode ,
        ArenaName ,
        ArenaDesc ,
        ArenaClass
FROM    dbo.DimArena (NOLOCK);    

GO
