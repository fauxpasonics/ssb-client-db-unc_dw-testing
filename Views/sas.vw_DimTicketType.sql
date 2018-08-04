SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimTicketType]
AS
SELECT  DimTicketTypeId ,
        TicketTypeCode ,
        TicketTypeName ,
        TicketTypeDesc ,
        TicketTypeClass
FROM    [dbo].[DimTicketType] (NOLOCK);          

GO
