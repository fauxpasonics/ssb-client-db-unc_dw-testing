SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  VIEW  [dbo].[vwExtAttribute10] AS
SELECT dimcustomerid, 1 AS ExtAttribute10
FROM dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute10, '') != ''
GO
