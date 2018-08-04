SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE  VIEW  [dbo].[vwExtAttribute35] AS
SELECT dimcustomerid, 1 AS ExtAttribute35
FROM dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute35, '') != ''

GO
