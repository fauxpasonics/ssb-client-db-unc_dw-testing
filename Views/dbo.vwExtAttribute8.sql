SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  view [dbo].[vwExtAttribute8] AS
SELECT dimcustomerid, 1 AS ExtAttribute8
FROM dimcustomer WITH (NOLOCK)
WHERE ISNULL(ExtAttribute8, '') != ''
GO
