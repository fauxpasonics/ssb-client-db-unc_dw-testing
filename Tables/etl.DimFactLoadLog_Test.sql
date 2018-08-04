CREATE TABLE [etl].[DimFactLoadLog_Test]
(
[LogId] [int] NOT NULL IDENTITY(1, 1),
[CreatedDate] [datetime] NULL,
[Step] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [etl].[DimFactLoadLog_Test] ADD CONSTRAINT [PK__DimFactL__5E548648E1934532] PRIMARY KEY CLUSTERED  ([LogId])
GO
