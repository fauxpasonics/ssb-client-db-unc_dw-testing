SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE  VIEW  [dbo].[vwExtAttribute13] AS
SELECT dimcustomerid, 1 AS ExtAttribute13
FROM dbo.dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute13, 0) != 0


GO
