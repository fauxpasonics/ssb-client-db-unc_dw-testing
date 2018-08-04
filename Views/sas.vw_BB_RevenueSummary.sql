SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_BB_RevenueSummary]
AS
SELECT  CAST(ConstituentID AS NVARCHAR(100)) ConstituentID ,
        FY AS FiscalYear ,
        SITEID ,
        SITENUMBER ,
        AMOUNT AS CurrentYearAmount ,
        HOUSEHOLDAMOUNT AS CurrentYearHouseholdAmount ,
        ALLTIMEAMOUNT AS AllTimeAmount ,
        ALLTIMEHOUSEHOLDAMOUNT AS AllTimeHouseholdAmount
FROM    ods.BB_REVENUESUMMARY (NOLOCK)

GO
