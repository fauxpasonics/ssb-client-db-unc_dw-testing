SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [dbo].[vwExtAttribute14]
AS

	SELECT dimcustomerid, 1 AS ExtAttribute14
	FROM dbo.dimcustomer WITH (NOLOCK)
	WHERE ISNULL(ExtAttribute14, 0) != 0
;


GO
