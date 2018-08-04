SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/*****	Revision History

DCH on 2017-12-20:	added the execution of etl.Load_DimCustomer_BB, which populates dbo.Load_DimCustomer_BB and is
					now used as the driving table in the etl.vw_Load_DimCustomer_BB view.


*****/




CREATE PROCEDURE [etl].[DimCustomer_MasterLoad]

AS
BEGIN


-- Blackbaud

EXEC etl.Load_DimCustomer_BB;

EXEC mdm.etl.LoadDimCustomer @ClientDB = 'unc_dw', @LoadView = 'etl.vw_Load_DimCustomer_BB', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

EXEC etl.LoadDimCustomer_BB_IsDeleted -- update IsDeleted, DeletedDate


-- TI
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'unc_dw', @LoadView = 'etl.vw_Load_DimCustomer_TI', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'


-- Neulion
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'unc_dw', @LoadView = 'etl.vw_Load_DimCustomer_Neulion', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

EXEC etl.LoadDimCustomer_Neulion_IsDeleted -- update IsDeleted, DeletedDate


-- NeulionSpouse
EXEC mdm.etl.LoadDimCustomer @ClientDB = 'unc_dw', @LoadView = 'etl.vw_Load_DimCustomer_NeulionSpouse', @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0'

EXEC etl.LoadDimCustomer_NeulionSpouse_IsDeleted -- update IsDeleted, DeletedDate


--Paciolan deletes (added 2018-02-23 by Kaitlyn Sniffin)

UPDATE dc
	SET IsDeleted = '1'
	, DeleteDate = GETUTCDATE()
	--SELECT * 
	FROM dbo.DimCustomer dc (NOLOCK)
	LEFT JOIN (select DISTINCT PATRON
				FROM dbo.PD_PATRON (NOLOCK)) p on dc.SourceSystem = 'PAC' AND dc.SSID = p.PATRON
	WHERE p.PATRON IS NULL
	AND SourceSystem = 'PAC'
	AND dc.IsDeleted = '0'

--Blackbaud deletes (added 2018-05-09 by Kaitlyn Nelson)
UPDATE dc
	SET dc.IsDeleted = 1
		, dc.DeleteDate = GETUTCDATE()
	--SELECT *
	FROM dbo.DimCustomer dc (NOLOCK)
	LEFT JOIN ods.BB_Constituent bb (NOLOCK)
		ON dc.SSID = bb.ID
		AND dc.SourceSystem = 'Blackbaud'
	WHERE bb.ID IS NULL
	AND dc.SourceSystem = 'Blackbaud'
	AND dc.IsDeleted = 0

--Neulion deletes (added 2018-05-09 by Kaitlyn Nelson)
UPDATE dc
	SET dc.IsDeleted = 1
		, dc.DeleteDate = GETUTCDATE()
	--SELECT *
	FROM dbo.DimCustomer dc (NOLOCK)
	LEFT JOIN sas.vw_Neulion_Contact n (NOLOCK)
		ON dc.SSID = n.MemberID
		AND dc.SourceSystem LIKE '%Neulion%'
	WHERE n.MemberID IS NULL
	AND dc.SourceSystem like '%Neulion%'
	AND dc.IsDeleted = 0


END







GO
