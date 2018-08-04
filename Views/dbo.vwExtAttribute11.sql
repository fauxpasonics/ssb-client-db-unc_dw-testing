SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE  VIEW  [dbo].[vwExtAttribute11] AS
SELECT dimcustomerid, 1 AS ExtAttribute11
FROM dbo.dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute11, 0) != 0

GO
