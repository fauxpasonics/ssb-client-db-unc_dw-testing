SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [sascdm].[CI_CAMPAIGN_GROUP_CHAR_UDF] AS SELECT CAMPAIGN_GROUP_SK , CHAR_UDF_NM , CHAR_UDF_VAL , CHAR_EXT_COLUMN_NM , PROCESSED_DTTM FROM sascdm.CI_CAMP_GRP_PAGE_CHAR_UDF WHERE PAGE_NM IN ('Brief Custom Details','BRIEF CUSTOM DETAILS')
GO
