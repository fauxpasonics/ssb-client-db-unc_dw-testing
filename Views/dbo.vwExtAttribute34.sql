SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE  VIEW  [dbo].[vwExtAttribute34] AS
SELECT dimcustomerid, 1 AS ExtAttribute34
FROM dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute34, '') != ''

GO
