CREATE TABLE [email].[DimEmailType]
(
[DimEmailTypeID] [int] NOT NULL IDENTITY(1, 1),
[EmailType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimEmailT__Creat__18321DF7] DEFAULT (getdate()),
[CreatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimEmailT__Updat__19264230] DEFAULT (getdate()),
[UpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [email].[DimEmailType] ADD CONSTRAINT [PK_DimEmailType_DimEmailTypeID] PRIMARY KEY CLUSTERED  ([DimEmailTypeID])
GO
