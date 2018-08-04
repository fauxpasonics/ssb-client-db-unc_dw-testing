SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 
CREATE PROCEDURE [mdm].[UpdateSSBRecognition]  
( 
	@ClientDB VARCHAR(50), 
	@RecognitionType VARCHAR(25) = 'Contact', -- Accepted values = Contact, Account 
	@FullRefresh BIT = 0 
) 
AS 
BEGIN 
 
--DECLARE @ClientDB VARCHAR(50) = 'MDM_CLIENT_TEST', @RecognitionType VARCHAR(25) = 'Contact', @FullRefresh BIT = 0 
 
IF (SELECT @@VERSION) LIKE '%Azure%' 
	SET @ClientDB = '' 
ELSE IF (SELECT @@VERSION) NOT LIKE '%Azure%' 
	SET @ClientDB = @ClientDB + '.' 
 
IF @FullRefresh IS NULL 
	SET @FullRefresh = 0 
 
DECLARE @ssb_crmsystem_id_field VARCHAR(25) = CASE WHEN @RecognitionType = 'Contact' THEN 'SSB_CRMSYSTEM_CONTACT_ID' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END 
DECLARE @matcheyBaseTblCounter INT = 1 
DECLARE @matchkeyGroupIDCounter INT = 1 
DECLARE @ID INT = 0 
DECLARE @matchkeyID INT 
DECLARE @matchkeyName VARCHAR(255) = '' 
DECLARE @matchkeyBaseTblFieldList VARCHAR(MAX) = '' 
DECLARE @matchkeyBaseTblFieldListTransformed VARCHAR(MAX) = '' 
DECLARE @matchkeyBaseTblFieldListDistinct VARCHAR(MAX) = '' 
DECLARE @matchkeyBaseTblFieldListDistinct_NO_ALIAS VARCHAR(MAX) = '' 
DECLARE @matchkeyBaseTbl VARCHAR(255) = '' 
DECLARE @matchkeyBaseTblLookupFieldList VARCHAR(MAX) = '' 
DECLARE @matchkeyBaseTblLookupCondition VARCHAR(MAX) = '' 
DECLARE @MatchkeyBaseTblFieldTransformationSqlList VARCHAR(MAX) = '' 
DECLARE @matchkeyBaseTblHashSql VARCHAR(MAX) = '' 
DECLARE @matchkeyBaseTblHashSqlTransformed VARCHAR(MAX) = '' 
DECLARE @matchkeyGroupID INT = 1 
DECLARE @matchkeyHashOutputTbl VARCHAR(255) = '' 
DECLARE @matchkeyHashIdentifier VARCHAR(50) = '' 
DECLARE @matchkeyHashName VARCHAR(50) = '' 
DECLARE @IsDeletedExists BIT = 0 
DECLARE @rowCount_cdioChanges INT = 0 
DECLARE @rowCount_matchkeyChanges INT = 0 
DECLARE @rowCount_workingset INT = 0 
DECLARE @rowCount_contactMatch_pre INT = 0 
DECLARE @rowCount_contactMatch_post INT = 0 
DECLARE @preSql_part1 NVARCHAR(MAX) = '' 
DECLARE @preSql_part2 NVARCHAR(MAX) = '' 
DECLARE @preSql_part3 NVARCHAR(MAX) = '' 
DECLARE @sql NVARCHAR(MAX) = '' 
DECLARE @sql_tmp1 NVARCHAR(MAX) = '' 
DECLARE @sql_tmp2 NVARCHAR(MAX) = '' 
DECLARE @sql_tmp3 NVARCHAR(MAX) = '' 
DECLARE @sql_tmp4 NVARCHAR(MAX) = '' 
DECLARE @sql_tmp_cdio_changes NVARCHAR(MAX) = '' 
DECLARE @sql_tmp_workingset NVARCHAR(MAX) = '' 
DECLARE @sql_tmp_contactmatch_data_pre NVARCHAR(MAX) = '' 
DECLARE @sql_tmp_contactmatch_data_post NVARCHAR(MAX) = '' 
DECLARE @sql_loop_1 NVARCHAR(MAX) = '' 
DECLARE @sql_loop_2 NVARCHAR(MAX) = '' 
DECLARE @sql_tmp_ssbid_fields NVARCHAR(MAX) = '' 
DECLARE @sql_tmp_ssbid_join NVARCHAR(MAX) = '' 
DECLARE @sql_compositeTbl_insert NVARCHAR(MAX) = '' 
DECLARE @sql_dimcustomerMatchkey NVARCHAR(MAX) = '' 
DECLARE @sql_tmp_ssbid_update_1 NVARCHAR(MAX) = '' 
DECLARE @sql_tmp_ssbid_update_2 NVARCHAR(MAX) = '' 
DECLARE @sql_tmp_ssbid_audit NVARCHAR(MAX) = '' 
DECLARE @sql_dimcustomerssbid_audit NVARCHAR(MAX) = '' 
DECLARE @sql_hashTbl_update NVARCHAR(MAX) = '' 
DECLARE @sql_wipe_ssbid NVARCHAR(MAX) = '' 
DECLARE @newHashTable BIT = 0 
DECLARE @counter INT = 0 
 
IF OBJECT_ID('tempdb..#matchkeyConfig') IS NOT NULL 
	DROP TABLE #matchkeyConfig 
 
IF OBJECT_ID('tempdb..#matchkeyGroups') IS NOT NULL 
	DROP TABLE #matchkeyGroups 
 
IF OBJECT_ID('tempdb..#fieldTransformations') IS NOT NULL 
	DROP TABLE #fieldTransformations 
 
IF OBJECT_ID('tempdb..#fieldTransformationsAll') IS NOT NULL 
	DROP TABLE #fieldTransformationsAll 
 
IF OBJECT_ID('tempdb..#baseTblFields') IS NOT NULL 
	DROP TABLE #baseTblFields 
 
IF OBJECT_ID('tempdb..#baseTblLookupFields') IS NOT NULL 
	DROP TABLE #baseTblLookupFields 
 
IF OBJECT_ID('tempdb..#baseTblAllFields') IS NOT NULL 
	DROP TABLE #baseTblAllFields 
 
IF OBJECT_ID('tempdb..#tmp_contactmatch_data') IS NOT NULL 
	DROP TABLE #tmp_contactmatch_data 
 
IF OBJECT_ID('tempdb..#tmp_contacts') IS NOT NULL 
	DROP TABLE #tmp_contacts 
 
IF OBJECT_ID('tempdb..#tmp_accounts') IS NOT NULL 
	DROP TABLE #tmp_accounts 
 
IF OBJECT_ID('tempdb..#compositeTblFields') IS NOT NULL 
	DROP TABLE #compositeTblFields 
 
IF OBJECT_ID('tempdb..#tmp_cdio_changes') IS NOT NULL 
	DROP TABLE #tmp_cdio_changes 
 
IF OBJECT_ID('tempdb..#tmp_workingset') IS NOT NULL 
	DROP TABLE #tmp_workingset 
 
IF OBJECT_ID('tempdb..#dimcustomerMatchkey') IS NOT NULL 
	DROP TABLE #dimcustomerMatchkey 
 
IF OBJECT_ID('tempdb..#tmp_dimcustomerssbid_audit') IS NOT NULL 
	DROP TABLE #tmp_dimcustomerssbid_audit 
 
IF OBJECT_ID('tempdb..#invalid_matchkey') IS NOT NULL 
	DROP TABLE #invalid_matchkey 
 
CREATE TABLE #matchkeyConfig 
( 
	ID INT IDENTITY (1,1), 
	MatchkeyID int, 
	MatchkeyName VARCHAR(255), 
	MatchKeyType VARCHAR(50), 
	MatchkeyPreSql VARCHAR(MAX), 
	MatchkeyBaseTblFieldList VARCHAR(MAX), 
	MatchkeyBaseTbl VARCHAR(255), 
	MatchkeyBaseTblLookupFieldList VARCHAR(MAX), 
	MatchkeyBaseTblLookupCondition VARCHAR(MAX), 
	MatchkeyBaseTblHashSql VARCHAR(MAX), 
	MatchkeyBaseTblFieldTransformationSqlList VARCHAR(MAX), 
	MatchkeyHashIdentifier VARCHAR(50), 
	Active BIT, 
	InsertDate DATETIME, 
	IsDeletedExists BIT 
) 
 
CREATE TABLE #matchkeyGroups (MatchkeyBaseTblID INT, MatchkeyBaseTbl VARCHAR(255), MatchkeyGroupID INT, MatchkeyID INT) 
 
CREATE TABLE #fieldTransformations (ID INT IDENTITY(1,1), FieldName VARCHAR(100), Transformation VARCHAR(MAX)) 
 
CREATE TABLE #fieldTransformationsAll (ID INT IDENTITY(1,1), FieldName VARCHAR(100), Transformation VARCHAR(MAX)) 
 
CREATE TABLE #baseTblFields (FieldName VARCHAR(100) NOT NULL) 
 
CREATE TABLE #baseTblLookupFields (ID INT IDENTITY (1,1), FieldName VARCHAR(100) NOT NULL, DATA_TYPE NVARCHAR(128) NULL) 
 
CREATE TABLE #baseTblAllFields (ID INT IDENTITY(1,1), MatchkeyName VARCHAR(255), MatchkeyID INT, MatchKeyType VARCHAR(50), MatchkeyBaseTblFieldList VARCHAR(MAX), MatchkeyBaseTbl VARCHAR(255) 
	, COLUMN_NAME sysname, DATA_TYPE NVARCHAR(128), CHARACTER_MAXIMUM_LENGTH INT, NUMERIC_PRECISION TINYINT, NUMERIC_SCALE INT) 
 
CREATE TABLE #tmp_contactmatch_data (DimCustomerId INT, SSID NVARCHAR(100), SourceSystem NVARCHAR(50)) 
 
CREATE TABLE #tmp_contacts (SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50)) 
 
CREATE TABLE #tmp_accounts (SSB_CRMSYSTEM_ACCT_ID VARCHAR(50)) 
 
CREATE TABLE #compositeTblFields (ID INT IDENTITY(1,1), MatchkeyID INT, COLUMN_NAME varchar(50), IsNew BIT DEFAULT(0)) 
 
CREATE TABLE #tmp_cdio_changes (SSB_CRMSYSTEM_ACCT_ID varchar (50), SSB_CRMSYSTEM_CONTACT_ID varchar (50)) 
 
CREATE TABLE #tmp_workingset (DimCustomerId INT) 
 
CREATE TABLE #dimcustomerMatchkey (DimCustomerID INT, MatchkeyID INT, MatchkeyValue VARCHAR(50)) 
 
CREATE TABLE #tmp_dimcustomerssbid_audit (DimCustomerID INT, MatchkeyValue VARCHAR(50)) 
CREATE NONCLUSTERED INDEX ix_dimcustomerid ON #tmp_dimcustomerssbid_audit (DimCustomerID) 
CREATE NONCLUSTERED INDEX ix_matchkeyvalue ON #tmp_dimcustomerssbid_audit (MatchkeyValue) 
 
CREATE TABLE #invalid_matchkey (DimCustomerID INT, MatchkeyID INT, SSB_CRMSYSTEM_PRIMARY_FLAG BIT) 
 
 
SELECT @preSql_part1 =  
	+ ' INSERT INTO #matchkeyConfig (MatchkeyID, MatchkeyName, MatchKeyType, MatchkeyPreSql, MatchkeyBaseTblFieldList, MatchkeyBaseTbl, MatchkeyBaseTblLookupFieldList, MatchkeyBaseTblLookupCondition, MatchkeyBaseTblFieldTransformationSqlList, MatchkeyBaseTblHashSql' + CHAR(13) 
	+ '		, MatchkeyHashIdentifier, Active, InsertDate, IsDeletedExists)' + CHAR(13) 
	+ ' SELECT MatchkeyID, MatchkeyName, MatchKeyType, MatchkeyPreSql, MatchkeyBaseTblFieldList, MatchkeyBaseTbl, MatchkeyBaseTblLookupFieldList, MatchkeyBaseTblLookupCondition, MatchkeyBaseTblFieldTransformationSqlList, MatchkeyBaseTblHashSql' + CHAR(13) 
	+ '		, MatchkeyHashIdentifier, Active, InsertDate, CAST(CASE WHEN b.COLUMN_NAME IS NOT NULL THEN 1 ELSE 0 END AS BIT) AS IsDeletedExists' + CHAR(13) 
	+ ' FROM ' + @ClientDB + 'mdm.MatchkeyConfig a' + CHAR(13)  
	+ ' LEFT JOIN ' + @ClientDB + 'INFORMATION_SCHEMA.COLUMNS b ON a.MatchkeyBaseTbl = b.TABLE_SCHEMA + ''.'' + b.TABLE_NAME' + CHAR(13) 
	+ '		AND b.COLUMN_NAME = ''IsDeleted''' + CHAR(13) 
	+ ' where MatchkeyType = ''' + @RecognitionType + '''' + CHAR(13) + CHAR(13) 
 
	+ ' ;WITH matchkeyBaseTbl_UNIQUE AS (' + CHAR(13) 
	+ ' 	SELECT MatchkeyBaseTbl, MatchkeyBaseTbl + ''_'' + REPLACE(CAST(NEWID() AS VARCHAR(50)),''-'','''') AS MatchkeyBaseTbl_UNIQUE' + CHAR(13) 
	+ ' 	FROM (' + CHAR(13) 
	+ ' 		SELECT DISTINCT MatchkeyBaseTbl' + CHAR(13) 
	+ ' 		FROM #matchkeyConfig' + CHAR(13) 
	+ ' 		WHERE 1=1' + CHAR(13) 
	+ ' 		AND MatchkeyBaseTbl LIKE ''#%''' + CHAR(13) 
	+ ' 	) a' + CHAR(13) 
	+ ' )' + CHAR(13) 
	+ ' UPDATE b' + CHAR(13) 
	+ ' SET b.MatchkeyPreSql = REPLACE(b.MatchkeyPreSql, a.MatchkeyBaseTbl, a.MatchkeyBaseTbl_UNIQUE)' + CHAR(13) 
	+ ' 	,b.MatchkeyBaseTbl = a.MatchkeyBaseTbl_UNIQUE' + CHAR(13) 
	+ ' FROM matchkeyBaseTbl_UNIQUE a' + CHAR(13) 
	+ ' INNER JOIN #matchkeyConfig b ON a.MatchkeyBaseTbl = b.MatchkeyBaseTbl' + CHAR(13) 
 
SELECT @preSql_part1 
EXEC sp_executesql @preSql_part1 
 
 
 
SELECT @preSql_part1 = 
	+ ' INSERT INTO #compositeTblFields (MatchkeyID, COLUMN_NAME)' + CHAR(13) 
	+ ' SELECT b.MatchkeyID, a.COLUMN_NAME' + CHAR(13) 
	+ ' FROM ' + @ClientDB + 'INFORMATION_SCHEMA.COLUMNS a' + CHAR(13) 
	+ ' INNER JOIN #matchkeyConfig b ON a.COLUMN_NAME = b.MatchkeyHashIdentifier' + CHAR(13) 
	+ ' WHERE 1=1' + CHAR(13) 
	+ ' AND TABLE_SCHEMA + ''.'' + TABLE_NAME = ''mdm.Composite' + @RecognitionType + 's''' + CHAR(13) 
	+ ' AND b.Active = 1' + CHAR(13) 
	+ ' ORDER BY b.MatchkeyID' + CHAR(13) 
 
SELECT @preSql_part1 
EXEC sp_executesql @preSql_part1 
 
----SELECT * FROM #matchkeyConfig 
----SELECT * FROM #compositeTblFields 
 
