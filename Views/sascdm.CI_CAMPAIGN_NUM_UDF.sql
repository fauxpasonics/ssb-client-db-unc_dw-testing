SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [sascdm].[CI_CAMPAIGN_NUM_UDF] AS SELECT CAMPAIGN_SK , NUM_UDF_NM , NUM_UDF_VAL , NUM_EXT_COLUMN_NM , PROCESSED_DTTM FROM sascdm.CI_CAMP_PAGE_NUM_UDF WHERE PAGE_NM IN ('Brief Custom Details','BRIEF CUSTOM DETAILS')
GO
