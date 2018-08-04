SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  VIEW  [dbo].[vwExtAttribute31] AS
SELECT dimcustomerid, 1 AS ExtAttribute31
FROM dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute31, '') != ''
GO