SELECT @preSql_part1 =  
	+ ' INSERT INTO #matchkeyGroups' + CHAR(13) 
	+ ' SELECT DENSE_RANK() OVER (ORDER BY a.MatchkeyGroup) AS MatchKeyBaseTblID, a.MatchkeyBaseTbl, ROW_NUMBER() OVER (PARTITION BY a.MatchkeyBaseTbl ORDER BY b.MatchkeyID) AS MatchkeyGroupID, b.MatchkeyID' + CHAR(13) 
	+ ' FROM (' + CHAR(13) 
	+ ' 	SELECT MIN(MatchkeyID) AS MatchkeyGroup, MatchkeyBaseTbl' + CHAR(13) 
	+ ' 	FROM #matchkeyConfig' + CHAR(13) 
	+ '		WHERE Active = 1' + +CHAR(13) 
	+ ' 	GROUP BY MatchkeyBaseTbl' + CHAR(13)  
	+ ' ) a' + CHAR(13) 
	+ ' INNER JOIN #matchkeyConfig b ON a.MatchkeyBaseTbl = b.MatchkeyBaseTbl' + CHAR(13) 
	+ ' WHERE b.Active = 1' + CHAR(13) + CHAR(13) 
	+ ' ORDER BY b.MatchkeyID' + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO #baseTblAllFields' + CHAR(13) 
	+ ' SELECT DISTINCT a.MatchkeyName, a.MatchkeyID, a.MatchKeyType, a.MatchkeyBaseTblFieldList, a.MatchkeyBaseTbl, b.COLUMN_NAME, b.DATA_TYPE, b.CHARACTER_MAXIMUM_LENGTH, b.NUMERIC_PRECISION, b.NUMERIC_SCALE' + CHAR(13) 
	+ ' FROM #matchkeyConfig a' + CHAR(13) 
	+ ' INNER JOIN ' + @ClientDB + 'INFORMATION_SCHEMA.COLUMNS b ON a.MatchkeyBaseTbl = b.TABLE_SCHEMA + ''.'' + b.TABLE_NAME' + CHAR(13) 
	+ ' 	AND a.MatchkeyBaseTblFieldList LIKE ''%'' + b.COLUMN_NAME + ''%''' + CHAR(13) 
	+ '	WHERE a.Active = 1' + CHAR(13) 
	+ ' ORDER BY a.MatchkeyID' + CHAR(13) + CHAR(13) 
 
SELECT @preSql_part1 
EXEC sp_executesql @preSql_part1 
 
 
--- Get all criteria pre-sql and run it once. 
SET @preSql_part1 =  
+ ' SET @preSql_part1 = ''''' + CHAR(13) + CHAR(13) 
+ ' SELECT  @preSql_part1 = COALESCE(@preSql_part1 + '' '', '''') + a.MatchkeyPreSql ' + CHAR(13) 
+ ' FROM  #matchkeyConfig a ' + CHAR(13) 
+ ' WHERE Active = 1' + CHAR(13) + CHAR(13) 
 
EXEC sp_executesql @preSql_part1 
        , N'@preSql_part1 nvarchar(max) OUTPUT' 
       ,  @preSql_part1 OUTPUT 
 
SELECT @preSql_part1 + CHAR(13) + CHAR(13) 
EXEC sp_executesql @preSql_part1 
 
 
SELECT @preSql_part2 = @preSql_part2 + CHAR(13) + CHAR(13) 
	+ ' ALTER TABLE #tmp_contactmatch_data ADD ' + a.COLUMN_NAME 
	+ ' ' + a.DATA_TYPE 
	+ CASE  
		WHEN a.DATA_TYPE LIKE '%CHAR%' OR a.DATA_TYPE LIKE '%BINARY%' THEN CASE WHEN a.CHARACTER_MAXIMUM_LENGTH > 0 THEN '(' + CAST(a.CHARACTER_MAXIMUM_LENGTH AS VARCHAR(5)) + ')' ELSE '(MAX)' END 
		WHEN a.DATA_TYPE IN ('DECIMAL','FLOAT','NUMERIC') THEN '(' + CAST(a.NUMERIC_PRECISION AS VARCHAR(5)) + ', ' + CAST(a.NUMERIC_SCALE AS VARCHAR(5)) + ')' 
		ELSE '' 
	END 
FROM ( 
	SELECT *, DENSE_RANK() OVER (PARTITION BY COLUMN_NAME ORDER BY MatchkeyID) AS ColumnRanking 
	FROM #baseTblAllFields 
) a 
WHERE 1=1 
AND a.ColumnRanking = 1 
ORDER BY a.MatchkeyID 
 
SELECT @preSql_part2 + CHAR(13) + CHAR(13) 
EXEC sp_executesql @preSql_part2 
 
 
SET @preSql_part2 = '' -- RESET @preSql_part2 
 
