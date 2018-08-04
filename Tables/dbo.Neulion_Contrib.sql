CREATE TABLE [dbo].[Neulion_Contrib]
(
[MemberID] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Value] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedDate] [datetime] NULL,
[ETL_DeltaHashKey] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsNumber] [bit] NULL
)
GO
