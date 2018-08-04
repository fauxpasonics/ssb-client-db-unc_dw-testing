CREATE TABLE [sasload].[cars]
(
[Make] [varchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Model] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Origin] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DriveTrain] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MSRP] [money] NULL,
[Invoice] [money] NULL,
[EngineSize] [float] NULL,
[Cylinders] [float] NULL,
[Horsepower] [float] NULL,
[MPG_City] [float] NULL,
[MPG_Highway] [float] NULL,
[Weight] [float] NULL,
[Wheelbase] [float] NULL,
[Length] [float] NULL
)
GO
