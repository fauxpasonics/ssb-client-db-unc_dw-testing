CREATE TABLE [email].[DimEmailStatus]
(
[DimEmailStatusID] [int] NOT NULL IDENTITY(1, 1),
[EmailStatus] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimEmailS__Creat__1090FC2F] DEFAULT (getdate()),
[CreatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimEmailS__Updat__11852068] DEFAULT (getdate()),
[UpdatedBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [email].[DimEmailStatus] ADD CONSTRAINT [PK_DimEmailStatis_DimEmailStatusID] PRIMARY KEY CLUSTERED  ([DimEmailStatusID])
GO
