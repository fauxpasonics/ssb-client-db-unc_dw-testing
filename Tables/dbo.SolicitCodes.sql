CREATE TABLE [dbo].[SolicitCodes]
(
[LOOKUPID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DESCRIPTION] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DATEADDED] [datetime] NOT NULL,
[STARTDATE] [datetime] NULL,
[ENDDATE] [datetime] NULL
)
GO
