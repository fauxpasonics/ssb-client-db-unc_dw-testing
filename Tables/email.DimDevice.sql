CREATE TABLE [email].[DimDevice]
(
[DimDeviceId] [int] NOT NULL IDENTITY(-2, 1),
[Device] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimDevice__Creat__3E57C6DF] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimDevice__Creat__3F4BEB18] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimDevice__Updat__40400F51] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimDevice__Updat__4134338A] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[DimDevice] ADD CONSTRAINT [PK__DimDevic__EE18DE2152C3D2E4] PRIMARY KEY CLUSTERED  ([DimDeviceId])
GO
