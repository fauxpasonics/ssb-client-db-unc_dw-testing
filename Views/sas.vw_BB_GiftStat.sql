SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_BB_GiftStat]
AS

SELECT CAST(ID AS NVARCHAR(100)) ConstituentID,
	GIFTSTATTYPECODE AS GiftStatTypeCode,
	GIFTSTATCODE AS GiftStatCode
FROM ods.BB_CONSTITUENTGIFTSTAT (NOLOCK)

GO