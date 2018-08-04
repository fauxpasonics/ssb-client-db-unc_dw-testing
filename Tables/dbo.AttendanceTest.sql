CREATE TABLE [dbo].[AttendanceTest]
(
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FirstName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sport] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SeasonYear] [int] NULL,
[SeasonCode] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[SeasonName] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[EventName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[ItemName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Section] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[Row] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[Seat] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[PriceType] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
[PriceTypeName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TicketPrice] [numeric] (18, 2) NULL
)
GO
