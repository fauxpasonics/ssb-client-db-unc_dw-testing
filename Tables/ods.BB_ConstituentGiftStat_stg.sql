CREATE TABLE [ods].[BB_ConstituentGiftStat_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Consti__ETL_C__55EB372F] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[GIFTSTATTYPECODE] [nvarchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GIFTSTATCODE] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[BB_ConstituentGiftStat_stg] ADD CONSTRAINT [PK_ConstituentGiftStat_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
