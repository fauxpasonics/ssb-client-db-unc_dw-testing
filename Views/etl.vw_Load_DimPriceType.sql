SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_Load_DimPriceType] AS (

	SELECT  
		'PAC' ETL__SourceSystem
		, pt.SEASON + ':' + pt.PRTYPE AS ETL__SSID 
		, pt.SEASON ETL__SSID_SEASON
		, pt.PRTYPE ETL__SSID_PRTYPE

		, pt.PRTYPE PriceTypeCode
		, pt.NAME PriceTypeName
		, pt.NAME + ' (' + pt.PRTYPE COLLATE SQL_Latin1_General_CP1_CI_AS + ')' PriceTypeDesc
		--, NULL PriceTypeDesc
		, pt.CLASS PriceTypeClass
		, pt.SEASON Season
		, pt.KIND Kind

	--SELECT top 1000 *
	FROM dbo.TK_PRTYPE (NOLOCK) pt

)
GO
