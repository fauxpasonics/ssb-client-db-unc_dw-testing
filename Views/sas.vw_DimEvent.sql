SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimEvent]
AS
SELECT DimEventID,
	ETL__SSID,
	ETL__SSID_SEASON,
	ETL__SSID_EVENT,
	EventCode,
	EventName,
	EventDesc,
	EventClass,
	Arena,
	Season,
	EventDate,
	EventTime,
	EType,
	Basis,
	EGroup,
	Keywords,
	Tag,
	ManifestId
FROM dbo.DimEvent with (nolock) 
GO
