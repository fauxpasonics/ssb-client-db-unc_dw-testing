SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [sas].[vw_rpt_PromoCodeUsage]
AS

SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID, Season, Item, I_PT PriceType, I_PL PriceLevel, I_PROMO PromoCode, SUM(I_OQTY) TotalTickets, SUM(TOTAL_IPAY) TotalPaid
FROM dbo.TK_TRANS_ITEM a (NOLOCK)
JOIN dbo.DimCustomer dc (NOLOCK)
	ON a.CUSTOMER = dc.SSID
	AND dc.SourceSystem = 'Pac'
JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
	ON dc.DimCustomerId = ssbid.DimCustomerID
WHERE I_PROMO IS NOT NULL
GROUP BY ssbid.SSB_CRMSYSTEM_CONTACT_ID, Season, Item, I_PT, I_PL, I_PROMO

GO
