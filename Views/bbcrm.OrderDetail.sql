SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE  VIEW [bbcrm].[OrderDetail] AS 

SELECT 
  c.SSB_CRMSYSTEM_CONTACT_ID
, a.ETLSID
, a.SEASON
, a.CUSTOMER
, a.SEQ
, a.ITEM
, a.I_DATE
, a.I_OQTY
, a.I_PT
, a.I_PRICE
, a.I_DISC
, a.I_DAMT
, a.I_PAY_MODE
, a.ITEM_DELIVERY_ID
, a.I_GCDOC
, a.I_PRQTY
, a.I_PL
, a.I_BAL
, a.I_PAY
, a.I_PAYQ
, a.LOCATION_PREF
, a.I_SPECIAL
, a.I_MARK
, a.I_DISP
, a.I_GROUP
, a.I_ACUST
, a.I_PRI
, a.I_DMETH
, a.I_FPRICE
, a.I_NOTE
, a.I_ATYPE
, a.I_BPTYPE
, a.PROMO
, a.ITEM_PREF
, a.TAG, I_CHG
, a.I_CPRICE
, a.I_CPAY
, a.I_FPAY
, a.INREFSOURCE
, a.INREFDATA
, a.I_SCHG
, a.I_SCAMT
, a.I_SCPAY
, a.ORIG_SALECODE
, a.ORIGTS_USER
, a.ORIGTS_DATETIME
, a.I_PKG, E_SBLS_1
, a.LAST_USER
, a.LAST_DATETIME
, a.ZID, SOURCE_ID
, case when a.EXPORT_DATETIME > b.updatedDate then a.EXPORT_DATETIME else b.updatedDate end 
as EXPORT_DATETIME

 FROM dbo.TK_ODET a  WITH (NOLOCK) 
 join
	dbo.DimCustomer AS b WITH ( NOLOCK ) on a.customer=b.ssid
            JOIN dbo.dimcustomerssbid AS c WITH ( NOLOCK ) ON b.DimCustomerId = c.DimCustomerId
WHERE b.SourceSystem = 'PAC'
		


GO
