CREATE TABLE [stg].[BB_PledgeBalance]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Pledge__ETL_C__0A9FF7E0] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[FINANCIALTRANSACTIONID] [uniqueidentifier] NULL,
[REVENUEID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLEDGEAMOUNT] [money] NULL,
[PLEDGEBALANCE] [money] NULL,
[PLEDGESPLITAMOUNT] [money] NULL,
[PLEDGESPLITBALANCE] [money] NULL
)
GO
