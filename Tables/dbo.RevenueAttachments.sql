CREATE TABLE [dbo].[RevenueAttachments]
(
[ID] [uniqueidentifier] NOT NULL,
[TGUID] [uniqueidentifier] NOT NULL,
[FILENAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DATEENTERED] [datetime] NOT NULL,
[DATEADDED] [datetime] NOT NULL,
[DATECHANGED] [datetime] NOT NULL,
[ATTACHMENTTYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TITLE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FILEDATA] [varbinary] (max) NOT NULL
)
GO
ALTER TABLE [dbo].[RevenueAttachments] ADD CONSTRAINT [PK__RevenueA__3214EC270169C48F] PRIMARY KEY CLUSTERED  ([ID])
GO
