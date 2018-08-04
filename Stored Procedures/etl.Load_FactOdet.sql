SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [etl].[Load_FactOdet]
(
	@BatchId UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(max) = NULL
)

AS
BEGIN

	INSERT INTO etl.DimFactLoadLog (CreatedDate, Step)
	SELECT getdate() ts, 'FactOdet Load Start' step


	TRUNCATE TABLE stg.FactOdet


	INSERT INTO etl.DimFactLoadLog (CreatedDate, Step)
	SELECT getdate() ts, 'Load_FactOdetEvents' step
	EXEC etl.Load_FactOdetEvents

	INSERT INTO etl.DimFactLoadLog (CreatedDate, Step)
	SELECT getdate() ts, 'Load_FactOdetItems' step
	EXEC etl.Load_FactOdetItems

	INSERT INTO etl.DimFactLoadLog (CreatedDate, Step)
	SELECT getdate() ts, 'FactOdet REBUILD' step
	ALTER INDEX ALL ON stg.FactOdet REBUILD

	INSERT INTO etl.DimFactLoadLog (CreatedDate, Step)
	SELECT getdate() ts, 'Cust_FactOdet' step
	IF EXISTS (SELECT * FROM sys.procedures WHERE [object_id] = OBJECT_ID('etl.Cust_FactOdet'))
	BEGIN	
		EXEC etl.Cust_FactOdet
	END

	INSERT INTO etl.DimFactLoadLog (CreatedDate, Step)
	SELECT getdate() ts, 'FactOdet REBUILD' step
	ALTER INDEX ALL ON stg.FactOdet REBUILD

	ALTER SCHEMA etl TRANSFER dbo.FactOdet;	 
	ALTER SCHEMA dbo TRANSFER stg.FactOdet;	 
	ALTER SCHEMA stg TRANSFER etl.FactOdet;

	INSERT INTO etl.DimFactLoadLog (CreatedDate, Step)
	SELECT getdate() ts, 'FactOdet Load Finish' step




END



GO
