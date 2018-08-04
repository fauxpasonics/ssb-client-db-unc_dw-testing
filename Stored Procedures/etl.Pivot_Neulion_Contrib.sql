SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [etl].[Pivot_Neulion_Contrib]
AS

DECLARE @Query NVARCHAR(MAX),
	@ColumnName NVARCHAR(20)
;

IF EXISTS (SELECT * FROM dbo.sysobjects
			WHERE name = 'Load_Neulion_Contrib_WorkingTable'
			AND xtype = 'U')
DROP TABLE dbo.Load_Neulion_Contrib_WorkingTable
;

TRUNCATE TABLE stg.Load_Neulion_Contrib
;

SELECT TABLE_NAME, COLUMN_NAME
INTO dbo.Load_Neulion_Contrib_WorkingTable
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'Neulion_Contrib'
AND TABLE_SCHEMA = 'ods'
--AND COLUMN_NAME = 'UniversityCampaign2022Pledged'
AND COLUMN_NAME NOT IN ('MemberID', 'ETLUpdatedDate', 'SourceFile', 'AccountStatus','Rank','Points','LifetimeGivingAmount','LifetimePledges','LifetimePaid',
	'LargestGiftAmount','LargestGiftDate','LargestGiftFund','FirstPaidDateToAnnualFund','LastPaidDateToAnnualFund','LastFYPaidToAnnualFund')
;


WHILE 1=1
BEGIN
	SELECT @ColumnName = Column_Name
	FROM dbo.Load_Neulion_Contrib_WorkingTable

	IF @@ROWCOUNT = 0
		BREAK
	ELSE
		BEGIN
			SET @Query = 
			'INSERT stg.Load_Neulion_Contrib (MemberID, Field, Value, UpdatedDate, ETL_DeltaHashKey)
			SELECT MemberID, COLUMN_NAME Field, A.[' + @ColumnName + '] Value, ETLUpdatedDate
				, HASHBYTES(''sha2_256'',
							ISNULL(RTRIM(MemberID),''DBNULL_TEXT'') 
							+ ISNULL(RTRIM(COLUMN_Name),''DBNULL_TEXT'')
							+ ISNULL(RTRIM(' + @ColumnName + '),''DBNULL_TEXT'')  
							+ ISNULL(RTRIM(ETLUpdatedDate),''DBNULL_TEXT'')) AS [ETL_DeltaHashKey]
			FROM ods.Neulion_Contrib A
			JOIN dbo.Load_Neulion_Contrib_WorkingTable B
				ON B.Column_Name = ''' + @ColumnName + '''
			WHERE SourceFile = ''SSB-SAAS_Data_Transfer_(CONTRIB)_201702080709''
			--WHERE A.ETLUpdatedDate > (GETDATE() - 3)'
			;

			EXEC sp_executesql @Query
			;

			DELETE
			FROM dbo.Load_Neulion_Contrib_WorkingTable
			WHERE COLUMN_NAME = @ColumnName
			;
		END
		;
	CONTINUE
	;
END
;












GO
