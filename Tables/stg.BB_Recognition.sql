CREATE TABLE [stg].[BB_Recognition]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Recogn__ETL_C__0C884052] DEFAULT (getdate()),
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
