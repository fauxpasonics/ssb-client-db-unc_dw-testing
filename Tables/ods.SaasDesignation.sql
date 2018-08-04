CREATE TABLE [ods].[SaasDesignation]
(
[SaasDesignation_SK] [int] NOT NULL IDENTITY(1, 1),
[BusinessKey_Hash] [binary] (64) NOT NULL,
[Attribute_Hash] [binary] (64) NULL,
[Member ID] [int] NULL,
[Donor Status] [nvarchar] (52) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Donor Status Abbreviation] [nvarchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Donor Status Mod Date] [datetime] NULL,
[Account Status] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rank] [int] NULL,
[Points] [money] NULL,
[Car Dealer] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Insurance] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Endowment Requirement] [nvarchar] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Blue Zone Requirement] [nvarchar] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Endowment Heir] [nvarchar] (26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Smith Center Heir] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Endowment Donor] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Insur Heir] [nvarchar] (34) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Special Project Donor] [nvarchar] (26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Major Gift Donor] [int] NULL,
[Num Annual Sch Pay] [int] NULL,
[Num Annual Sch Pay Remaining] [int] NULL,
[Amt Annual Sch Pay Remaining] [money] NULL,
[ROW_NUM] [int] NOT NULL,
[EFF_BEG_DATE] [date] NULL,
[EFF_END_DATE] [date] NOT NULL,
[ETL_CREATED_DATE] [datetime] NOT NULL,
[ETL_LUPDATED_DATE] [datetime] NOT NULL
)
GO
ALTER TABLE [ods].[SaasDesignation] ADD CONSTRAINT [PK__SaasDesi__5106590E977EF3B1] PRIMARY KEY CLUSTERED  ([BusinessKey_Hash], [ROW_NUM], [EFF_END_DATE])
GO
