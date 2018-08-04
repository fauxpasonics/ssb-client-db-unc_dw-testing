CREATE TABLE [dbo].[GiftAGreements]
(
[ID] [uniqueidentifier] NOT NULL,
[DESIGNATIONNUMBER] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FILENAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FILE] [varbinary] (max) NOT NULL,
[DATEENTERED] [date] NULL,
[DATEADDED] [date] NULL,
[DATECHANGED] [date] NULL,
[TYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MAX_CHANGEDATE] [datetime] NULL
)
GO
