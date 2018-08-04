CREATE TABLE [src].[SaasMerge]
(
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceFileLineNumber] [int] NOT NULL,
[BusinessKey_Hash] [binary] (64) NULL,
[Attribute_Hash] [binary] (64) NULL,
[Member ID] [int] NULL,
[Account Status] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Deactivate Date] [datetime] NULL,
[Name] [nvarchar] (53) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account Status Mod Date] [datetime] NULL,
[Donor Status] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Donor Status Mod Date] [datetime] NULL,
[Name/Phone/Email Mod Date] [datetime] NULL,
[Most Recent Contact Mod Date] [datetime] NULL
)
GO
