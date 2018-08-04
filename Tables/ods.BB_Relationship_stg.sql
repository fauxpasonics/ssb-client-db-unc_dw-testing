CREATE TABLE [ods].[BB_Relationship_stg]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__BB_Relati__ETL_C__62510E14] DEFAULT (getdate()),
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
ALTER TABLE [ods].[BB_Relationship_stg] ADD CONSTRAINT [PK_Relationship_ID] PRIMARY KEY CLUSTERED  ([ID])
GO
