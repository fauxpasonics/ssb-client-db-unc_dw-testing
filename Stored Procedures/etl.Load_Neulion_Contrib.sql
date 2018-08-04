SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [etl].[Load_Neulion_Contrib]
AS

INSERT INTO dbo.Neulion_Contrib
        ( MemberID ,
          Field ,
          Value ,
          UpdatedDate ,
          ETL_DeltaHashKey
        )
SELECT A.MemberID, A.Field, A.Value, A.UpdatedDate, A.ETL_DeltaHashKey
FROM stg.Load_Neulion_Contrib A
LEFT JOIN dbo.Neulion_Contrib B ON A.ETL_DeltaHashKey = B.ETL_DeltaHashKey
WHERE b.MemberID IS NULL

GO
