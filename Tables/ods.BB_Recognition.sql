CREATE TABLE [ods].[BB_Recognition]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Recogn__ETL_C__615CE9DB] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[FINANCIALTRANSACTIONLINEITEMID] [uniqueidentifier] NULL,
[RECOGNITIONAMOUNT] [money] NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[CREDITTYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RECOGNITIONDATE] [date] NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
ALTER TABLE [ods].[BB_Recognition] ADD CONSTRAINT [PK_Recognition_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