WHILE @matcheyBaseTblCounter <= (SELECT MAX(MatchKeyBaseTblID) FROM #matchkeyGroups) 
BEGIN 
	TRUNCATE TABLE #baseTblFields 
 
 
	SELECT DISTINCT @matchkeyBaseTbl = MatchkeyBaseTbl 
	FROM #matchkeyGroups 
	WHERE 1=1 
	AND MatchKeyBaseTblID = @matcheyBaseTblCounter 
 
	WHILE @matchkeyGroupIDCounter <= (SELECT MAX(MatchkeyGroupID) FROM #matchkeyGroups WHERE 1=1 AND MatchKeyBaseTblID = @matcheyBaseTblCounter) 
	BEGIN	 
		SET @newHashTable = 0 
		SET @counter = 0 
		SET @sql_tmp1 = '' 
 
		SELECT @matchkeyGroupID = MatchkeyGroupID 
		FROM #matchkeyGroups 
		WHERE 1=1 
		AND MatchKeyBaseTblID = @matcheyBaseTblCounter 
		AND MatchkeyGroupID = @matchkeyGroupIDCounter 
 
		SELECT 
			@ID = ID 
			, @matchkeyID = a.MatchkeyID  
			, @matchkeyName = MatchkeyName 
			, @matchkeyBaseTblFieldList = REPLACE(MatchkeyBaseTblFieldList,'||',',') 
			--, @matchkeyBaseTblFieldListTransformed = REPLACE(MatchkeyBaseTblFieldList,'||',',') 
			--, @matchkeyBaseTblLookupFieldList = REPLACE(MatchkeyBaseTblLookupFieldList,'||',',') 
			, @matchkeyBaseTblLookupFieldList = MatchkeyBaseTblLookupFieldList 
			, @matchkeyBaseTblLookupCondition = MatchkeyBaseTblLookupCondition 
			, @MatchkeyBaseTblFieldTransformationSqlList = MatchkeyBaseTblFieldTransformationSqlList 
			, @matchkeyBaseTblHashSql = CASE WHEN MatchkeyBaseTblHashSql LIKE '%VARCHAR%' THEN 'UPPER(' + MatchkeyBaseTblHashSql + ')' ELSE 'CAST(UPPER(' + MatchkeyBaseTblHashSql + ') AS VARCHAR(MAX))'  END 
			--, @matchkeyBaseTblHashSqlTransformed = CASE WHEN MatchkeyBaseTblHashSql LIKE '%VARCHAR%' THEN 'UPPER(' + MatchkeyBaseTblHashSql + ')' ELSE 'CAST(UPPER(' + MatchkeyBaseTblHashSql + ') AS VARCHAR(MAX))'  END --CAST(UPPER(' + MatchkeyBaseTblHashSql + ') AS VARCHAR(MAX))' 
			, @matchkeyHashOutputTbl = 'mdm.MatchkeyHash' 
			, @matchkeyHashIdentifier = MatchkeyHashIdentifier 
			, @matchkeyHashName = REPLACE(MatchkeyHashIdentifier,'ID','Hash') 
			, @IsDeletedExists = b.IsDeletedExists 
		FROM #matchkeyGroups a 
		INNER JOIN #matchkeyConfig b ON a.MatchkeyID = b.MatchkeyID 
		WHERE 1=1 
		AND a.MatchKeyBaseTblID = @matcheyBaseTblCounter 
		AND a.MatchkeyGroupID = @matchkeyGroupIDCounter 
		AND b.MatchkeyBaseTbl = @matchkeyBaseTbl 
		--AND MatchkeyID = @matchkeyGroupID 
 
		IF @IsDeletedExists = 1 
		BEGIN 
			SET @matchkeyBaseTblLookupCondition = @matchkeyBaseTblLookupCondition + CASE WHEN ISNULL(@matchkeyBaseTblLookupCondition,'') != '' THEN ' AND ' ELSE '' END + 'ISNULL(IsDeleted,0) = 0' 
			--SET @MatchkeyBaseTblLookupFieldList = @MatchkeyBaseTblLookupFieldList + ', IsDeleted' 
		END 
 
		TRUNCATE TABLE #baseTblLookupFields 
		 
		INSERT INTO #baseTblLookupFields (FieldName) 
		SELECT LTRIM(RTRIM(FieldName)) 
		FROM ( 
			 SELECT DISTINCT 
				 Split.a.value('.', 'VARCHAR(100)') AS FieldName   
			 FROM   
			 ( 
				 SELECT CAST ('<M>' + REPLACE(@matchkeyBaseTblLookupFieldList, '||', '</M><M>') + '</M>' AS XML) AS Data   
			 ) AS A CROSS APPLY Data.nodes ('/M') AS Split(a) 
		 ) a 
		 WHERE ISNULL(a.FieldName,'') != '' 
 
		UPDATE a 
		SET a.DATA_TYPE = b.DATA_TYPE 
		FROM #baseTblLookupFields a 
		LEFT JOIN #baseTblAllFields b ON a.FieldName = b.COLUMN_NAME 
			AND b.MatchkeyBaseTbl = @matchkeyBaseTbl 
		WHERE a.DATA_TYPE IS NULL 
 
 
		TRUNCATE TABLE #fieldTransformations 
		 
		INSERT INTO #fieldTransformations (FieldName, Transformation) 
		SELECT LTRIM(RTRIM(LEFT(a.FieldName, CHARINDEX('=', a.FieldName)-1))) AS TransformFieldName, LTRIM(RTRIM(SUBSTRING(a.FieldName,CHARINDEX('=', a.FieldName)+1,LEN(a.FieldName)))) AS Transformation 
		FROM ( 
			SELECT DISTINCT 
				Split.a.value('.', 'VARCHAR(MAX)') AS FieldName   
			FROM   
			( 
				SELECT CAST ('<M>' + REPLACE(@MatchkeyBaseTblFieldTransformationSqlList, '||', '</M><M>') + '</M>' AS XML) AS Data   
			) AS A CROSS APPLY Data.nodes ('/M') AS Split(a) 
		) a 
		WHERE ISNULL(a.FieldName,'') != '' 
 
		INSERT INTO #fieldTransformationsAll 
		        ( FieldName, Transformation ) 
		SELECT a.FieldName, a.Transformation 
		FROM #fieldTransformations a 
		LEFT JOIN #fieldTransformationsAll b ON a.FieldName = b.FieldName 
		WHERE b.ID IS NULL 
 
 
 
		DECLARE @fieldName VARCHAR(100) = '', @tranformation VARCHAR(MAX) = '' 
		SET @counter = (SELECT MIN(ID) FROM #fieldTransformations) 
		SET @matchkeyBaseTblHashSqlTransformed = @matchkeyBaseTblHashSql 
		SET @matchkeyBaseTblFieldListTransformed = @matchkeyBaseTblFieldList 
		WHILE @counter <= (SELECT MAX(ID) FROM #fieldTransformations) 
		BEGIN 
			SELECT @fieldName = LTRIM(RTRIM(FieldName)), @tranformation = Transformation 
			FROM #fieldTransformations WHERE ID = @counter 
 
			SET @matchkeyBaseTblFieldListTransformed = REPLACE(@matchkeyBaseTblFieldListTransformed, @fieldName, @fieldName + ' = ' + @tranformation) 
			--SET @matchkeyBaseTblLookupCondition = REPLACE(@matchkeyBaseTblLookupCondition, @fieldName, @tranformation) 
			--SET @matchkeyBaseTblLookupFieldList = REPLACE(@matchkeyBaseTblLookupFieldList, @fieldName, @fieldName + ' = ' + @tranformation) 
			SET @matchkeyBaseTblHashSqlTransformed = REPLACE(@matchkeyBaseTblHashSqlTransformed, @fieldName, @tranformation) 
 
			SET @counter = @counter + 1 
		END 
 
		--SELECT @matchkeyBaseTblFieldListTransformed, @matchkeyBaseTblLookupCondition,@matchkeyBaseTblLookupFieldList, @matchkeyBaseTblHashSqlTransformed 
		 
		 
		SET @sql_tmp1 = @matchkeyBaseTblLookupCondition 
		 
		SET @counter = (SELECT MIN(ID) FROM #baseTblLookupFields) 
		WHILE @counter <= (SELECT MAX(ID) FROM #baseTblLookupFields) 
		BEGIN 
			SET @sql_tmp1 = REPLACE(@sql_tmp1, (SELECT LTRIM(RTRIM(FieldName)) FROM #baseTblLookupFields WHERE ID = @counter) 
				, CASE WHEN CHARINDEX((SELECT LTRIM(RTRIM(FieldName)) FROM #baseTblLookupFields WHERE ID = @counter), @matchkeyBaseTblFieldListTransformed) != 0 THEN 'a.' ELSE '' END + (SELECT LTRIM(RTRIM(FieldName)) FROM #baseTblLookupFields WHERE ID = @counter)) 
			SET @counter = @counter + 1 
		END 
		 
					 
		SET @preSql_part2 =  
			+ ' IF (SELECT COUNT(0) FROM ' + @ClientDB + 'INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA + ''.'' + TABLE_NAME = ''mdm.Composite' + @RecognitionType + 's'' AND COLUMN_NAME = ''' + @matchkeyHashIdentifier + ''') = 0' + CHAR(13) 
			+ ' BEGIN' + CHAR(13) 
			+ '		INSERT INTO #compositeTblFields (MatchkeyID, COLUMN_NAME, IsNew) VALUES (' + CAST(@matchkeyID AS VARCHAR(5)) + ',''' + @matchkeyHashIdentifier + ''', 1)' + CHAR(13) + CHAR(13) 
 
			+ '		ALTER TABLE ' + @ClientDB + 'mdm.Composite' + @RecognitionType + 's ADD ' + @matchkeyHashIdentifier + ' VARCHAR(50)' + CHAR(13) 
			+ '		CREATE NONCLUSTERED INDEX IX_Composite' + @RecognitionType + 's_' + @matchkeyHashIdentifier + ' ON ' + @ClientDB + 'mdm.Composite' + @RecognitionType + 's (' + @matchkeyHashIdentifier + ') INCLUDE (' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END + ') WITH (FILLFACTOR=90) ON [PRIMARY]' + CHAR(13) 
 
			+ '		INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
			+ '		VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Add column ' + @matchkeyHashIdentifier + ' to mdm.Composite' + @RecognitionType + 's'', 0);' + CHAR(13) + CHAR(13) 
			+ ' END' 
 
		SELECT @preSql_part2 
		EXEC sp_executesql @preSql_part2, N'@newHashTable BIT', @newHashTable 
 
		IF ISNULL(@matchkeyBaseTblHashSqlTransformed,'') != '' 
		BEGIN 
			SELECT @preSql_part3 = @preSql_part3 
				+ ' IF ((SELECT COUNT(0) FROM ' + @ClientDB + 'mdm.MatchkeyHash WITH (NOLOCK) WHERE MatchkeyHashIDName = ''' + @matchkeyHashIdentifier + ''') = 0' + CHAR(13) 
				+ '		AND (SELECT COUNT(0) FROM #compositeTblFields WHERE IsNew = 1 AND COLUMN_NAME = ''' + @matchkeyHashIdentifier + ''') > 0)' + CHAR(13) 
				+ ' BEGIN' + CHAR(13) 
				 
			SELECT @preSql_part3 = @preSql_part3 
				+ '		SELECT DISTINCT a.' + CASE WHEN @RecognitionType = 'Contact' THEN 'cc_id' ELSE 'ca_id' END + ', b.DimCustomerID, CAST(NULL AS VARCHAR(50)) AS ' + @matchkeyHashIdentifier + CHAR(13) 
				+ CASE WHEN a.ID = 1 THEN '		INTO #composite' + @RecognitionType + 's_update_' + @matchkeyHashIdentifier + CHAR(13) ELSE '' END 
				+ '		FROM ' + @ClientDB + 'mdm.Composite' + @RecognitionType + 's a WITH (NOLOCK)' + CHAR(13) 
				+ '		INNER JOIN ' + @ClientDB + 'dbo.DimCustomerMatchkey b WITH (NOLOCK) ON a.' + a.COLUMN_NAME + ' = b.MatchkeyValue' + CHAR(13) 
				+ '		WHERE 1=1' + CHAR(13) 
				+ '		AND b.MatchkeyID = ' + CAST(a.MatchkeyID AS VARCHAR(5)) 
				+ CASE WHEN a.ID != (SELECT MAX(ID) FROM #compositeTblFields) AND a.ID < (SELECT MAX(ID) FROM #compositeTblFields WHERE IsNew = 0) THEN CHAR(13) + '		UNION' + CHAR(13) ELSE '' END 
			FROM #compositeTblFields a 
			WHERE 1=1 
			AND A.IsNew = 0 
		 
 
			SET @preSql_part3 = @preSql_part3 + CHAR(13) + CHAR(13) 
				+ '		SELECT a.*' + CHAR(13) 
				+ '			, ' + CASE WHEN (SELECT (STUFF(( 
									SELECT DISTINCT ',' + LTRIM(RTRIM(DATA_TYPE)) 
									FROM #baseTblAllFields 
									WHERE MatchkeyName = @matchkeyName 
									FOR XML PATH('')), 1, 1, '')) AS DATA_TYPE) = 'uniqueidentifier' THEN @matchkeyBaseTblFieldListTransformed ELSE ' NEWID()' END + ' AS MatchkeyHashID' + CHAR(13) 
				+ '			, ' + @matchkeyBaseTblHashSqlTransformed + ' AS HashPlainText' + CHAR(13) 
				+ '			, CAST(HASHBYTES(''SHA2_256'', ' + @matchkeyBaseTblHashSqlTransformed + ') AS VARBINARY(32)) AS [Hash]' + CHAR(13) 
				+ '		INTO #' + @matchkeyHashName + CHAR(13) 
				+ '		FROM #composite' + @RecognitionType + 's_update_' + @matchkeyHashIdentifier + ' a' + CHAR(13) 
				+ '		INNER JOIN ' + @ClientDB + 'dbo.DimCustomer b WITH (NOLOCK) ON a.DimCustomerID = b.DimCustomerId' + CHAR(13) 
				+ '		WHERE 1=1' + CHAR(13) 
				+ '		AND ' + @matchkeyBaseTblLookupCondition + CHAR(13) + CHAR(13) 
 
				+ '		CREATE CLUSTERED INDEX ix_dimcustomer ON #' + @matchkeyHashName + ' (DimCustomerID)' + CHAR(13) 
				+ '		CREATE NONCLUSTERED INDEX ix_hash ON #' + @matchkeyHashName + '([Hash])' + CHAR(13) + CHAR(13) 
			 
				+ '		INSERT INTO ' + @ClientDB + @matchkeyHashOutputTbl + '(MatchkeyHashID, MatchkeyHashIDName, MatchkeyHashPlainText, MatchkeyHash)' + CHAR(13) 
				+ '		SELECT a.MatchkeyHashID, ''' + @matchkeyHashIdentifier + ''', a.HashPlainText, a.[Hash]' + CHAR(13) 
				+ '		FROM #' + @matchkeyHashName + ' a' + CHAR(13) 
				+ '		LEFT JOIN ' + @ClientDB + @matchkeyHashOutputTbl + ' b WITH (NOLOCK) ON a.[Hash] = b.MatchkeyHash' + CHAR(13) 
				+ '			AND b.MatchkeyHashIDName = ''' + @matchkeyHashIdentifier + '''' + CHAR(13) 
				+ '		WHERE 1=1' + CHAR(13) 
				+ '		AND b.ID IS NULL' + CHAR(13) + CHAR(13) 
 
				+ '		INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
				+ '		VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Load table ' + @matchkeyHashOutputTbl + ''', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
 
				+ '		CREATE CLUSTERED INDEX ix_matchkey ON #composite' + @RecognitionType + 's_update_' + @matchkeyHashIdentifier + ' (DimCustomerID ASC, ' + CASE WHEN @RecognitionType = 'Contact' THEN 'cc_id' ELSE 'ca_id' END + ' ASC)' + CHAR(13) + CHAR(13) 
 
				+ '		UPDATE a' + CHAR(13) 
				+ '		SET a.' + @matchkeyHashIdentifier + ' = c.MatchkeyHashID' + CHAR(13) 
				+ '		FROM #composite' + @RecognitionType + 's_update_' + @matchkeyHashIdentifier + ' a' + CHAR(13) 
				+ '		INNER JOIN #' + @matchkeyHashName + ' b ON a.' + CASE WHEN @RecognitionType = 'Contact' THEN 'cc_id' ELSE 'ca_id' END + ' = b.' + CASE WHEN @RecognitionType = 'Contact' THEN 'cc_id' ELSE 'ca_id' END + CHAR(13) 
				+ '			AND a.DimCustomerID = b.DimCustomerID' + CHAR(13) 
				+ '		INNER JOIN ' + @ClientDB + @matchkeyHashOutputTbl + ' c WITH (NOLOCK) ON b.Hash = c.MatchkeyHash' + CHAR(13) 
				+ '			AND c.MatchkeyHashIDName = ''' + @matchkeyHashIdentifier + '''' + CHAR(13) 
				+ '		WHERE 1=1' + CHAR(13) 
				+ '		AND a.' + @matchkeyHashIdentifier + ' IS NULL' + CHAR(13) + CHAR(13) 
 
				+ '		UPDATE b' + CHAR(13) 
				+ '		SET b.' + @matchkeyHashIdentifier + ' = a.' + @matchkeyHashIdentifier + CHAR(13) 
				+ '		FROM #composite' + @RecognitionType + 's_update_' + @matchkeyHashIdentifier + ' a' + CHAR(13) 
				+ '		INNER JOIN ' + @ClientDB + 'mdm.composite' + @RecognitionType + 's b ON a.' + CASE WHEN @RecognitionType = 'Contact' THEN 'cc_id' ELSE 'ca_id' END + ' = b.' + CASE WHEN @RecognitionType = 'Contact' THEN 'cc_id' ELSE 'ca_id' END + CHAR(13) 
				+ '		WHERE 1=1' + CHAR(13) 
				+ '		AND ISNULL(a.' + @matchkeyHashIdentifier + ','''') != ISNULL(b.' + @matchkeyHashIdentifier + ','''')' + CHAR(13) + CHAR(13) 
 
				+ '		INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
				+ '		VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Load column mdm.composite' + @RecognitionType + 's.' + @matchkeyHashIdentifier + ''', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
 
				+ '		DROP TABLE #' + @matchkeyHashName + CHAR(13) 
				+ '		DROP TABLE #composite' + @RecognitionType + 's_update_' + @matchkeyHashIdentifier + CHAR(13) 
 
			SELECT @preSql_part3 = @preSql_part3 + CHAR(13) + ' END' + CHAR(13) + CHAR(13) 
	 
			IF (ISNULL(@matchkeyBaseTblHashSqlTransformed,'') != '') 
			BEGIN					 
				SET @sql_tmp_ssbid_fields = @sql_tmp_ssbid_fields + ', CAST(hash' + CAST(@matcheyBaseTblCounter AS NVARCHAR(2)) + '_' + CAST(@matchkeyGroupIDCounter AS NVARCHAR(2)) + '.MatchkeyHashID AS VARCHAR(50)) AS ' + @matchkeyHashIdentifier + CHAR(13) 
				SET @sql_tmp_ssbid_join = @sql_tmp_ssbid_join + 'LEFT JOIN ' + @ClientDB + @matchkeyHashOutputTbl + ' hash' + CAST(@matcheyBaseTblCounter AS NVARCHAR(2)) + '_' + CAST(@matchkeyGroupIDCounter AS NVARCHAR(2)) + ' ON CAST(HASHBYTES(''SHA2_256'', ' + @matchkeyBaseTblHashSqlTransformed + ') AS VARBINARY(32)) = hash' + CAST(@matcheyBaseTblCounter AS NVARCHAR(2)) + '_' + CAST(@matchkeyGroupIDCounter AS NVARCHAR(2)) + '.MatchkeyHash' + CHAR(13) 
					+ '		AND ' + 'hash' + CAST(@matcheyBaseTblCounter AS NVARCHAR(2)) + '_' + CAST(@matchkeyGroupIDCounter AS NVARCHAR(2)) + '.MatchkeyHashIDName = ''' + @matchkeyHashIdentifier + '''' + CHAR(13) 
			END 
		END					 
		ELSE IF (ISNULL(@matchkeyBaseTblHashSqlTransformed,'') = '' AND @matchkeyBaseTblFieldListTransformed NOT LIKE '%,%') 
		BEGIN 
			IF (@sql_tmp_ssbid_fields NOT LIKE '%' + @matchkeyHashIdentifier + '%') 
				SET @sql_tmp_ssbid_fields = @sql_tmp_ssbid_fields + ' 	,case when replace(replace(cast(' + @matchkeyBaseTblFieldListTransformed + ' as varchar(50)), ''{'', ''''), ''}'', '''') != ''00000000-0000-0000-0000-000000000000'' then  replace(replace(cast(' + @matchkeyBaseTblFieldListTransformed + ' as varchar(50)), ''{'', ''''), ''}'', '''') else null end as ' + @matchkeyHashIdentifier + CHAR(13) 
		END 
 
		SET @sql_tmp2 =   
			 ' INSERT INTO #tmp_contactmatch_data (dimcustomerid, ssid, sourcesystem, @matchkeyBaseTblFieldListDistinct_NO_ALIAS)' + CHAR(13) 
			+ ' SELECT DISTINCT b.dimcustomerid, b.ssid, b.sourcesystem, @matchkeyBaseTblFieldListDistinct' + CHAR(13) 
			+ ' FROM ' + @ClientDB + @matchkeyBaseTbl + ' b WITH (NOLOCK)' + CHAR(13) 
			+ CASE WHEN @RecognitionType != 'Contact' THEN ' INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid d WITH (NOLOCK) ON d.DimCustomerId = b.DimCustomerId' + CHAR(13) ELSE '' END  
			+ ' INNER JOIN #tmp_workingset a ON b.dimcustomerid = a.DimCustomerId' + CHAR(13)  
			+ ' LEFT JOIN #tmp_contactmatch_data c ON b.dimcustomerid = c.dimcustomerid' + CHAR(13) 
			+ ' WHERE c.dimcustomerid is NULL' + CHAR(13) 
			+ CASE WHEN @IsDeletedExists = 1 THEN ' AND ISNULL(b.IsDeleted,0) = 0' + CHAR(13) ELSE '' END + CHAR(13) 
 
			+ ' SELECT @rowCount_contactMatch_pre = @rowCount_contactMatch_pre + @@ROWCOUNT' + CHAR(13) + CHAR(13) 
 
		SET @sql_tmp_contactmatch_data_pre = @sql_tmp2 + REPLACE(@sql_tmp_contactmatch_data_pre, @sql_tmp2, '') 
 
		SET @sql_tmp2 = 
			'		INSERT INTO #tmp_contactmatch_data (dimcustomerid, ssid, sourcesystem, @matchkeyBaseTblFieldListDistinct_NO_ALIAS)' + CHAR(13) 
			+ '		SELECT DISTINCT ' + CASE WHEN @RecognitionType != 'Contact' THEN 'd.' ELSE 'a.' END + 'dimcustomerid,  a.ssid, a.sourcesystem, @matchkeyBaseTblFieldListDistinct' + CHAR(13) 
			+ '		FROM ' + @ClientDB + @matchkeyBaseTbl + ' a WITH (NOLOCK)' + CHAR(13) 
			+ '		INNER JOIN (SELECT DISTINCT ' + @matchkeyBaseTblFieldList  + ' FROM #tmp_contactmatch_data a) b ON (1=1 ' + CHAR(13) 
 
 
		SET @sql_tmp3 = REPLACE(@matchkeyBaseTblHashSqlTransformed,'MAX','8000') 
		SET @sql_tmp4 = REPLACE(@matchkeyBaseTblHashSql,'MAX','8000') 
		SET @counter = 1 
		WHILE @counter <= (SELECT MAX(ID) FROM #baseTblAllFields) 
		BEGIN 
			SELECT @sql_tmp3 = REPLACE(@sql_tmp3, ISNULL(b.Transformation, a.COLUMN_NAME),  REPLACE(ISNULL(b.Transformation,a.COLUMN_NAME), ISNULL(b.FieldName,a.COLUMN_NAME), 'a.' + ISNULL(b.FieldName,a.COLUMN_NAME))) 
			FROM #baseTblAllFields a  
			LEFT JOIN #fieldTransformations b ON a.COLUMN_NAME = b.FieldName 
			WHERE 1=1 
			AND MatchkeyID = @matchkeyID 
			AND a.ID = @counter 
 
			SELECT @sql_tmp4 = REPLACE(@sql_tmp4, a.COLUMN_NAME, 'b.' + a.COLUMN_NAME) 
			FROM #baseTblAllFields a  
			WHERE 1=1 
			AND MatchkeyID = @matchkeyID 
			AND a.ID = @counter 
 
			SET @counter = @counter + 1 
		END 
		 
		SET @sql_tmp2 = @sql_tmp2 + '		AND ' + CHAR(13) + @sql_tmp3 + CHAR(13) + ' = ' + CHAR(13) + @sql_tmp4 
 
		SET @sql_tmp2 = @sql_tmp2 + ')' + CHAR(13) 
			+ CASE WHEN @RecognitionType != 'Contact' THEN '		INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid d WITH (NOLOCK) ON a.DimCustomerId = d.DimCustomerId' + CHAR(13) 
				--+ '		INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid e ON d.SSB_CRMSYSTEM_CONTACT_ID = e.SSB_CRMSYSTEM_CONTACT_ID' + CHAR(13) 
				+ '			AND d.SSB_CRMSYSTEM_PRIMARY_FLAG = 1' + CHAR(13) 
				ELSE '' 
			  END 
			+ '		LEFT JOIN #tmp_contactmatch_data c ON ' + CASE WHEN @RecognitionType != 'Contact' THEN 'd.' ELSE 'a.' END + 'dimcustomerid = c.dimcustomerid' 
			+ '		WHERE c.dimcustomerid is NULL' 
			+ '		AND (' + REPLACE(@sql_tmp1, 'IsDeleted', 'a.IsDeleted') + ')' + CHAR(13) + CHAR(13) 
 
			+ '		SET @results = @@RowCount' + CHAR(13) 
			+ '		SET @Added_Count = @Added_Count + @results' + CHAR(13) + CHAR(13) 
			 
			+ '		INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
			+ '		VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Contact Match Records - ' + @matchkeyName + ' - Loop'', @Added_Count);' + CHAR(13) + CHAR(13)	 
 
		SET @sql_loop_1 = REPLACE(@sql_loop_1, @sql_tmp2, '') + @sql_tmp2 
 
		IF (ISNULL(@matchkeyHashIdentifier,'') != '') 
		BEGIN 
 
			--------------------------------- 
			-- @sql_compositeTbl_insert 
			--------------------------------- 
			SET @sql_compositeTbl_insert = @sql_compositeTbl_insert 
				+ ' INSERT INTO ' + @ClientDB + 'mdm.Composite' + @RecognitionType + 's (' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END 
			SELECT @sql_compositeTbl_insert = @sql_compositeTbl_insert 
				+ ' , ' + a.MatchkeyHashIdentifier 
			--SELECT a.MatchkeyHashIdentifier 
			FROM #matchkeyConfig a 
			INNER JOIN #compositeTblFields b ON a.MatchkeyHashIdentifier = b.COLUMN_NAME 
			WHERE 1=1 
			AND MatchkeyHashIdentifier IS NOT NULL 
			ORDER BY a.MatchkeyID 
 
			SET @sql_compositeTbl_insert = @sql_compositeTbl_insert 
				+ ' )' + CHAR(13) 
				+ ' SELECT DISTINCT ' + CHAR(13) 
				+ ' a.' + @matchkeyHashIdentifier + ' as ' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END + CHAR(13) 
 
			SELECT @sql_compositeTbl_insert = @sql_compositeTbl_insert 
				+ ' , a.' + a.MatchkeyHashIdentifier 
			--SELECT a.MatchkeyHashIdentifier 
			FROM #matchkeyConfig a 
			INNER JOIN #compositeTblFields b ON a.MatchkeyHashIdentifier = b.COLUMN_NAME 
			WHERE 1=1 
			AND MatchkeyHashIdentifier IS NOT NULL 
			AND a.Active = 1 
			ORDER BY a.MatchkeyID		 
 
			SET @sql_compositeTbl_insert = @sql_compositeTbl_insert + CHAR(13) 
			+ ' FROM #tmp_ssbid a' + CHAR(13)  
			+ ' LEFT JOIN ' + @ClientDB + 'mdm.composite' + @RecognitionType + 's b WITH (NOLOCK) ON a.' + @matchkeyHashIdentifier + ' = b.' + @matchkeyHashIdentifier + CHAR(13) 
			+ ' WHERE b.' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END + ' IS NULL' + CHAR(13) 
		 
			SELECT @sql_compositeTbl_insert = @sql_compositeTbl_insert 
			+ ' AND a.' + a.MatchkeyHashIdentifier + ' IS' + CASE WHEN @matchkeyHashIdentifier = a.MatchkeyHashIdentifier THEN ' NOT ' ELSE ' ' END + 'NULL' 
			--SELECT a.MatchkeyHashIdentifier 
			FROM #matchkeyConfig a 
			INNER JOIN #compositeTblFields b ON a.MatchkeyHashIdentifier = b.COLUMN_NAME 
			WHERE 1=1 
			AND MatchkeyHashIdentifier IS NOT NULL 
			AND a.Active = 1 
			ORDER BY a.MatchkeyID		 
 
			SET @sql_compositeTbl_insert = @sql_compositeTbl_insert + CHAR(13) + CHAR(13) 
				+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
				+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Insert Composite ' + @RecognitionType + 's - ' + @matchkeyName + ' ONLY'', @@ROWCOUNT);' + CHAR(13) + CHAR(13)	 
 
			------------------------- 
			-- @sql_tmp_ssbid_update_1 
			------------------------- 
			SET @sql_tmp_ssbid_update_1 = @sql_tmp_ssbid_update_1 
				+ ' ;WITH get_dups AS (' + CHAR(13) 
				+ ' 	SELECT DimCustomerId, composite_id, ' + @matchkeyHashIdentifier + ', DENSE_RANK() OVER (PARTITION BY composite_id ORDER BY ' + @matchkeyHashIdentifier + ') as duprank' + CHAR(13) 
				+ ' 	FROM #tmp_ssbid' + CHAR(13) 
				+ ' ),' + CHAR(13) 
				+ ' dups AS (' + CHAR(13) 
				+ ' 	SELECT b.DimCustomerId, duprank' + CHAR(13) 
				+ ' 	FROM get_dups a' + CHAR(13) 
				+ ' 	INNER JOIN #tmp_ssbid b ON a.DimCustomerId = b.DimCustomerId' + CHAR(13) 
				+ ' 	WHERE a.duprank > 1' + CHAR(13) 
				+ ' )' + CHAR(13) 
				+ ' UPDATE c' + CHAR(13) 
				+ ' SET c.composite_id = NULL' + CHAR(13) 
				+ ' --SELECT DISTINCT b.*' + CHAR(13) 
				+ ' FROM dups a' + CHAR(13) 
				+ ' INNER JOIN #tmp_ssbid b ON a.DimCustomerId = b.DimCustomerId' + CHAR(13) + CHAR(13) 
				+ ' INNER JOIN #tmp_ssbid c ON b.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID' + CHAR(13) + CHAR(13) -- ?????? 
 
			------------------------- 
			-- @sql_tmp_ssbid_update_2 
			------------------------- 
			SET @sql_tmp_ssbid_update_2 = @sql_tmp_ssbid_update_2 
				+ ' UPDATE a' + CHAR(13) 
				+ ' SET composite_id = b.' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END + CHAR(13) 
				+ '		,updateddate = current_timestamp' + CHAR(13) 
				+ '		,updatedby = ''CI''' + CHAR(13) 
				+ ' FROM #tmp_ssbid a' + CHAR(13) 
				+ ' INNER JOIN ' + @ClientDB + 'mdm.composite' + @RecognitionType + 's b WITH (NOLOCK) ON a.' + @matchkeyHashIdentifier + ' = b.' + @matchkeyHashIdentifier + CHAR(13) 
				+ ' WHERE 1=1' + CHAR(13) 
				+ ' AND (a.composite_id is null or a.composite_id != b.' + @matchkeyHashIdentifier + ')' + CHAR(13) 
		 
			SELECT @sql_tmp_ssbid_update_2 = @sql_tmp_ssbid_update_2 
			+ ' AND a.' + a.MatchkeyHashIdentifier + ' IS' + CASE WHEN @matchkeyHashIdentifier = a.MatchkeyHashIdentifier THEN ' NOT ' ELSE ' ' END + 'NULL' 
			--SELECT a.MatchkeyHashIdentifier 
			FROM #matchkeyConfig a 
			INNER JOIN #compositeTblFields b ON a.MatchkeyHashIdentifier = b.COLUMN_NAME 
			WHERE 1=1 
			AND MatchkeyHashIdentifier IS NOT NULL 
			AND a.Active = 1 
			ORDER BY a.MatchkeyID		 
 
			SET @sql_tmp_ssbid_update_2 = @sql_tmp_ssbid_update_2 + CHAR(13) + CHAR(13) 
				+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
				+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Assign Composite ID - ' + @matchkeyName + ' ONLY'', @@ROWCOUNT);' + CHAR(13) + CHAR(13)	 
 
			------------------------- 
			-- @sql_hashTbl_update 
			------------------------- 
			IF ISNULL(@matchkeyBaseTblHashSqlTransformed,'') != '' 
				SET @sql_hashTbl_update = @sql_hashTbl_update 
					+' INSERT INTO ' + @ClientDB + @matchkeyHashOutputTbl + '(MatchkeyHashID, MatchkeyHashIDName, MatchkeyHashPlainText, MatchkeyHash)' + CHAR(13) 
					+ ' SELECT ' + CHAR(13) 
					+ '		' + CASE WHEN (SELECT (STUFF(( 
							SELECT DISTINCT ',' + LTRIM(RTRIM(DATA_TYPE)) 
							FROM #baseTblAllFields 
							WHERE MatchkeyName = @matchkeyName 
							FOR XML PATH('')), 1, 1, '')) AS DATA_TYPE) = 'uniqueidentifier' THEN 'CAST(a.MatchkeyHashPlainText AS UNIQUEIDENTIFIER)' ELSE ' NEWID()' END + ' AS MatchkeyHashID' + CHAR(13) 
					+ '		, ''' + @matchkeyHashIdentifier + ''' AS MatchkeyHashIDName' + CHAR(13) 
					+ ' 	, a.MatchkeyHashPlainText' + CHAR(13) 
					+ '		, a.MatchkeyHash' + CHAR(13) 
					+ ' FROM (' + CHAR(13) 
					+ ' 	SELECT DISTINCT ' + @matchkeyBaseTblHashSqlTransformed + ' AS MatchkeyHashPlainText' + CHAR(13) 
					+ '			, CAST(HASHBYTES(''SHA2_256'', ' + @matchkeyBaseTblHashSqlTransformed + ') AS VARBINARY(32)) AS MatchkeyHash' + CHAR(13) 
					+ ' 	FROM #tmp_contactmatch_data' + CHAR(13) 
					+ ' 	WHERE 1=1' + CHAR(13) 
					+ ' 	AND (' + CHAR(13) 
					+ '			' + REPLACE(@matchkeyBaseTblLookupCondition, ' AND ISNULL(IsDeleted,0) = 0', '') +  CHAR(13) 
					+ '		)' + CHAR(13) 
					+ ' ) a' + CHAR(13) 
					+ ' LEFT JOIN ' + @ClientDB + @matchkeyHashOutputTbl + ' b WITH (NOLOCK) ON a.MatchkeyHash = b.MatchkeyHash' + CHAR(13) 
					+ '		AND b.MatchkeyHashIDName = ''' + @matchkeyHashIdentifier + '''' + CHAR(13) 
					+ ' WHERE b.ID IS NULL;' + CHAR(13) + CHAR(13) 
 
					+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
					+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Insert ' + @matchkeyHashOutputTbl + ' - ' + @matchkeyHashIdentifier + ''', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
		END 
 
 
		IF (ISNULL(@matchkeyHashIdentifier,'') != '' OR @matchkeyBaseTblFieldListTransformed NOT LIKE '%,%') 
		BEGIN 
 
			------------------------- 
			-- @sql_loop_2 
			------------------------- 
			SET @sql_loop_2 = @sql_loop_2 
				+ '		TRUNCATE TABLE #Tmp_Matchkey;' + CHAR(13) 
				+ '		TRUNCATE TABLE #Tmp_Match;' + CHAR(13) 
				+ '		TRUNCATE TABLE #tmp_Composite_cnt;' + CHAR(13) 
				+ '		TRUNCATE TABLE #tmp_update;' + CHAR(13) + CHAR(13) 
 
				+ '		INSERT INTO #tmp_matchkey' + CHAR(13) 
				+ '		SELECT ' + CASE WHEN ISNULL(@matchkeyHashIdentifier,'') != '' THEN @matchkeyHashIdentifier ELSE @matchkeyBaseTblFieldListTransformed END + ' AS matchkey' + CHAR(13) 
				+ '		FROM #tmp_ssbid' + CHAR(13) 
				+ '		WHERE ISNULL(' + CASE WHEN ISNULL(@matchkeyHashIdentifier,'') != '' THEN @matchkeyHashIdentifier ELSE @matchkeyBaseTblFieldListTransformed END + ', '''') != ''''' + CHAR(13) 
				+ '		GROUP BY ' + CASE WHEN ISNULL(@matchkeyHashIdentifier,'') != '' THEN @matchkeyHashIdentifier ELSE @matchkeyBaseTblFieldListTransformed END + CHAR(13) 
				+ '		HAVING COUNT(DISTINCT composite_id) > 1' + CHAR(13) + CHAR(13) 
				 
				+ '		SET @Records = @Records + @@Rowcount' + CHAR(13) + CHAR(13) 
 
				+ '		INSERT INTO #Tmp_match' + CHAR(13) 
				+ '		SELECT DISTINCT a.' + CASE WHEN ISNULL(@matchkeyHashIdentifier,'') != '' THEN @matchkeyHashIdentifier ELSE @matchkeyBaseTblFieldListTransformed END + ', composite_id' + CHAR(13) 
				+ '		FROM #tmp_ssbid a' + CHAR(13) 
				+ '		INNER join #Tmp_matchkey b' + CHAR(13) 
				+ '		ON a.' + CASE WHEN ISNULL(@matchkeyHashIdentifier,'') != '' THEN @matchkeyHashIdentifier ELSE @matchkeyBaseTblFieldListTransformed END + ' = b.matchkey' + CHAR(13) + CHAR(13) 
 
				+ '		INSERT INTO #tmp_composite_cnt' + CHAR(13) 
				+ '		SELECT a.composite_id, COUNT(0) AS composite_cnt' + CHAR(13) 
				+ '		FROM #tmp_ssbid a' + CHAR(13) 
				+ '		INNER JOIN (SELECT DISTINCT composite_id FROM #Tmp_match) b' + CHAR(13) 
				+ '		ON a.composite_id = b.composite_id' + CHAR(13) 
				+ '		GROUP BY a.composite_id;' + CHAR(13) + CHAR(13) 
 
				+ '		INSERT INTO #Tmp_Update' + CHAR(13) 
				+ '		SELECT matchkey, composite_id' + CHAR(13) 
				+ '		FROM  (' + CHAR(13) 
				+ '			SELECT matchkey, a.composite_id, composite_cnt, ROW_NUMBER() OVER (PARTITION BY matchkey ORDER BY composite_cnt DESC) AS composite_rank' + CHAR(13) 
				+ '			FROM #tmp_match a' + CHAR(13) 
				+ '			INNER JOIN #Tmp_composite_cnt b' + CHAR(13) 
				+ '			ON a.composite_id = b.composite_id' + CHAR(13) 
				+ '		) a' + CHAR(13) 
				+ '		WHERE composite_rank = 1' + CHAR(13) + CHAR(13) 
 
				+ '		UPDATE a' + CHAR(13) 
				+ '		SET composite_id = b.composite_id' + CHAR(13) 
				+ '		FROM #tmp_ssbid a' + CHAR(13) 
				+ '		INNER JOIN #tmp_update b' + CHAR(13) 
				+ '		ON a.' + CASE WHEN ISNULL(@matchkeyHashIdentifier,'') != '' THEN @matchkeyHashIdentifier ELSE @matchkeyBaseTblFieldListTransformed END + ' = b.matchkey' + CHAR(13) + CHAR(13) 
 
 
			----------------------------------- 
			-- sql_tmp_ssbid_audit 
			----------------------------------- 
			SELECT @sql_tmp_ssbid_audit = @sql_tmp_ssbid_audit 
				+ ' SELECT  ' + CASE WHEN ISNULL(@matchkeyHashIdentifier,'') != '' THEN @matchkeyHashIdentifier ELSE @matchkeyBaseTblFieldListTransformed END + CHAR(13) 
				+ ' from #tmp_ssbid' + CHAR(13) 
				+ ' WHERE isnull(' + CASE WHEN ISNULL(@matchkeyHashIdentifier,'') != '' THEN @matchkeyHashIdentifier ELSE @matchkeyBaseTblFieldListTransformed END + ', '''') != ''''' + CHAR(13) 
				+ ' GROUP BY ' + CASE WHEN ISNULL(@matchkeyHashIdentifier,'') != '' THEN @matchkeyHashIdentifier ELSE @matchkeyBaseTblFieldListTransformed END + CHAR(13) 
				+ ' HAVING COUNT(DISTINCT ' + @ssb_crmsystem_id_field + ') > 1' + CHAR(13) + CHAR(13) 
 
				+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
				+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Audit ' + @matchkeyName + ' - Composite'', @@ROWCOUNT);' + CHAR(13) + CHAR(13)	 
 
			----------------------------------- 
			-- sql_dimcustomerMatchkey_insert 
			----------------------------------- 
			SELECT  @sql_dimcustomerMatchkey = @sql_dimcustomerMatchkey  
				+ CASE WHEN @matchkeyGroupIDCounter = 1 THEN '' ELSE CHAR(13) + 'UNION'+ CHAR(13) END 
				+ ' SELECT DISTINCT' + CHAR(13) 
				+ '		a.DimCustomerID' + CHAR(13) 
				+ '		, ' + CAST(@matchkeyID AS VARCHAR(5)) + ' AS MatchkeyID' + CHAR(13) 
				+ '		, CAST(a.' + CASE WHEN ISNULL(@matchkeyHashIdentifier,'') != '' THEN @matchkeyHashIdentifier ELSE @matchkeyBaseTblFieldListTransformed END + ' AS VARCHAR(50)) AS MatchkeyValue' + CHAR(13) 
				+ ' FROM #tmp_ssbid a' + CHAR(13) 
				+ ' INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid b WITH (NOLOCK) ON a.DimCustomerId = b.DimCustomerId' + CHAR(13) 
				+ ' WHERE 1=1' + CHAR(13) 
				+ ' AND ISNULL(a.' + CASE WHEN ISNULL(@matchkeyHashIdentifier,'') != '' THEN @matchkeyHashIdentifier ELSE @matchkeyBaseTblFieldListTransformed END + ','''') != ''''' + CHAR(13) + CHAR(13) 
		END 
 
		------------------------------- 
		-- @sql_dimcustomerssbid_audit 
		------------------------------- 
		SET @sql_dimcustomerssbid_audit = @sql_dimcustomerssbid_audit 
			+ ' TRUNCATE TABLE #tmp_dimcustomerssbid_audit' + CHAR(13) + CHAR(13) 
 
			+ ' ALTER INDEX ALL ON #tmp_dimcustomerssbid_audit DISABLE' + CHAR(13) + CHAR(13) 
		 
			+ ' ;WITH cte AS (' + CHAR(13) 
			+ ' 	SELECT *' + CHAR(13) 
			+ ' 	FROM ' + @ClientDB + 'dbo.DimCustomerMatchkey a WITH (NOLOCK)' + CHAR(13) 
			+ ' 	WHERE a.MatchKeyID = ' + CAST(@matchkeyID AS VARCHAR(5)) + CHAR(13) 
			+ ' )' + CHAR(13) 
			+ ' INSERT INTO #tmp_dimcustomerssbid_audit' + CHAR(13) 
			+ ' SELECT DISTINCT a.DimCustomerID, CAST(a.MatchkeyValue AS VARCHAR(50)) AS MatchkeyValue' + CHAR(13) 
			+ ' FROM cte a' + CHAR(13) + CHAR(13) 
 
			+ ' ALTER INDEX ALL ON #tmp_dimcustomerssbid_audit REBUILD' + CHAR(13) + CHAR(13) 
 
			+ ' ;WITH failed_audit AS (' + CHAR(13) 
			+ '		SELECT a.MatchkeyValue' + CHAR(13) 
			+ '		FROM #tmp_dimcustomerssbid_audit a' + CHAR(13) 
			+ '		INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid b WITH (NOLOCK) ON a.DimCustomerId = b.DimCustomerId' + CHAR(13) 
			+ CASE  
				WHEN @RecognitionType != 'Contact' THEN  
					'AND b.SSB_CRMSYSTEM_PRIMARY_FLAG = 1' + CHAR(13) 
				ELSE '' 
			  END 
			+ '		LEFT JOIN (' + CHAR(13) 
			+ '			SELECT DISTINCT b.dimcustomerid' + CHAR(13) 
			+ '			FROM ' + @ClientDB + 'mdm.forceunmergeids a WITH (NOLOCK)' + CHAR(13) 
			+ '			INNER JOIN #tmp_dimcustomerssbid_audit b ON a.dimcustomerid = b.DimCustomerID' + CHAR(13) 
			+ '		) c ON a.dimcustomerid = c.dimcustomerid' + CHAR(13) 
			+ '		WHERE 1=1' + CHAR(13) 
			+ '		AND c.dimcustomerid IS NULL' + CHAR(13) 
			+ '		GROUP BY a.MatchkeyValue' + CHAR(13) 
			+ '		HAVING COUNT(DISTINCT ' + @ssb_crmsystem_id_field + ') > 1' + CHAR(13)  
			+ ' )' + CHAR(13) 
			--+ ' DELETE c' + CHAR(13) 
			+ ' SELECT *' + CHAR(13) 
			+ ' FROM failed_audit a' + CHAR(13) 
			+ ' INNER JOIN #tmp_dimcustomerssbid_audit b ON a.MatchkeyValue = b.MatchkeyValue' + CHAR(13) 
			+ ' INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid c WITH (NOLOCK) ON b.DimCustomerID = c.DimCustomerId' + CHAR(13) + CHAR(13) 
 
			+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
			+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Audit ' + @matchkeyName + ' - DimCustomerSSBID'', @@ROWCOUNT);' + CHAR(13) + CHAR(13)	 
	 
		--SET @matchkeyBaseTblFieldListAll = @matchkeyBaseTblFieldListAll + ', ' + @matchkeyBaseTblFieldListTransformed 
 
		SET @matchkeyGroupIDCounter = @matchkeyGroupIDCounter + 1 
	END 
 
	INSERT INTO #baseTblFields (FieldName) 
	SELECT FieldName 
	FROM ( 
		 SELECT DISTINCT 
			 Split.a.value('.', 'VARCHAR(100)') AS FieldName   
		 FROM (	 
			 SELECT CAST ('<M>' + REPLACE(MatchkeyBaseTblFieldList, '||', '</M><M>') + '</M>' AS XML) AS Data   
			 FROM #matchkeyConfig WHERE Active = 1 
		) AS A CROSS APPLY Data.nodes ('/M') AS Split(a) 
	 ) a 
	 WHERE ISNULL(a.FieldName,'') != '' 
 
	 ----SELECT * FROM #baseTblFields 
	 
	SELECT DISTINCT @matchkeyBaseTblFieldListDistinct = REPLACE(REPLACE(REPLACE(STUFF((SELECT DISTINCT ',a.' + LTRIM(RTRIM(a.FieldName)) 
	FROM #baseTblFields a  
	FOR XML PATH('')),1,1,''),CHAR(13),''),CHAR(10),''),CHAR(9),'')  
 
	SET @matchkeyBaseTblFieldListDistinct_NO_ALIAS = REPLACE(REPLACE(@matchkeyBaseTblFieldListDistinct, 'a.',''),' ','') 
	----SELECT @matchkeyBaseTblFieldListDistinct 
 
	SET @counter = (SELECT MIN(ID) FROM #fieldTransformationsAll) 
	WHILE @counter <= (SELECT MAX(ID) FROM #fieldTransformationsAll) 
	BEGIN 
		SELECT @fieldName = LTRIM(RTRIM(FieldName)), @tranformation = Transformation 
		FROM #fieldTransformationsAll WHERE ID = @counter 
 
		IF ISNULL(@fieldName,'') != '' 
			SET @matchkeyBaseTblFieldListDistinct = REPLACE(@matchkeyBaseTblFieldListDistinct, 'a.'+@fieldName, @fieldName + ' = ' + REPLACE(@tranformation, @fieldName, 'a.'+@fieldName)) 
 
		SET @counter = @counter + 1 
	END 
 
	--SELECT * FROM #fieldTransformations--All 
 
	SET @sql_tmp_contactmatch_data_post = @sql_tmp_contactmatch_data_post 
		+ ' IF OBJECT_ID(''tempdb..#tmp_dimcustomer'') IS NOT NULL' + CHAR(13) 
		+ ' 	DROP TABLE #tmp_dimcustomer' + CHAR(13) + CHAR(13) 
 
		+ ' SELECT DISTINCT a.dimcustomerid' + CHAR(13) 
		+ ' INTO #tmp_dimcustomer' + CHAR(13) 
		+ CASE  
			WHEN @RecognitionType = 'Contact' THEN  
				' FROM #Tmp_' + @RecognitionType + 's b' + CHAR(13) 
				+ ' INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid c WITH (NOLOCK) ON b.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID' + CHAR(13) 
				+ ' INNER JOIN ' + @ClientDB + @matchkeyBaseTbl + ' a WITH (NOLOCK) ON c.DimCustomerId = a.DimCustomerId' + CHAR(13) 
				+ ' LEFT JOIN #tmp_contactmatch_data d ON a.dimcustomerid = d.dimcustomerid' + CHAR(13) 
				+ ' WHERE d.dimcustomerid is NULL' + CHAR(13) 
				+ CASE WHEN @IsDeletedExists = 1 THEN ' AND ISNULL(a.IsDeleted,0) = 0' + CHAR(13) ELSE '' END + CHAR(13) 
			ELSE 
				' FROM #Tmp_' + @RecognitionType + 's b' + CHAR(13) 
				+ ' INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid c WITH (NOLOCK) ON b.SSB_CRMSYSTEM_ACCT_ID = c.SSB_CRMSYSTEM_ACCT_ID' + CHAR(13) 
				+ '		AND c.SSB_CRMSYSTEM_PRIMARY_FLAG = 1' + CHAR(13) 
				+ ' INNER JOIN ' + @ClientDB + @matchkeyBaseTbl + ' a WITH (NOLOCK) ON c.DimCustomerId = a.DimCustomerId' + CHAR(13) 
				+ ' LEFT JOIN #tmp_contactmatch_data d ON a.dimcustomerid = d.dimcustomerid' + CHAR(13) 
				+ ' WHERE d.dimcustomerid is NULL' + CHAR(13) 
				+ CASE WHEN @IsDeletedExists = 1 THEN ' AND ISNULL(a.IsDeleted,0) = 0' + CHAR(13) ELSE '' END + CHAR(13) 
			END + CHAR(13)             
 
		+ ' CREATE NONCLUSTERED INDEX ix_tmp_dimcustomer ON #tmp_dimcustomer (DimCustomerId)' + CHAR(13) + CHAR(13) 
 
		+ ' INSERT INTO #tmp_contactmatch_data (dimcustomerid, ssid, sourcesystem, ' + @matchkeyBaseTblFieldListDistinct_NO_ALIAS + ')' + CHAR(13) 
		+ ' SELECT a.dimcustomerid, a.ssid, a.sourcesystem, ' +  @matchkeyBaseTblFieldListDistinct + CHAR(13) 
		+ ' FROM #tmp_dimcustomer b' + CHAR(13) 
		+ ' INNER JOIN ' + @ClientDB + @matchkeyBaseTbl + ' a WITH (NOLOCK) ON b.DimCustomerId = a.DimCustomerId' + CHAR(13) + CHAR(13) 
           
		+ ' SELECT @rowCount_contactMatch_post = @rowCount_contactMatch_post + @@ROWCOUNT' + CHAR(13) + CHAR(13) 
 
	SET @sql_tmp_contactmatch_data_pre = REPLACE(@sql_tmp_contactmatch_data_pre, '@matchkeyBaseTblFieldListDistinct_NO_ALIAS', @matchkeyBaseTblFieldListDistinct_NO_ALIAS) + CHAR(13) 
	SET @sql_tmp_contactmatch_data_pre = REPLACE(@sql_tmp_contactmatch_data_pre, '@matchkeyBaseTblFieldListDistinct', REPLACE(@matchkeyBaseTblFieldListDistinct, 'a.', 'b.')) + CHAR(13) 
	SET @sql_loop_1 = REPLACE(@sql_loop_1, '@matchkeyBaseTblFieldListDistinct_NO_ALIAS', @matchkeyBaseTblFieldListDistinct_NO_ALIAS) + CHAR(13) 
	SET @sql_loop_1 = REPLACE(@sql_loop_1, '@matchkeyBaseTblFieldListDistinct', @matchkeyBaseTblFieldListDistinct) + CHAR(13) 
	 
 
	SET @matcheyBaseTblCounter = @matcheyBaseTblCounter + 1 
 
END 
 
----SELECT @preSql_part2, @preSql_part3  
SET @sql = @preSql_part3 
 
--------------------------------- 
-- @sql_compositeTbl_insert 
--------------------------------- 
 
IF ISNULL(@sql_compositeTbl_insert,'') != '' 
BEGIN 
	SET @preSql_part3 = ' INSERT INTO ' + @ClientDB + 'mdm.Composite' + @RecognitionType + 's (' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END 
	SELECT @preSql_part3 = @preSql_part3 
		+ ' , ' + a.MatchkeyHashIdentifier 
	--SELECT a.MatchkeyHashIdentifier 
	FROM #matchkeyConfig a 
	INNER JOIN #compositeTblFields b ON a.MatchkeyHashIdentifier = b.COLUMN_NAME 
	WHERE 1=1 
	AND MatchkeyHashIdentifier IS NOT NULL 
	AND a.Active = 1 
	ORDER BY a.MatchkeyID 
 
	SELECT @preSql_part3 = @preSql_part3 
		+ ' )' + CHAR(13) 
		+ ' SELECT DISTINCT ' + CHAR(13) 
		+ ' a.' + a.MatchkeyHashIdentifier + ' as ' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END + CHAR(13) 
	FROM #matchkeyConfig a 
	INNER JOIN #compositeTblFields b ON a.MatchkeyHashIdentifier = b.COLUMN_NAME 
	WHERE 1=1 
	AND b.ID = 1 
	AND MatchkeyHashIdentifier IS NOT NULL 
	AND a.Active = 1 
	ORDER BY a.MatchkeyID	 
 
	SELECT @preSql_part3 = @preSql_part3 
		+ ' , a.' + a.MatchkeyHashIdentifier 
	--SELECT a.MatchkeyHashIdentifier 
	FROM #matchkeyConfig a 
	INNER JOIN #compositeTblFields b ON a.MatchkeyHashIdentifier = b.COLUMN_NAME 
	WHERE 1=1 
	AND MatchkeyHashIdentifier IS NOT NULL 
	AND a.Active = 1 
	ORDER BY a.MatchkeyID		 
 
	SET @preSql_part3 = @preSql_part3 + CHAR(13) 
		+ ' FROM #tmp_ssbid a' + CHAR(13)  
		+ ' LEFT JOIN ' + @ClientDB + 'mdm.composite' + @RecognitionType + 's b WITH (NOLOCK) ON' 
 
	SELECT @preSql_part3 = @preSql_part3 
		+ CASE WHEN b.MatchkeyID != (SELECT MIN(MatchkeyID) FROM #compositeTblFields) THEN ' AND' ELSE '' END + ' a.' + a.MatchkeyHashIdentifier + ' = b.' + a.MatchkeyHashIdentifier 
	--SELECT *--a.MatchkeyHashIdentifier 
	FROM #matchkeyConfig a 
	INNER JOIN #compositeTblFields b ON a.MatchkeyHashIdentifier = b.COLUMN_NAME 
	WHERE 1=1 
	AND MatchkeyHashIdentifier IS NOT NULL 
	AND a.Active = 1 
	ORDER BY a.MatchkeyID		 
 
	SET @preSql_part3 = @preSql_part3 + CHAR(13) 
		+ ' WHERE b.' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END + ' IS NULL' + CHAR(13) 
		 
	SELECT @preSql_part3 = @preSql_part3 
		+ ' AND a.' + a.MatchkeyHashIdentifier + ' IS NOT NULL' 
	--SELECT a.MatchkeyHashIdentifier 
	FROM #matchkeyConfig a 
	INNER JOIN #compositeTblFields b ON a.MatchkeyHashIdentifier = b.COLUMN_NAME 
	WHERE 1=1 
	AND MatchkeyHashIdentifier IS NOT NULL 
	AND a.Active = 1 
	ORDER BY a.MatchkeyID		 
 
	SET @preSql_part3 = @preSql_part3 + CHAR(13) + CHAR(13) 
		+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
		+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Insert Composite ' + @RecognitionType + 's - ALL'', @@ROWCOUNT);' + CHAR(13) + CHAR(13)	 
 
	SET @sql_compositeTbl_insert = @preSql_part3 + @sql_compositeTbl_insert 
END 
 
--------------------------------- 
-- @sql_tmp_ssbid_update_2 
--------------------------------- 
 
IF ISNULL(@sql_tmp_ssbid_update_2,'') != '' 
BEGIN 
	SET @preSql_part3 = 
		' UPDATE a' + CHAR(13) 
		+ ' SET composite_id = b.' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END + CHAR(13) 
		+ '		,updateddate = current_timestamp' + CHAR(13) 
		+ '		,updatedby = ''CI''' + CHAR(13) 
		+ ' FROM #tmp_ssbid a' + CHAR(13) 
		+ ' INNER JOIN ' + @ClientDB + 'mdm.composite' + @RecognitionType + 's b WITH (NOLOCK) ON' 
 
	SELECT @preSql_part3 = @preSql_part3 
		+ CASE WHEN b.MatchkeyID != (SELECT MIN(MatchkeyID) FROM #compositeTblFields) THEN ' AND' ELSE '' END + ' a.' + a.MatchkeyHashIdentifier + ' = b.' + a.MatchkeyHashIdentifier 
	--SELECT *--a.MatchkeyHashIdentifier 
	FROM #matchkeyConfig a 
	INNER JOIN #compositeTblFields b ON a.MatchkeyHashIdentifier = b.COLUMN_NAME 
	WHERE 1=1 
	AND MatchkeyHashIdentifier IS NOT NULL 
	AND a.Active = 1 
	ORDER BY a.MatchkeyID		 
 
	SET @preSql_part3 = @preSql_part3 + CHAR(13) 
		+ ' WHERE 1=1' + CHAR(13) 
		+ ' AND (a.composite_id is null or a.composite_id != b.' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END + ')' + CHAR(13) 
		 
	SELECT @preSql_part3 = @preSql_part3 
		+ ' AND a.' + a.MatchkeyHashIdentifier + ' IS NOT NULL' 
	--SELECT a.MatchkeyHashIdentifier 
	FROM #matchkeyConfig a 
	INNER JOIN #compositeTblFields b ON a.MatchkeyHashIdentifier = b.COLUMN_NAME 
	WHERE 1=1 
	AND MatchkeyHashIdentifier IS NOT NULL 
	AND a.Active = 1 
	ORDER BY a.MatchkeyID		 
 
	SET @preSql_part3 = @preSql_part3 + CHAR(13) + CHAR(13) 
		+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
		+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Assign Composite ID - ALL'', @@ROWCOUNT);' + CHAR(13) + CHAR(13)	 
 
	SET @sql_tmp_ssbid_update_2 = @preSql_part3 + @sql_tmp_ssbid_update_2 
END 
 
 
TRUNCATE TABLE #baseTblFields 
 
INSERT INTO #baseTblFields (FieldName) 
SELECT FieldName 
FROM ( 
		SELECT DISTINCT 
			Split.a.value('.', 'VARCHAR(100)') AS FieldName   
		FROM (	 
			SELECT CAST ('<M>' + REPLACE(CASE WHEN ISNULL(MatchkeyHashIdentifier,'') != '' THEN MatchkeyHashIdentifier ELSE MatchkeyBaseTblFieldList END, '||', '</M><M>') + '</M>' AS XML) AS Data   
			FROM #matchkeyConfig WHERE Active = 1 
	) AS A CROSS APPLY Data.nodes ('/M') AS Split(a) 
) a 
WHERE ISNULL(a.FieldName,'') != '' 
 
SET @matchkeyBaseTblFieldListDistinct =  '' 
SELECT DISTINCT @matchkeyBaseTblFieldListDistinct = REPLACE(REPLACE(REPLACE(STUFF((SELECT ',' + a.FieldName 
FROM #baseTblFields a  
WHERE 1=1 
AND a.FieldName = FieldName 
FOR XML PATH('')),1,1,''),CHAR(13),''),CHAR(10),''),CHAR(9),'') --AS FieldList 
FROM #baseTblFields 
GROUP BY FieldName 
 
 
----SELECT @matchkeyBaseTblFieldListDistinct 
 
SET @sql_tmp_ssbid_update_2 = @sql_tmp_ssbid_update_2	 
	+ ' UPDATE #tmp_ssbid' + CHAR(13) 
	+ ' SET composite_id = NEWID()' + CHAR(13) 
	+ ' WHERE Composite_ID IS NULL ' + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Assign Composite ID - NO IDs'', @@ROWCOUNT);' + CHAR(13) + CHAR(13)	 
 
 
----------------------------------- 
-- @sql_dimcustomerMatchkey 
----------------------------------- 
SET @sql_dimcustomerMatchkey =  
	'INSERT INTO #dimcustomerMatchkey (DimCustomerID, MatchkeyID, MatchkeyValue)' + CHAR(13) 
	+ @sql_dimcustomerMatchkey + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''#dimcustomerMatchkey'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
 
	+ CASE WHEN @FullRefresh != 1 THEN  
		' INSERT INTO #invalid_matchkey' + CHAR(13) 
		+ ' SELECT a.*' + CHAR(13) 
		+ ' FROM (' + CHAR(13) 
		+ ' 	SELECT DISTINCT a.DimCustomerId, b.MatchkeyID, a.SSB_CRMSYSTEM_PRIMARY_FLAG' + CHAR(13) 
		+ ' 	FROM (' + CHAR(13) 
		+ ' 		SELECT DISTINCT d.DimCustomerId, d.SSB_CRMSYSTEM_PRIMARY_FLAG' + CHAR(13) 
		+ ' 		FROM #tmp_workingset a' + CHAR(13) 
		+ ' 		LEFT JOIN #tmp_ssbid b ON a.DimCustomerId = b.DimCustomerId' + CHAR(13) 
		+ ' 		INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid c WITH (NOLOCK) ON a.DimCustomerId = c.DimCustomerId' + CHAR(13) 
		+ ' 		INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid d WITH (NOLOCK) ON c.SSB_CRMSYSTEM_CONTACT_ID = d.SSB_CRMSYSTEM_CONTACT_ID' + CHAR(13) 
		+ '			WHERE 1=1' + CHAR(13) 
		+ ' 		AND (b.DimCustomerId IS NULL' + CASE WHEN @RecognitionType != 'Contact' THEN ' OR ISNULL(d.SSB_CRMSYSTEM_PRIMARY_FLAG,0) = 0)' ELSE ')' END + CHAR(13) 
		--+ ' 		AND d.SSB_CRMSYSTEM_ACCT_ID IS NOT NULL' + CHAR(13) 
		+ ' 	) a, (SELECT DISTINCT MatchkeyID FROM #dimcustomerMatchkey) b' + CHAR(13) 
		+ ' ) a' + CHAR(13) 
		+ ' LEFT JOIN #invalid_matchkey b ON a.DimCustomerId = b.DimCustomerId' + CHAR(13) 
		+ ' 	AND a.MatchkeyID = b.MatchkeyID' + CHAR(13) 
		+ ' WHERE 1=1' + CHAR(13) 
		+ ' AND b.DimCustomerID IS NULL' + CHAR(13) + CHAR(13) 
 
		+ ' UPDATE b' + CHAR(13) 
		+ ' SET b.' + @ssb_crmsystem_id_field + ' = NULL' + CHAR(13) 
		+ ' FROM #invalid_matchkey a' + CHAR(13) 
		+ ' INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid b WITH (NOLOCK) ON a.DimCustomerID = b.DimCustomerID' + CHAR(13) 
		+ ' WHERE ISNULL(a.SSB_CRMSYSTEM_PRIMARY_FLAG,0) != 0 ' + CHAR(13) + CHAR(13) 
 
		+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
		+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Update DimcustomerSSBID - wipe ' + @ssb_crmsystem_id_field + ''', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
	ELSE '' 
	END 
 
----------------------------------- 
-- @sql_dimcustomerssbid_audit 
----------------------------------- 
SET @sql_dimcustomerssbid_audit = @sql_dimcustomerssbid_audit 
	+ ' SELECT DISTINCT a.DimCustomerId' + CHAR(13) 
	+ ' FROM ' + @ClientDB + 'dbo.dimcustomer a WITH (NOLOCK)' + CHAR(13)  
	+ ' LEFT JOIN ' + @ClientDB + 'dbo.dimcustomerssbid b WITH (NOLOCK) ON a.dimcustomerid = b.DimCustomerId' + CHAR(13) 
	+ ' WHERE a.IsDeleted = 0' + CHAR(13) 
	+ ' AND b.DimCustomerId IS NULL AND a.NameIsCleanStatus != ''Dirty''' + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Audit DimCustomer - DimCustomerSSBID'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
	 
		 
 
--SELECT @sql_tmp_workingset, @sql_tmp_contactmatch_data_pre, @sql_loop_1, @sql_tmp_contactmatch_data_post 
--	, @sql_tmp_ssbid_fields, @sql_tmp_ssbid_join, @sql_compositeTbl_insert, @sql_dimcustomerMatchkey, @sql_tmp_ssbid_update_2 
--	, @sql_loop_2, @sql_tmp_ssbid_audit, @sql_dimcustomerssbid_audit 
 
SET @sql_tmp_cdio_changes = @sql_tmp_cdio_changes 
	+ CASE  
		WHEN @FullRefresh = 1 THEN 
			' INSERT INTO #tmp_cdio_changes' + CHAR(13)  
			+ ' SELECT DISTINCT a.SSB_CRMSYSTEM_ACCT_ID, a.SSB_CRMSYSTEM_CONTACT_ID' + CHAR(13) 
			+ ' FROM ' + @ClientDB + 'dbo.dimcustomerssbid a WITH (NOLOCK)' + CHAR(13) 
			+ ' INNER JOIN ' + @ClientDB + @matchkeyBaseTbl + ' b WITH (NOLOCK) ON b.DimCustomerId = a.DimCustomerId' + CHAR(13) 
			+ ' LEFT JOIN #tmp_cdio_changes c on ISNULL(a.SSB_CRMSYSTEM_ACCT_ID,'''') = ISNULL(c.SSB_CRMSYSTEM_ACCT_ID,'''')' + CHAR(13) 
			+ '		AND ISNULL(a.SSB_CRMSYSTEM_CONTACT_ID,'''') = ISNULL(c.SSB_CRMSYSTEM_CONTACT_ID,'''')' + CHAR(13) 
			+ ' WHERE 1=1' + CHAR(13) 
			--+ CASE  
			--	WHEN @RecognitionType = 'Account' THEN ' AND (' + REPLACE(@sql_tmp1, 'IsDeleted','b.IsDeleted')+ ')' + CHAR(13)  
			--	ELSE '' 
			--  END 
			--+ ' AND a.' + @ssb_crmsystem_id_field + ' IS NOT NULL' + CHAR(13) + CHAR(13) 
			+ ' AND c.' + @ssb_crmsystem_id_field + ' IS NULL' 
		ELSE 
			' INSERT INTO #tmp_cdio_changes' + CHAR(13) 
			+ ' SELECT SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID' + CHAR(13) 
			+ ' FROM ' + @ClientDB + 'dbo.dimcustomerssbid b WITH (NOLOCK)' + CHAR(13) 
			+ ' INNER JOIN ' + @ClientDB + 'dbo.DimCustomer a WITH (NOLOCK) ON b.dimcustomerid = a.dimcustomerid' + CHAR(13) 
			+ ' WHERE a.matchkey_updatedate >= ISNULL(ISNULL((SELECT MAX(logdate) FROM ' + @ClientDB  +'mdm.auditlog WHERE mdm_process = ''SSB ' + @RecognitionType + ''' AND process_step = ''customer_matchkey changes'' AND logdate < (SELECT MAX(logdate) FROM ' + @ClientDB + 'mdm.auditlog WHERE mdm_process = ''SSB ' + @RecognitionType + ''' AND process_step = ''Audit DimCustomer - DimCustomerSSBID'')), (SELECT MAX(logdate) FROM ' + @ClientDB  +'mdm.auditlog WHERE mdm_process = ''SSB ' + @RecognitionType + ''' AND logdate < (SELECT MAX(logdate) FROM ' + @ClientDB + 'mdm.auditlog WHERE process_step = ''Audit DimCustomer - DimCustomerSSBID''))), a.matchkey_updatedate)' + CHAR(13) + CHAR(13) 
			 
			+ ' SELECT @rowCount_matchkeyChanges = @rowCount_matchkeyChanges + @@ROWCOUNT' 
		END + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' values (current_timestamp, ''SSB ' + @RecognitionType + ''', ''customer_matchkey changes'', @rowCount_matchkeyChanges);' + CHAR(13) + CHAR(13) 
	 
 
SET @sql_tmp_workingset = @sql_tmp_workingset 
	+ ' INSERT INTO #tmp_workingset' + CHAR(13)  
	+ ' SELECT DISTINCT a.DimCustomerId' + CHAR(13) 
	+ ' FROM ' + @ClientDB + 'dbo.DimCustomer a WITH (NOLOCK)' + CHAR(13) 
	+ ' INNER JOIN ' + @ClientDB + 'dbo.CleanDataOutput cdio WITH (NOLOCK) on cdio.sourcecontactid = a.ssid' + CHAR(13)  
	+ ' 	AND cdio.Input_SourceSystem = a.SourceSystem' + CHAR(13) 
	+ ' LEFT JOIN #tmp_workingset b on a.DimCustomerId = b.DimCustomerId' + CHAR(13) 
	+ CASE  
		WHEN @RecognitionType = 'Account' THEN  
		' INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid ssbid WITH (NOLOCK) ON a.DimCustomerId = ssbid.DimCustomerId ' + CHAR(13) 
		+ '	AND SSB_CRMSYSTEM_PRIMARY_FLAG = 1' + CHAR(13) 
		ELSE ''  
	  END 
	+ ' WHERE 1=1' + CHAR(13) 
	+ ' AND b.DimCustomerId IS NULL' + CHAR(13) + CHAR(13) 
 
 
	+ ' SELECT @rowCount_workingset = @rowCount_workingset + @@ROWCOUNT' + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''tmp_workingset - add new'', @rowCount_workingset);' + CHAR(13) + CHAR(13) 
 
 
-- RESET SSB_CRMSYSTEM_CONTACT_ID/SSB_CRMSYSTEM_ACCT_ID TO NULL 
SET @sql_wipe_ssbid = @sql_wipe_ssbid 
	+ CASE  
		WHEN @FullRefresh = 1 THEN 
			' ;WITH wipe_ssbid AS (' + CHAR(13) 
			+ ' 	SELECT DISTINCT a.DimCustomerId, b.IsDeleted' + CHAR(13) 
			+ ' 	FROM ' + @ClientDB + 'dbo.dimcustomerssbid a WITH (NOLOCK)' + CHAR(13) 
			+ '		INNER JOIN ' + @ClientDB + 'dbo.DimCustomer b WITH (NOLOCK) on a.DimCustomerId = b.DimCustomerId' 
			+ ' 	LEFT JOIN #tmp_ssbid c ON b.DimCustomerId = c.DimCustomerId' + CHAR(13) 
			+ ' 	WHERE 1=1' + CHAR(13) 
			+ '		AND c.DimCustomerId IS NULL' 
			+ '		AND ISNULL(b.IsDeleted,0) = 0' 
			+ ' )' + CHAR(13) 
			+ ' UPDATE b' + CHAR(13) 
			+ ' SET b.' + @ssb_crmsystem_id_field + ' = CASE WHEN ISNULL(a.IsDeleted,0) = 1 THEN b.' + @ssb_crmsystem_id_field + ' ELSE NULL END' + CHAR(13) 
			--+ '		,b.IsDeleted = a.IsDeleted' + CHAR(13) 
			--+ '		,b.UpdatedDate = current_timestamp' + CHAR(13) 
			+ ' FROM wipe_ssbid a' + CHAR(13) 
			+ ' INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid b ON a.DimCustomerId = b.DimCustomerId' + CHAR(13) 
		--	+ ' INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid c ON b.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID' + CHAR(13) 
			+ ' WHERE 1=1' + CHAR(13) 
			+ ' AND ISNULL(b.' + @ssb_crmsystem_id_field + ','''') != ''''' 
	   
			+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
			+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Update DimcustomerSSBID - wipe ' + @ssb_crmsystem_id_field + ' (Full Refresh)'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
		ELSE '' 
	  END + CHAR(13) + CHAR(13) 
 
SET @sql = @sql 
	 
	+ @sql_tmp_cdio_changes 
 
	+ ' INSERT INTO #tmp_cdio_changes' + CHAR(13)  
	+ ' SELECT DISTINCT b.SSB_CRMSYSTEM_ACCT_ID, b.SSB_CRMSYSTEM_CONTACT_ID' + CHAR(13) 
	+ ' FROM ' + @ClientDB + 'dbo.dimcustomerssbid b WITH (NOLOCK)' + CHAR(13) 
	+ ' INNER JOIN ' + @ClientDB + 'dbo.CleanDataOutput cdio WITH (NOLOCK) on cdio.sourcecontactid = b.ssid' + CHAR(13)  
	+ ' 	AND cdio.Input_SourceSystem = b.SourceSystem' + CHAR(13) 
	+ ' LEFT JOIN #tmp_cdio_changes c on ISNULL(b.SSB_CRMSYSTEM_ACCT_ID,'''') = ISNULL(c.SSB_CRMSYSTEM_ACCT_ID,'''')' + CHAR(13) 
	+ '		AND ISNULL(b.SSB_CRMSYSTEM_CONTACT_ID,'''') = ISNULL(c.SSB_CRMSYSTEM_CONTACT_ID,'''')' + CHAR(13) 
	+ ' WHERE 1=1' + CHAR(13) 
	--+ ' AND b.' + @ssb_crmsystem_id_field + ' IS NOT NULL' + CHAR(13) + CHAR(13) 
	+ ' AND c.' + @ssb_crmsystem_id_field + ' IS NULL' + CHAR(13) + CHAR(13) 
 
	+ ' SELECT @rowCount_cdioChanges = @rowCount_cdioChanges + @@ROWCOUNT' + CHAR(13) + CHAR(13) 
	 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''tmp_cdio_changes'', @rowCount_cdioChanges);' + CHAR(13) + CHAR(13) 
 
	+ CASE  
		WHEN @RecognitionType = 'Contact' THEN 
			+ ' INSERT INTO #tmp_workingset' + CHAR(13) 
			+ ' SELECT DISTINCT dimcustomerid' + CHAR(13) 
			+ ' FROM ' + @ClientDB + 'dbo.dimcustomerssbid a WITH (NOLOCK)' + CHAR(13) 
			+ ' INNER JOIN #tmp_cdio_changes b ON ISNULL(a.SSB_CRMSYSTEM_CONTACT_ID,'''') = ISNULL(b.SSB_CRMSYSTEM_CONTACT_ID,'''')' + CHAR(13) 
		 WHEN @RecognitionType = 'Account' THEN  
			+ ' INSERT INTO #tmp_workingset' + CHAR(13) 
			+ ' SELECT DISTINCT b.DimCustomerId' + CHAR(13) 
			+ ' FROM #tmp_cdio_changes a' + CHAR(13) 
			+ ' INNER JOIN ' + @ClientDB + 'dbo.dimcustomerssbid b WITH (NOLOCK) ON a.SSB_CRMSYSTEM_CONTACT_ID = b.SSB_CRMSYSTEM_CONTACT_ID' + CHAR(13) 
			+ ' INNER JOIN ' + @ClientDB + 'dbo.DimCustomer c WITH (NOLOCK) ON b.DimCustomerId = c.DimCustomerId' + CHAR(13) 
			+ ' WHERE b.SSB_CRMSYSTEM_PRIMARY_FLAG = 1' + CHAR(13)  
		ELSE ''  
	  END + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''tmp_workingset'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
 
	+ @sql_tmp_workingset 
 
	+ @sql_tmp_contactmatch_data_pre 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''tmp_contactmatch_data'', @rowCount_contactMatch_pre);' + CHAR(13) + CHAR(13) 
 
	+ ' CREATE NONCLUSTERED INDEX ix_tmp_contactmatch_data_dimcustomerid ON #tmp_contactmatch_data (DimCustomerId)' + CHAR(13) 
 
	+ ' DECLARE @ADDED_COUNT INT = 1' + CHAR(13) 
	+ ' DECLARE @results INT = 0' + CHAR(13) 
	+ ' WHILE @Added_Count > 0' + CHAR(13) 
	+ ' BEGIN' + CHAR(13) 
	+ '		SET @Added_Count = 0' + CHAR(13) + CHAR(13) 
	+ @sql_loop_1 
	+ ' END' + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO #tmp_' + @RecognitionType + 's' + CHAR(13) 
	+ ' SELECT DISTINCT b.' + @ssb_crmsystem_id_field + CHAR(13) 
	+ ' FROM #tmp_contactmatch_data a' + CHAR(13) 
	+ ' INNER JOIN '+ @ClientDB + 'dbo.dimcustomerssbid b WITH (NOLOCK) ON a.dimcustomerid = b.DimCustomerId' + CHAR(13) + CHAR(13) 
	--+ ' AND a.IsPrimary = 1' + CHAR(13) + CHAR(13) 
 
	+ @sql_tmp_contactmatch_data_post 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Contact Match Records'', @rowCount_contactMatch_post);' + CHAR(13) + CHAR(13) 
 
	+ @sql_hashTbl_update 
 
	+ ' SELECT DISTINCT' + CHAR(13) 
	--+ '		cdio.IsPrimary' 
	+ ' 	cdio.dimcustomerid' + CHAR(13) 
	+ ' 	,cdio.ssid' + CHAR(13) 
	+ ' 	,cdio.sourcesystem' + CHAR(13) 
	+ '		' + @sql_tmp_ssbid_fields 
	+ ' 	, ssbid.Composite_ID AS composite_id' + CHAR(13) 
	+ ' 	, ' + CASE WHEN @RecognitionType = 'Account' THEN 'CAST(NULL AS VARCHAR(50)) AS SSB_CRMSYSTEM_ACCT_ID' ELSE 'ssbid.SSB_CRMSYSTEM_ACCT_ID' END + CHAR(13) 
	+ ' 	, ' + CASE WHEN @RecognitionType = 'Contact' THEN 'CAST(NULL AS VARCHAR(50)) AS SSB_CRMSYSTEM_CONTACT_ID' ELSE 'ssbid.SSB_CRMSYSTEM_CONTACT_ID' END + CHAR(13) 
	+ ' 	,''CI'' as createdby' + CHAR(13) 
	+ ' 	,''CI'' as updatedby' + CHAR(13) 
	+ ' 	,current_timestamp as createddate' + CHAR(13) 
	+ ' 	,current_timestamp as updateddate' + CHAR(13) 
	+ ' INTO #tmp_ssbid' + CHAR(13) 
	+ ' from #Tmp_Contactmatch_data cdio' + CHAR(13) 
	+ CASE WHEN @RecognitionType = 'Contact' THEN ' LEFT ' ELSE ' INNER ' END + 'JOIN ' + @ClientDB + 'dbo.dimcustomerssbid ssbid WITH (NOLOCK) ON cdio.dimcustomerid = ssbid.dimcustomerid' + CHAR(13) 
	+ @sql_tmp_ssbid_join + CHAR(13) + CHAR(13) 
	 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Insert New'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
 
	+ ' CREATE NONCLUSTERED INDEX ix_tmp_ssbid_dimcustomerid ON #tmp_ssbid (DimCustomerId)' + CHAR(13) + CHAR(13) 
 
	+ @sql_wipe_ssbid 
 
	---- Downstream bucketting 
 
	+ ' SELECT cdio.dimcustomerid, ' + @ssb_crmsystem_id_field + CHAR(13) 
	+ ' INTO #tmp_db' + CHAR(13) 
	+ ' from #Tmp_Contactmatch_data cdio' + CHAR(13) 
	+ ' LEFT JOIN ' + @ClientDB + 'dbo.dimcustomerssbid ssbid WITH (NOLOCK)' + CHAR(13) 
	+ ' ON cdio.dimcustomerid = ssbid.dimcustomerid;' + CHAR(13) 
	 
	+ ' IF OBJECT_ID(''tempdb..#tmp_compositeid'') IS NOT NULL' + CHAR(13) 
	+ ' 	DROP TABLE #tmp_compositeid' + CHAR(13) 
 
	+ ' SELECT DISTINCT a.composite_id' + CHAR(13) 
	+ ' INTO #tmp_compositeid' + CHAR(13) 
	+ ' FROM #tmp_ssbid a' + CHAR(13) + CHAR(13) 
 
	+ ' CREATE CLUSTERED INDEX ix_compositeid ON #tmp_compositeid (composite_id)' + CHAR(13) + CHAR(13) 
 
	+ ' IF (SELECT COUNT(0) FROM #tmp_compositeid) > 10000' + CHAR(13) 
	+ ' BEGIN' 
	+ '		EXEC ' + @ClientDB + 'dbo.sp_EnableDisableIndexes @Enable = 0, -- int' + CHAR(13) 
	+ '			@TableName = ''mdm.Composite' + @RecognitionType + 's'', -- varchar(500)' + CHAR(13) 
	+ '			@ViewCurrentIndexState = 0 -- bit' + CHAR(13) + CHAR(13) 
 
	+ '		INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ '		VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Disable indexes - mdm.composite' + @RecognitionType + 's'', 0);' + CHAR(13) + CHAR(13) 
	+ ' END' + CHAR(13) + CHAR(13) 
 
	+ ' DELETE b' + CHAR(13) 
	+ ' FROM #tmp_compositeid a' + CHAR(13) 
	+ ' INNER JOIN ' + @ClientDB + 'mdm.composite' + @RecognitionType + 's b WITH (NOLOCK) ON a.composite_id = CAST(b.' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END + ' AS VARCHAR(50))' + CHAR(13) + CHAR(13) 
 
	--+ ' DELETE FROM ' + @ClientDB + 'mdm.composite' + @RecognitionType + 's WHERE ' + CASE WHEN @RecognitionType = 'Contact' THEN 'compositecontact_id' ELSE 'SSB_CRMSYSTEM_ACCT_ID' END + ' IN (SELECT DISTINCT composite_id FROM  #tmp_ssbid)' + CHAR(13) + CHAR(13) 
	 
	+ ' CREATE INDEX ix_tmp_ssbid ON #tmp_ssbid(dimcustomerid);' + CHAR(13) + CHAR(13) 
 
	+ @sql_compositeTbl_insert 
	 
	+ ' IF (SELECT COUNT(0) FROM #tmp_compositeid) > 10000' + CHAR(13) 
	+ ' BEGIN' 
	+ '		EXEC ' + @ClientDB + 'dbo.sp_EnableDisableIndexes @Enable = 1, -- int' + CHAR(13) 
	+ '			@TableName = ''mdm.Composite' + @RecognitionType + 's'', -- varchar(500)' + CHAR(13) 
	+ '			@ViewCurrentIndexState = 0 -- bit' + CHAR(13) + CHAR(13) 
 
	+ '		INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ '		VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Enable indexes - mdm.composite' + @RecognitionType + 's'', 0);' + CHAR(13) + CHAR(13) 
	+ ' END' + CHAR(13) + CHAR(13) 
 
	+ @sql_tmp_ssbid_update_1 
 
	+ @sql_tmp_ssbid_update_2 
 
	+ ' IF Object_ID(''tempdb.dbo.#Tmp_matchkey'', ''U'') Is NOT NULL' + CHAR(13) 
	+ '		DROP TABLE #Tmp_matchkey;' + CHAR(13) 
	+ ' IF Object_ID(''tempdb.dbo.#Tmp_match'', ''U'') Is NOT NULL' + CHAR(13) 
	+ '		DROP TABLE #Tmp_match;' + CHAR(13) 
	+ ' IF Object_ID(''tempdb.dbo.#Tmp_composite_cnt'', ''U'') Is NOT NULL' + CHAR(13) 
	+ '		DROP TABLE #tmp_composite_cnt;' + CHAR(13) 
	+ ' IF Object_ID(''tempdb.dbo.#Tmp_Update'', ''U'') Is NOT NULL' + CHAR(13) 
	+ '		DROP TABLE #Tmp_Update;' + CHAR(13) + CHAR(13) 
 
	+ ' CREATE TABLE #Tmp_Matchkey (matchkey VARCHAR(50));' + CHAR(13) 
	+ ' CREATE TABLE #Tmp_Match (matchkey VARCHAR(50), composite_id VARCHAR(50));' + CHAR(13) 
	+ ' CREATE TABLE #tmp_Composite_cnt (composite_id varchar(50), composite_cnt int);' + CHAR(13) 
	+ ' CREATE TABLE #tmp_Update (matchkey VARCHAR(50), composite_id VARCHAR(50));' + CHAR(13) + CHAR(13) 
 
	+ ' DECLARE @records INT = 1' + CHAR(13) 
	+ ' WHILE @records >= 1' + CHAR(13) 
	+ ' BEGIN' + CHAR(13) 
	+ '		INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ '		VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Match Loop'', 0);' + CHAR(13) + CHAR(13) 
	+ '		SET @Records = 0' + CHAR(13) 
	+ @sql_loop_2 
	+ ' END' + CHAR(13) + CHAR(13) 
 
	+ ' UPDATE #tmp_ssbid' + CHAR(13) 
	+ ' SET ' + @ssb_crmsystem_id_field + ' = composite_id' + CHAR(13) 
	+ ' WHERE isnull(composite_id, '''') != isnull(' + @ssb_crmsystem_id_field + ', '''') ' + CHAR(13) 
	+ ' AND composite_id is not null' + CHAR(13)  
	 
IF (@RecognitionType != 'Contact') 
BEGIN 
	SET @sql = @sql 
		+ ' AND (' 
 
	SELECT @sql = @sql + a.Condition 
	FROM ( 
		SELECT DISTINCT *, CASE WHEN ID > 1 THEN ' OR ' ELSE '' END + a.MatchkeyHashIdentifier + ' IS NOT NULL' AS Condition 
		FROM #matchkeyConfig a 
		WHERE a.Active = 1 
	) a 
 
	SET @sql = @sql + ')' + CHAR(13) + CHAR(13) 
END 
 
SET @sql = @sql 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Update SSB ' + @RecognitionType + ' ID'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
 
	+ @sql_tmp_ssbid_audit + CHAR(13) 
 
	+ ' SELECT a.dimcustomerid, a.' + @ssb_crmsystem_id_field + ' old, b.' + @ssb_crmsystem_id_field + ' new' + CHAR(13) 
	+ ' INTO #tmp_changes' + CHAR(13) 
	+ ' FROM #tmp_db a' + CHAR(13) 
	+ ' INNER JOIN #Tmp_ssbid b' + CHAR(13) 
	+ ' ON a.DimCustomerId = b.DimCustomerId' + CHAR(13) 
	+ ' WHERE ISNULL(a.' + @ssb_crmsystem_id_field + ', '''') != ISNULL(b.' + @ssb_crmsystem_id_field + ', '''')' + CHAR(13) 
	+ ' ORDER BY b.SSB_CRMSYSTEM_CONTACT_ID' + CHAR(13) + CHAR(13) 
 
	--+ ' SELECT old, COUNT(DISTINCT new) AS cnt' + CHAR(13) 
	--+ ' INTO #tmp_potential_splits' + CHAR(13) 
	--+ ' FROM #tmp_changes' + CHAR(13) 
	--+ ' WHERE old IS NOT null' + CHAR(13) 
	--+ ' GROUP BY old ' + CHAR(13) 
	--+ ' HAVING COUNT(DISTINCT new) > 1' + CHAR(13) 
 
	--+ ' SELECT new, COUNT(DISTINCT old) AS cnt' + CHAR(13) 
	--+ ' INTO #tmp_potential_merges' + CHAR(13) 
	--+ ' FROM #tmp_changes' + CHAR(13) 
	--+ ' WHERE old IS NOT null' + CHAR(13) 
	--+ ' GROUP BY new' + CHAR(13) 
	--+ ' HAVING COUNT(DISTINCT old) > 1' + CHAR(13) 
 
 
	+ ' -- splits' + CHAR(13) 
	+ ' SELECT a.' + @ssb_crmsystem_id_field + ' AS old, COUNT(DISTINCT b.' + @ssb_crmsystem_id_field + ') AS cnt' + CHAR(13) 
	+ ' INTO #tmp_potential_splits' + CHAR(13) 
	+ ' FROM #tmp_db a' + CHAR(13) 
	+ ' LEFT JOIN #tmp_ssbid b ON a.dimcustomerid = b.DimCustomerId' + CHAR(13) 
	+ ' WHERE 1=1' + CHAR(13) 
	+ ' AND a.' + @ssb_crmsystem_id_field + ' IS NOT NULL' + CHAR(13) 
	+ ' GROUP BY a.' + @ssb_crmsystem_id_field + '' + CHAR(13) 
	+ ' HAVING COUNT(DISTINCT b.' + @ssb_crmsystem_id_field + ') > 1' + CHAR(13) + CHAR(13) 
 
	+ ' -- merges' + CHAR(13) 
	+ ' SELECT b.' + @ssb_crmsystem_id_field + ' AS new, COUNT(DISTINCT a.' + @ssb_crmsystem_id_field + ') AS cnt' + CHAR(13) 
	+ ' INTO #tmp_potential_merges' + CHAR(13) 
	+ ' FROM #tmp_db a' + CHAR(13) 
	+ ' LEFT JOIN #tmp_ssbid b ON a.dimcustomerid = b.DimCustomerId' + CHAR(13) 
	+ ' WHERE 1=1' + CHAR(13) 
	+ ' AND b.' + @ssb_crmsystem_id_field + ' IS NOT NULL' + CHAR(13) 
	+ ' GROUP BY b.' + @ssb_crmsystem_id_field + '' + CHAR(13) 
	+ ' HAVING COUNT(DISTINCT a.' + @ssb_crmsystem_id_field + ') > 1' + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.downstream_bucketting' + CHAR(13) 
	+ ' SELECT DISTINCT a.[new], b.old, ''' + @RecognitionType + ' merge'' AS actiontype, 0 AS processed, CURRENT_TIMESTAMP AS mdm_run_dt, NULL AS processed_dt' + CHAR(13) 
	+ ' FROM #tmp_potential_merges a' + CHAR(13) 
	+ ' INNER JOIN #tmp_changes b' + CHAR(13) 
	+ ' ON a.[new] = b.[new]' + CHAR(13) 
	+ ' WHERE b.old is not null' + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.downstream_bucketting' + CHAR(13) 
	+ ' SELECT DISTINCT b.[new], a.old, ''' + @RecognitionType + ' split'' AS actiontype, 0 AS processed, CURRENT_TIMESTAMP AS mdm_run_dt, NULL AS processed_dt' + CHAR(13) 
	+ ' FROM #tmp_potential_splits a' + CHAR(13) 
	+ ' INNER JOIN #tmp_changes b' + CHAR(13) 
	+ ' ON a.[old] = b.[old]' + CHAR(13) + CHAR(13) 
 
	+ ' IF OBJECT_ID(''' + @ClientDB + 'mdm.tmp_ssbid_' + @RecognitionType + ''') IS NOT NULL' + CHAR(13) 
	+ '		DROP TABLE ' + @ClientDB + 'mdm.tmp_ssbid_' + @RecognitionType + CHAR(13) + CHAR(13) 
 
	+ ' SELECT *' + CHAR(13) 
	+ ' INTO ' + @ClientDB + 'mdm.tmp_ssbid_' + @RecognitionType + CHAR(13) 
	+ ' FROM #tmp_ssbid' + CHAR(13) + CHAR(13) 
 
	+ CASE  
		WHEN @RecognitionType = 'Contact' THEN  
			+ ' UPDATE a' + CHAR(13) 
			+ ' SET ' + @ssb_crmsystem_id_field + ' = b.' + @ssb_crmsystem_id_field + ',' + CHAR(13) 
			+ ' 	UpdatedDate = current_timestamp' + CHAR(13) 
			+ ' FROM ' + @ClientDB + 'dbo.dimcustomerssbid a INNER JOIN #tmp_ssbid b ON a.dimcustomerid = b.dimcustomerid;' + CHAR(13) + CHAR(13) 
		ELSE  
			+ ' UPDATE a' + CHAR(13) 
			+ ' SET SSB_CRMSYSTEM_ACCT_ID = b.SSB_CRMSYSTEM_ACCT_ID,' + CHAR(13) 
			+ ' 	UpdatedDate = current_timestamp' + CHAR(13) 
			+ ' FROM ' + @ClientDB + 'dbo.dimcustomerssbid a INNER JOIN (SELECT DISTINCT SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID FROM #tmp_ssbid) b ON a.SSB_CRMSYSTEM_CONTACT_ID = b.SSB_CRMSYSTEM_CONTACT_ID;' + CHAR(13) + CHAR(13) 
	END 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Update DimcustomerSSBID'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
 
	+ ' SELECT a.dimcustomerid, a.ssid, a.sourcesystem, a.Composite_ID, a.SSB_CRMSYSTEM_ACCT_ID, a.SSB_CRMSYSTEM_CONTACT_ID, a.CreatedBy, a.UpdatedBy, a.CreatedDate, a.UpdatedDate' + CHAR(13) 
	+ ' INTO #Tmp_Insert' + CHAR(13) 
	+ ' FROM #tmp_ssbid a' + CHAR(13) 
	+ ' LEFT JOIN ' + @ClientDB + 'dbo.dimcustomerssbid b WITH (NOLOCK) ON a.dimcustomerid = b.dimcustomerid' + CHAR(13) 
	+ ' WHERE b.dimcustomerid IS NULL;' + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'dbo.dimcustomerssbid (dimcustomerid, ssid, sourcesystem, Composite_ID, SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID, CreatedBy, UpdatedBy, CreatedDate, UpdatedDate)' + CHAR(13) 
	+ ' SELECT * FROM #tmp_Insert;' + CHAR(13) + CHAR(13) 
 
	+ @sql_dimcustomerMatchkey 
 
	+ ' CREATE CLUSTERED INDEX ix_dimcustomermatchkey_dimcustomerid_matchkeyid ON #dimcustomerMatchkey (DimCustomerID, MatchkeyID)' + CHAR(13) 
	+ ' CREATE NONCLUSTERED INDEX ix_dimcustomermatchkey_matchkeyvalue ON #dimcustomerMatchkey (MatchkeyValue)' + CHAR(13) + CHAR(13) 
 
	+ ' IF OBJECT_ID(''tempdb..#dimcustomer_update'') IS NOT NULL' + CHAR(13) 
	+ ' 	DROP TABLE #dimcustomer_update' + CHAR(13) + CHAR(13) 
 
	+ ' SELECT b.*' + CHAR(13) 
	+ ' INTO #dimcustomer_update' + CHAR(13)  
	+ ' FROM ' + @ClientDB + 'dbo.DimCustomerMatchkey a WITH (NOLOCK)' + CHAR(13) 
	+ ' INNER JOIN #dimcustomerMatchkey b WITH (NOLOCK) ON a.DimCustomerID = b.DimCustomerID' + CHAR(13) 
	+ ' 	AND a.MatchkeyID = b.MatchkeyID' + CHAR(13) 
	+ ' WHERE a.MatchkeyValue != b.MatchkeyValue' + CHAR(13) + CHAR(13) 
 
	-- UPDATE dbo.DimCustomerMatchkey 
	+ ' UPDATE b' + CHAR(13) 
	+ ' SET b.MatchkeyValue = a.MatchkeyValue' + CHAR(13) 
	+ '		, b.UpdateDate = CURRENT_TIMESTAMP' + CHAR(13) 
	+ ' FROM #dimcustomer_update a' + CHAR(13) 
	+ ' INNER JOIN ' + @ClientDB + 'dbo.DimCustomerMatchkey b ON a.DimCustomerID = b.DimCustomerID' + CHAR(13) 
	+ ' 	AND a.MatchkeyID = b.MatchkeyID' + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Update dbo.DimCustomerMatchkey'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
 
	+ ' IF OBJECT_ID(''tempdb..#dimcustomermatchkey_insert'') IS NOT NULL' + CHAR(13) 
	+ ' 	DROP TABLE #dimcustomermatchkey_insert' + CHAR(13) 
 
	+ ' SELECT a.*' + CHAR(13) 
	+ ' INTO #dimcustomermatchkey_insert' + CHAR(13) 
	+ ' FROM #dimcustomerMatchkey a' + CHAR(13) 
	+ ' LEFT JOIN ' + @ClientDB + 'dbo.DimCustomerMatchkey b WITH (NOLOCK) ON a.DimCustomerID = b.DimCustomerID' + CHAR(13) 
	+ ' 	AND a.MatchkeyID = b.MatchkeyID' + CHAR(13) 
	+ ' WHERE 1=1' + CHAR(13) 
	+ ' AND b.ID IS NULL' + CHAR(13) + CHAR(13) 
	 
	+ ' CREATE CLUSTERED INDEX ix_dimcustomermatchkey_insert ON #dimcustomermatchkey_insert (DimCustomerID, MatchkeyID)' + CHAR(13) 
	+ ' CREATE NONCLUSTERED INDEX ix_dimcustomermatchkey_insert_matchkeyvalue ON #dimcustomermatchkey_insert (MatchkeyValue)' + CHAR(13) + CHAR(13) 
 
	+ ' IF (SELECT COUNT(0) FROM #dimcustomermatchkey_insert) > 10000' + CHAR(13) 
	+ ' BEGIN' 
	+ '		EXEC ' + @ClientDB + 'dbo.sp_EnableDisableIndexes @Enable = 0, -- int' + CHAR(13) 
	+ '			@TableName = ''dbo.DimCustomerMatchkey'', -- varchar(500)' + CHAR(13) 
	+ '			@ViewCurrentIndexState = 0 -- bit' + CHAR(13) + CHAR(13) 
 
	+ '		INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ '		VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Disable indexes - dbo.DimCustomerMatchkey'', 0);' + CHAR(13) + CHAR(13) 
	+ ' END' + CHAR(13) + CHAR(13) 
 
	-- INSERT dbo.DimCustomerMatchkey 
	+ ' INSERT INTO ' + @ClientDB + 'dbo.DimCustomerMatchkey (DimCustomerID, MatchkeyID, MatchkeyValue)' + CHAR(13) 
	+ ' SELECT a.DimCustomerID, a.MatchkeyID, a.MatchkeyValue' + CHAR(13)  
	+ ' FROM #dimcustomermatchkey_insert a' + CHAR(13) 
	+ ' WHERE 1=1' + CHAR(13) 
	+ ' AND a.MatchkeyValue IS NOT NULL' + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Insert new dbo.DimCustomerMatchkey'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
 
	-- DELETE defunct matchkeys from dbo.DimcustomerMatchkey 
	+ ' DELETE b' + CHAR(13) 
	+ ' FROM (' + CHAR(13) 
	+ '		SELECT DISTINCT b.DimCustomerId, b.MatchkeyID' + CHAR(13) 
	+ '		FROM #tmp_ssbid a' + CHAR(13) 
	+ '		INNER JOIN ' + @ClientDB + 'dbo.DimCustomerMatchkey b WITH (NOLOCK) ON a.DimCustomerId = b.DimCustomerId' + CHAR(13) 
	+ '		INNER JOIN #matchkeyConfig c ON b.MatchkeyID = c.MatchkeyID' + CHAR(13) 
	+ '		AND c.Active = 0' + CHAR(13)  
	+ '		UNION' + CHAR(13) 
	+ '		SELECT DISTINCT a.DimCustomerId, a.MatchkeyID' + CHAR(13) 
	+ '		FROM ' + @ClientDB + 'dbo.DimCustomerMatchkey a WITH (NOLOCK)' + CHAR(13) 
	+ '		LEFT JOIN ' + @ClientDB + 'dbo.DimCustomer b WITH (NOLOCK) ON a.DimCustomerID = b.DimCustomerId' + CHAR(13) 
	+ '		WHERE 1=1' + CHAR(13) 
	+ '		AND b.DimCustomerId IS NULL' + CHAR(13)  
	+ ' ) a' + CHAR(13) 
	+ ' INNER JOIN ' + @ClientDB + 'dbo.DimCustomerMatchkey b WITH (NOLOCK) ON a.DimCustomerId = b.DimCustomerId' + CHAR(13) 
	+ '		AND a.MatchkeyID = b.MatchkeyID' + CHAR(13) + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Delete defunct dbo.DimCustomerMatchkey'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
 
	+ CASE  
		WHEN @FullRefresh = 1 THEN 
			' DELETE b' + CHAR(13) 
			+ ' FROM (' + CHAR(13) 
			+ '		SELECT DISTINCT b.DimCustomerId, b.MatchkeyID' + CHAR(13) 
			+ '		FROM #matchkeyConfig a' + CHAR(13) 
			+ '		INNER JOIN ' + @ClientDB + 'dbo.DimCustomerMatchkey b WITH (NOLOCK) ON a.MatchkeyID = b.MatchkeyID' + CHAR(13) 
			+ '		WHERE 1=1' + CHAR(13) 
			+ '		AND a.Active = 0' + CHAR(13)  
			+ '		UNION' + CHAR(13) 
			+ '		SELECT DISTINCT a.DimCustomerId, a.MatchkeyID' + CHAR(13) 
			+ '		FROM ' + @ClientDB + 'dbo.DimCustomerMatchkey a WITH (NOLOCK)' + CHAR(13) 
			+ '		LEFT JOIN ' + @ClientDB + 'dbo.DimCustomer b WITH (NOLOCK) ON a.DimCustomerID = b.DimCustomerId' + CHAR(13) 
			+ '		WHERE 1=1' + CHAR(13) 
			+ '		AND b.DimCustomerId IS NULL' + CHAR(13)  
			+ ' ) a' + CHAR(13) 
			+ ' INNER JOIN ' + @ClientDB + 'dbo.DimCustomerMatchkey b ON a.DimCustomerId = b.DimCustomerId' + CHAR(13) 
			+ '		AND a.MatchkeyID = b.MatchkeyID' + CHAR(13) + CHAR(13) 
 
			+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
			+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Delete defunct dbo.DimCustomerMatchkey (Full Refresh)'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
		ELSE '' 
	  END  
 
 
	-- DELETE invalid matchkeys from dbo.DimcustomerMatchkey 
	+ ' DELETE a' + CHAR(13) 
	+ ' FROM ' + @ClientDB + 'dbo.DimCustomerMatchkey a' + CHAR(13) 
	+ ' INNER JOIN (' + CHAR(13) 
	+ ' SELECT DISTINCT ' + CASE WHEN @RecognitionType = 'Contact' THEN 'a.DimCustomerId' ELSE 'ISNULL(a.DimCustomerId,b.DimCustomerId) AS DimCustomerId' END + ', b.MatchkeyID' + CHAR(13) 
	+ ' FROM #tmp_ssbid a' + CHAR(13) 
	+ CASE WHEN @RecognitionType = 'Contact' THEN ' INNER ' ELSE CASE WHEN @FullRefresh = 1 THEN ' FULL ' ELSE ' INNER ' END END + 'JOIN ' + @ClientDB + 'dbo.DimCustomerMatchkey b WITH (NOLOCK) ON a.DimCustomerId = b.DimCustomerID' + CHAR(13) 
	+ ' INNER JOIN #matchkeyConfig c ON b.MatchkeyID = c.MatchkeyID' + CHAR(13) 
	+ ' 	AND c.Active = 1' + CHAR(13) 
	+ ' LEFT JOIN #dimcustomerMatchkey d WITH (NOLOCK) ON c.MatchkeyID = d.MatchkeyID' + CHAR(13) 
	+ ' 	AND b.DimCustomerId = d.DimCustomerId' + CHAR(13) 
	+ ' WHERE 1=1' + CHAR(13) 
	+ ' AND (d.DimCustomerID IS NULL' + CASE WHEN @RecognitionType = 'Contact' THEN '' ELSE ' OR a.DimCustomerId IS NULL' END + ')' + CHAR(13) 
	+ ' UNION' + CHAR(13) 
	+ ' SELECT DISTINCT a.DimCustomerID, a.MatchkeyID' + CHAR(13) 
	+ ' FROM #invalid_matchkey a' + CHAR(13) 
	+ ' INNER JOIN ' + @ClientDB + 'dbo.DimCustomerMatchkey b WITH (NOLOCK) ON a.DimCustomerID = b.DimCustomerID' + CHAR(13) 
	+ ' AND a.MatchkeyID = b.MatchkeyID' + CHAR(13) 
	+ ' ) b ON a.DimCustomerID = b.DimCustomerID' + CHAR(13) 
	+ ' 	AND a.MatchkeyID = b.MatchkeyID' + CHAR(13) 
 
	+ ' INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ ' VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Delete invalid dbo.DimCustomerMatchkey'', @@ROWCOUNT);' + CHAR(13) + CHAR(13) 
 
	+ ' IF (SELECT COUNT(0) FROM #dimcustomermatchkey_insert) > 10000' + CHAR(13) 
	+ ' BEGIN' 
	+ '		EXEC ' + @ClientDB + 'dbo.sp_EnableDisableIndexes @Enable = 1, -- int' + CHAR(13) 
	+ '			@TableName = ''dbo.DimCustomerMatchkey'', -- varchar(500)' + CHAR(13) 
	+ '			@ViewCurrentIndexState = 0 -- bit' + CHAR(13) + CHAR(13) 
 
	+ '		INSERT INTO ' + @ClientDB + 'mdm.auditlog (logdate, mdm_process, process_step, cnt)' + CHAR(13) 
	+ '		VALUES (current_timestamp, ''SSB ' + @RecognitionType + ''', ''Enable indexes - dbo.DimCustomerMatchkey'', 0);' + CHAR(13) + CHAR(13) 
	+ ' END' + CHAR(13) + CHAR(13) 
 
	+ ' DROP TABLE #baseTblAllFields' + CHAR(13) 
	+ ' DROP TABLE #baseTblFields' + CHAR(13) 
	+ ' DROP TABLE #baseTblLookupFields' + CHAR(13) 
	+ ' DROP TABLE #compositeTblFields' + CHAR(13) 
	+ ' DROP TABLE #dimcustomerMatchkey' + CHAR(13) 
	+ ' DROP TABLE #matchkeyConfig' + CHAR(13) 
	+ ' DROP TABLE #matchkeyGroups' + CHAR(13) 
	+ ' DROP TABLE #tmp_cdio_changes' + CHAR(13) 
	+ ' DROP TABLE #tmp_Composite_cnt' + CHAR(13) 
	+ ' DROP TABLE #tmp_contactmatch_data' + CHAR(13) 
	+ ' DROP TABLE #tmp_contacts' + CHAR(13) 
	+ ' DROP TABLE #tmp_accounts' + CHAR(13) 
	+ ' DROP TABLE #Tmp_Insert' + CHAR(13) 
	+ ' DROP TABLE #Tmp_Match' + CHAR(13) 
	+ ' DROP TABLE #Tmp_Matchkey' + CHAR(13) 
	+ ' DROP TABLE #tmp_ssbid' + CHAR(13) 
	+ ' DROP TABLE #tmp_Update' + CHAR(13) 
	+ ' DROP TABLE #tmp_workingset' + CHAR(13) + CHAR(13) 
 
	+ @sql_dimcustomerssbid_audit 
	 
SELECT @sql 
 
 
EXEC sp_executesql @sql 
	, N'@rowCount_cdioChanges INT, @rowCount_matchkeyChanges INT, @rowCount_workingset INT, @rowCount_contactMatch_pre INT, @rowCount_contactMatch_post INT, @newHashTable BIT' 
	, @rowCount_cdioChanges, @rowCount_matchkeyChanges, @rowCount_workingset, @rowCount_contactMatch_pre, @rowCount_contactMatch_post, @newHashTable 
 
 
END 
 
 
 
GO
