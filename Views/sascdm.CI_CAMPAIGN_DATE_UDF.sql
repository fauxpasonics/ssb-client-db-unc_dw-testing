SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [sascdm].[CI_CAMPAIGN_DATE_UDF] AS SELECT CAMPAIGN_SK , DATE_UDF_NM , DATE_UDF_VAL , DATE_EXT_COLUMN_NM , PROCESSED_DTTM FROM sascdm.CI_CAMP_PAGE_DATE_UDF WHERE PAGE_NM IN ('Brief Custom Details','BRIEF CUSTOM DETAILS')
GO
