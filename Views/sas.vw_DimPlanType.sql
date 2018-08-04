SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_DimPlanType]
AS
SELECT  DimPlanTypeId ,
        PlanTypeCode ,
        PlanTypeName ,
        PlanTypeDesc ,
        PlanTypeClass
FROM    [dbo].[DimPlanType] with (nolock) ;        


GO
