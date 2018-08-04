CREATE TABLE [dbo].[Phones]
(
[LOOKUPID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PHONETYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NUMBER] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[STARTDATE] [date] NULL,
[ENDDATE] [date] NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL,
[DONOTCALL] [bit] NOT NULL,
[ISPRIMARY] [bit] NOT NULL
)
GO
