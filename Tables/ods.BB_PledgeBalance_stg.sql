CREATE TABLE [ods].[BB_PledgeBalance_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ID] [uniqueidentifier] NOT NULL,
[FINANCIALTRANSACTIONID] [uniqueidentifier] NULL,
[REVENUEID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLEDGEAMOUNT] [money] NULL,
[PLEDGEBALANCE] [money] NULL,
[PLEDGESPLITAMOUNT] [money] NULL,
[PLEDGESPLITBALANCE] [money] NULL
)
GO
ALTER TABLE [ods].[BB_PledgeBalance_stg] ADD CONSTRAINT [PK__BB_Pledg__3214EC27BECC72C0] PRIMARY KEY CLUSTERED  ([ID])
GO