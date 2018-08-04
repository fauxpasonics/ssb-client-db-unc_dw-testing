CREATE TABLE [ods].[BB_ConstituentGiftStat]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[GIFTSTATTYPECODE] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GIFTSTATCODE] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[BB_ConstituentGiftStat] ADD CONSTRAINT [PK__BB_Const__3214EC277DBD244C] PRIMARY KEY CLUSTERED  ([ID])
GO
