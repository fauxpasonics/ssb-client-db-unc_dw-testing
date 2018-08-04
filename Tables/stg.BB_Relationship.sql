CREATE TABLE [stg].[BB_Relationship]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Relati__ETL_C__0E7088C4] DEFAULT (getdate()),
[ID] [uniqueidentifier] NOT NULL,
[RELATIONSHIPSETID] [uniqueidentifier] NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[RELTYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RECIPRELTYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RELATEDCONSTITUENTID] [uniqueidentifier] NULL,
[ISSPOUSE] [bit] NULL,
[ISPRIMARYBUSINESS] [bit] NULL,
[ISMATCHINGGIFTRELATIONSHIP] [bit] NULL,
[STARTDATE] [date] NULL,
[ENDDATE] [date] NULL,
[JOBTITLE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JOBENDDATE] [date] NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL
)
GO
