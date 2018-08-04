SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE  VIEW  [dbo].[vwExtAttribute32] AS
SELECT dimcustomerid, 1 AS ExtAttribute32
FROM dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute32, '') != ''
GO
