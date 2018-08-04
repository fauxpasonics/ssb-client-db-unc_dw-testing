CREATE TABLE [config].[Element]
(
[ElementID] [int] NOT NULL IDENTITY(1, 1),
[Element] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElementType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElementFieldList] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElementUpdateStatement] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElementIsCleanField] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Custom] [bit] NULL,
[IsDeleted] [bit] NULL,
[DateCreated] [date] NULL CONSTRAINT [DF__Element__DateCre__70E5A8B1] DEFAULT (getdate()),
[DateUpdated] [date] NULL CONSTRAINT [DF__Element__DateUpd__71D9CCEA] DEFAULT (getdate())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [config].[trg_Element_Update_Insert]    
ON [config].[Element]    
AFTER UPDATE, INSERT    
AS     
BEGIN    
	SET NOCOUNT ON     
    
	DECLARE  
		@sql NVARCHAR(MAX) = '' 
		,@ClientDB VARCHAR(50) = DB_NAME() 
		,@MDM_DB VARCHAR(50) = CASE WHEN @@VERSION LIKE '%Azure%' THEN '' ELSE 'MDM' END 
		,@action CHAR(1) 
		,@refreshView BIT = 0 
		 
	/********** TESTING **********/ 
	----SET @MDM_DB = 'SSB_MDM' 
 
	IF @@SERVERNAME = 'vm-db-dev-01' 
		SET @MDM_DB = 'SSB_MDM' 
 
    --    
    -- Check if this is an INSERT, UPDATE or DELETE Action.    
    --     
    SET @action = 'I'; -- Set Action to Insert by default.    
    IF EXISTS(SELECT * FROM Deleted)    
    BEGIN    
        SET @action =     
            CASE    
                WHEN EXISTS(SELECT * FROM Inserted) THEN 'U' -- Set Action to Updated.    
                ELSE 'D' -- Set Action to Deleted.           
            END    
    END    
    ELSE IF NOT EXISTS(SELECT * FROM Inserted)     
		RETURN; -- Nothing updated or inserted.    
	 
	IF (@action = 'I') OR (@action = 'U' AND (UPDATE(ElementType) OR UPDATE(ElementFieldList) OR UPDATE(ElementIsCleanField) OR UPDATE(IsDeleted)))   
	BEGIN  
		SELECT @refreshView = CASE WHEN COUNT(0) > 0 THEN 1 ELSE 0 END 
		FROM Inserted a 
		INNER JOIN config.Element b ON a.ElementID = b.ElementID 
		LEFT JOIN Deleted c ON a.ElementID = c.ElementID 
		WHERE 1=1 
		AND a.ElementType = 'Standard' 
		AND ISNULL(a.ElementIsCleanField,'') != '' 
		AND ISNULL(a.IsDeleted,0) = 0 
		AND c.ElementID IS NULL 
 
		IF @refreshView = 0 
		BEGIN 
		SELECT @refreshView = CASE WHEN COUNT(0) > 0 THEN 1 ELSE 0 END 
		FROM Inserted a 
		INNER JOIN config.Element b ON a.ElementID = b.ElementID 
		INNER JOIN Deleted c ON a.ElementID = c.ElementID 
		WHERE 1=1 
		AND (a.ElementType = 'Standard' OR c.ElementType = 'Standard') 
		AND (ISNULL(a.ElementIsCleanField,'') != '' OR ISNULL(c.ElementIsCleanField,'') != '') 
		AND (ISNULL(a.IsDeleted,0) = 0 OR ISNULL(c.IsDeleted,0) = 0) 
		AND (ISNULL(a.ElementType,'') != ISNULL(c.ElementType,'') OR ISNULL(a.ElementIsCleanField,'') != ISNULL(c.ElementIsCleanField,'') OR ISNULL(a.IsDeleted,0) != ISNULL(c.IsDeleted,0)) 
		END 
	END 
 
	IF @refreshView = 1 
	BEGIN 
		PRINT 'Refreshing mdm.vw_Overrides_ActiveOnly_PIVOT...' 
 
		SET @sql = '' 
			+ ' EXEC ' + @MDM_DB + '.mdm.RefreshView @ClientDB = ''' + @ClientDB + ''',' + CHAR(13) 
			+ ' 									@viewName = ''mdm.vw_Overrides_ActiveOnly_PIVOT''' + CHAR(13) 
		EXEC sp_executesql @sql 
	END 
END 
GO
ALTER TABLE [config].[Element] ADD CONSTRAINT [PK__Element__A429723A1300B19B] PRIMARY KEY CLUSTERED  ([ElementID])
GO
