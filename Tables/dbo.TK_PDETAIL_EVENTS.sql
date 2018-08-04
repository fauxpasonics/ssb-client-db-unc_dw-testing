CREATE TABLE [dbo].[TK_PDETAIL_EVENTS]
(
[ETLSID] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[SEASON] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[ITEM] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[I_PT] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[I_PL] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
[VMC] [bigint] NOT NULL,
[EVENT] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[E_PRICE] [numeric] (18, 2) NULL,
[PRINT_PRICE] [numeric] (18, 2) NULL,
[TAX] [numeric] (18, 2) NULL,
[FEE] [numeric] (18, 2) NULL,
[ACCT_PRICE] [numeric] (18, 2) NULL,
[ZID] [varchar] (76) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[SOURCE_ID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXPORT_DATETIME] [datetime] NULL,
[ETL_Sync_DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dbo].[TK_PDETAIL_EVENTS] ADD CONSTRAINT [PK_TK_PDETAIL_EVENTS] PRIMARY KEY CLUSTERED  ([ETLSID], [SEASON], [ITEM], [I_PT], [I_PL], [VMC])
GO
