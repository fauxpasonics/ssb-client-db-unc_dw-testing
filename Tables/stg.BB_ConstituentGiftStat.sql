CREATE TABLE [stg].[BB_ConstituentGiftStat]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Consti__ETL_C__4BAEA12E] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[GIFTSTATTYPECODE] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GIFTSTATCODE] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
