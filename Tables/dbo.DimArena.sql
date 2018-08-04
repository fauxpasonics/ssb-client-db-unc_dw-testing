CREATE TABLE [dbo].[DimArena]
(
[DimArenaId] [int] NOT NULL IDENTITY(1, 1),
[ETL__SourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__DimArena__ETL__C__0E391C95] DEFAULT (suser_name()),
[ETL__CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__DimArena__ETL__C__0F2D40CE] DEFAULT (getdate()),
[ETL__StartDate] [datetime] NOT NULL CONSTRAINT [DF__DimArena__ETL__S__10216507] DEFAULT (getdate()),
[ETL__EndDate] [datetime] NULL,
[ETL__SSID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__SSID_FACILITY] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[ETL__SSID_arena_id] [int] NULL,
[ArenaCode] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArenaName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArenaDesc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArenaClass] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__DeltaHashKey] [binary] (32) NULL
)
GO
ALTER TABLE [dbo].[DimArena] ADD CONSTRAINT [PK_DimArena] PRIMARY KEY CLUSTERED  ([DimArenaId])
GO
