SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE  VIEW  [dbo].[vwExtAttribute12] AS
SELECT dimcustomerid, 1 AS ExtAttribute12
FROM dbo.dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute12, 0) != 0


GO
