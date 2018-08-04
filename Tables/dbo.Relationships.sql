CREATE TABLE [dbo].[Relationships]
(
[RELATIONSHIPID] [uniqueidentifier] NOT NULL,
[LookupID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RELTYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RECIPRELTYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RELATION_LOOKUPID] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ISSPOUSE] [bit] NOT NULL,
[ISPRIMARYBUSINESS] [bit] NOT NULL,
[ISMATCHINGGIFTRELATIONSHIP] [bit] NOT NULL
)
GO
