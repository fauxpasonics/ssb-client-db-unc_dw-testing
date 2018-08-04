SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[load_Pac_LinkedAccount]
AS

DECLARE @UpdateDate DATETIME = (SELECT MAX(ETL_UpdatedDate) FROM dbo.Pac_LinkedAccounts);

WITH BuyerType
AS (
		SELECT dc.SSID PatronID
			, MIN(
				CASE WHEN f.DimTicketTypeId = 1 THEN 1
				WHEN f.DimTicketTypeId IN (2, 7) THEN 2
				WHEN f.DimTicketTypeId IN (3, 4, 6, 8) THEN 3
				ELSE 4
				END
				) AS BuyerTypeRank
		FROM dbo.dimcustomerssbid (NOLOCK) ssbid
		JOIN dbo.dimcustomer dc (NOLOCK)
			ON ssbid.DimCustomerID = ssbid.DimCustomerId
		LEFT JOIN dbo.DimTicketCustomer dtc (NOLOCK)
			ON dc.ssid = dtc.ETL__SSID
		LEFT JOIN dbo.FactTicketSales f (NOLOCK)
			ON dtc.DimTicketCustomerId = f.DimTicketCustomerId
		WHERE dc.SSUpdatedDate > @UpdateDate
		GROUP BY dc.SSID
	)

, LinkedPIN
AS (

		SELECT DISTINCT dc.SSID PatronID
			, dc.IsDeleted
			, dc.SSUpdatedDate
			, ead.LINKED Linked
			, ea.PIN
		FROM dbo.dimcustomerssbid (NOLOCK) ssbid
		JOIN dbo.dimcustomer dc (NOLOCK)
			ON ssbid.DimCustomerID = ssbid.DimCustomerId
		LEFT JOIN dbo.EPD_ACCOUNT ea (NOLOCK)
			ON dc.ssid = ea.CUSTOMER AND dc.SourceSystem = 'Pac'
		LEFT JOIN dbo.EPD_ACCOUNT_DISTRIBUTOR ead (NOLOCK)
			ON dc.ssid = ead.CUSTOMER AND dc.SourceSystem = 'Pac'
		WHERE dc.SSUpdatedDate > @UpdateDate
	)


SELECT
	a.PatronID
	, a.IsDeleted
	, b.BuyerTypeRank
	, a.SSUpdatedDate
	, a.Linked
	, a.PIN
	, HASHBYTES('sha2_256',
							ISNULL(RTRIM(a.PatronID),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(a.IsDeleted),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(b.BuyerTypeRank),'DBNULL_TEXT')
							+ ISNULL(RTRIM(a.SSUpdatedDate),'DBNULL_TEXT')  
							+ ISNULL(RTRIM(a.Linked),'DBNULL_TEXT') 
							+ ISNULL(RTRIM(a.PIN),'DBNULL_TEXT')
							) AS [LinkedDirtyHash]
INTO #stg
FROM LinkedPin a
JOIN BuyerType b ON a.patronID = b.patronID


CREATE NONCLUSTERED INDEX IDX_LoadKey
ON #stg (PatronID)

DECLARE @RunTime DATETIME = GETDATE()




/***Merge***/
MERGE dbo.Pac_LinkedAccounts AS myTarget

USING (SELECT * FROM #stg) AS mySource
	ON myTarget.PatronID = mySource.PatronID


WHEN MATCHED AND ISNULL(mySource.LinkedDirtyHash, -1) <> ISNULL(myTarget.LinkedDirtyHash, -1)

THEN UPDATE SET
	myTarget.PatronID = mySource.PatronID
	, myTarget.IsDeleted = mySource.IsDeleted
	, myTarget.BuyerTypeRank = mySource.BuyerTypeRank
	, myTarget.SSUpdatedDate = mySource.SSUpdatedDate
	, myTarget.Linked = mySource.Linked
	, myTarget.PIN = mySource.PIN
	, myTarget.LinkedDirtyHash = mySource.LinkedDirtyHash
	, myTarget.ETL_UpdatedDate = @RunTime

WHEN NOT MATCHED THEN INSERT
(
	PatronID, IsDeleted, BuyerTypeRank, SSUpdatedDate, Linked, PIN, LinkedDirtyHash, ETL_UpdatedDate
	)
	VALUES (
		mySource.PatronID
		, mySource.IsDeleted
		, mySource.BuyerTypeRank
		, mySource.SSUpdatedDate
		, mySource.Linked
		, mySource.PIN
		, mySource.LinkedDirtyHash
		, @RunTime
		)
;


GO
