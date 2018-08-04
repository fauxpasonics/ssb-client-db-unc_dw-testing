CREATE TABLE [dbo].[Pac_LinkedAccounts]
(
[PatronID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsDeleted] [bit] NULL,
[BuyerTypeRank] [int] NULL,
[SSUpdatedDate] [datetime] NULL,
[Linked] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PIN] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkedDirtyHash] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedDate] [datetime] NULL
)
GO
ALTER TABLE [dbo].[Pac_LinkedAccounts] ADD CONSTRAINT [PK_Patron] PRIMARY KEY CLUSTERED  ([PatronID])
GO
