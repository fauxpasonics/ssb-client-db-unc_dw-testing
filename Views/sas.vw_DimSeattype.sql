SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimSeattype]
AS
SELECT  DimSeatTypeId ,
        SeatTypeCode ,
        SeatTypeName ,
        SeatTypeDesc ,
        SeatTypeClass
FROM    [dbo].[DimSeatType] (NOLOCK);          

GO
