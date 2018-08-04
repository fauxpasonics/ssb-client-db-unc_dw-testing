SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE  VIEW  [dbo].[vwBirthday] AS
SELECT dimcustomerid, 1 AS Birthday
FROM dbo.dimcustomer WITH (NOLOCK)
WHERE ISNULL(Birthday, '') != ''
GO
