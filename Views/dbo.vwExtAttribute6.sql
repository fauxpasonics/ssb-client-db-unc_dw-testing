SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE  VIEW  [dbo].[vwExtAttribute6] AS
SELECT dimcustomerid, 1 AS ExtAttribute6
FROM dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute6, '') != ''

GO
