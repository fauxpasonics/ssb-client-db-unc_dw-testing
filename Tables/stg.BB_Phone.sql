CREATE TABLE [stg].[BB_Phone]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Phone__ETL_Cr__08B7AF6E] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[PHONETYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NUMBER] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NUMBERNOFORMAT] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STARTDATE] [date] NULL,
[ENDDATE] [date] NULL,
[DONOTCALL] [bit] NULL,
[ISPRIMARY] [bit] NULL,
[INFOSOURCE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
