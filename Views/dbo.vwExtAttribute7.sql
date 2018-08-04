SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE  VIEW  [dbo].[vwExtAttribute7] AS
SELECT dimcustomerid, 1 AS ExtAttribute7
FROM dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute7, '') != ''

GO
