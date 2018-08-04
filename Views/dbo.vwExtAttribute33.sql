SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE  VIEW  [dbo].[vwExtAttribute33] AS
SELECT dimcustomerid, 1 AS ExtAttribute33
FROM dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute33, '') != ''
GO
