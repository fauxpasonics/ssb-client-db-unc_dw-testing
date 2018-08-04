CREATE TABLE [sascdm].[etllogger]
(
[logDate] [datetime] NULL,
[tableName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[logSQL] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[logRows] [int] NULL,
[errKode] [int] NULL,
[errMessage] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
