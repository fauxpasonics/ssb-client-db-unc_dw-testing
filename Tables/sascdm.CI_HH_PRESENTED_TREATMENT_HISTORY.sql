CREATE TABLE [sascdm].[CI_HH_PRESENTED_TREATMENT_HISTORY]
(
[CELL_PACKAGE_SK] [numeric] (15, 0) NOT NULL,
[HOUSEHOLDID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TREATMENT_SK] [numeric] (15, 0) NOT NULL,
[TREATMENT_HASH_VAL] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PRESENTED_TREATMENT_HIST_DTTM] [datetime] NOT NULL,
[PRESENTED_TREATMENT_DT] [date] NULL,
[EXTERNAL_PRESENTED_INFO_ID1] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXTERNAL_PRESENTED_INFO_ID2] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RESPONSE_TRACKING_CD] [varchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [sascdm].[CI_HH_PRESENTED_TREATMENT_HISTORY] ADD CONSTRAINT [HH_PRE_TRT_HST_PK] PRIMARY KEY CLUSTERED  ([CELL_PACKAGE_SK], [HOUSEHOLDID], [TREATMENT_SK], [TREATMENT_HASH_VAL], [PRESENTED_TREATMENT_HIST_DTTM])
GO
