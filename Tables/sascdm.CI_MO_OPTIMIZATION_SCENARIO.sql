CREATE TABLE [sascdm].[CI_MO_OPTIMIZATION_SCENARIO]
(
[MO_OPT_SCENARIO_SK] [numeric] (15, 0) NOT NULL,
[MO_OPT_SCENARIO_VERSION_NO] [numeric] (6, 0) NULL,
[MO_OPT_SCENARIO_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MO_OPT_SCENARIO_DESC] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MO_OPT_SCENARIO_RUN_DTTM] [datetime] NULL,
[MO_OPT_SCENARIO_OWNER_NM] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESSED_DTTM] [datetime] NULL
)
GO
ALTER TABLE [sascdm].[CI_MO_OPTIMIZATION_SCENARIO] ADD CONSTRAINT [MO_OPT_SCN_PK] PRIMARY KEY CLUSTERED  ([MO_OPT_SCENARIO_SK])
GO
