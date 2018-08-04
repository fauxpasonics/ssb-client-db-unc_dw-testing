CREATE TABLE [ods].[BB_PledgeBalance]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Pledge__ETL_C__6068C5A2] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[FINANCIALTRANSACTIONID] [uniqueidentifier] NULL,
[REVENUEID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLEDGEAMOUNT] [money] NULL,
[PLEDGEBALANCE] [money] NULL,
[PLEDGESPLITAMOUNT] [money] NULL,
[PLEDGESPLITBALANCE] [money] NULL
)
GO
ALTER TABLE [ods].[BB_PledgeBalance] ADD CONSTRAINT [PK_PledgeBalance_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
