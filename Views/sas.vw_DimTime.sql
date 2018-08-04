SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimTime]
AS
SELECT  DimTimeId ,
        Time ,
        Time24 ,
        HourName ,
        MinuteName ,
        Hour ,
        Hour24 ,
        Minute ,
        Second ,
        AMPM
FROM    [dbo].[DimTime] (NOLOCK);          

GO
