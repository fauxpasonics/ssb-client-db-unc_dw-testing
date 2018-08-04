SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimTicketClass]
AS
SELECT  DimTicketClassId ,
        TicketClassCode ,
        TicketClassName ,
        TicketClassDesc ,
        TicketClass
FROM    [dbo].[DimTicketClass] (NOLOCK);          

GO
