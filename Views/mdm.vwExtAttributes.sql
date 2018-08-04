SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW  [mdm].[vwExtAttributes] AS  
SELECT dimcustomerid
, CASE WHEN ISNULL(ExtAttribute33, '') = '' THEN NULL ELSE 1 END AS ExtAttribute33  
, CASE WHEN ISNULL(ExtAttribute32, '') = '' THEN NULL ELSE 1 END AS ExtAttribute32  
, CASE WHEN ISNULL(ExtAttribute31, '') = '' THEN NULL ELSE 1 END AS ExtAttribute31  
, CASE WHEN ISNULL(ExtAttribute10, '') = '' THEN NULL ELSE 1 END AS ExtAttribute10  
, CASE WHEN ISNULL(ExtAttribute8 , '') = '' THEN NULL ELSE 1 END AS ExtAttribute8   
, CASE WHEN ISNULL(ExtAttribute6 , '') = '' THEN NULL ELSE 1 END AS ExtAttribute6   
, CASE WHEN ISNULL(ExtAttribute7 , '') = '' THEN NULL ELSE 1 END AS ExtAttribute7   
, CASE WHEN ISNULL(ExtAttribute34, '') = '' THEN NULL ELSE 1 END AS ExtAttribute34  
, CASE WHEN ISNULL(ExtAttribute35, '') = '' THEN NULL ELSE 1 END AS ExtAttribute35  
, CASE WHEN ISNULL(ExtAttribute11, 0) = 0 THEN NULL ELSE 1 END AS ExtAttribute11  
, CASE WHEN ISNULL(ExtAttribute12, 0) = 0 THEN NULL ELSE 1 END AS ExtAttribute12  
, CASE WHEN ISNULL(ExtAttribute13, 0) = 0 THEN NULL ELSE 1 END AS ExtAttribute13  
, CASE WHEN ISNULL(ExtAttribute14, 0) = 0 THEN NULL ELSE 1 END AS ExtAttribute14  
FROM dbo.vwDimCustomer_ModAcctId WITH (NOLOCK)  
GO
