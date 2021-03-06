CREATE TABLE [dbo].[Demographics]
(
[LOOKUPID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NAME] [nvarchar] (154) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INACTIVE] [bit] NOT NULL,
[ISINDIVIDUAL] [int] NOT NULL,
[TITLE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FIRSTNAME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MIDDLENAME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LASTNAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SUFFIX] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FORMATTEDNAME] [nvarchar] (404) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GENDER] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAREERCODE1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAREERCODE2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAREERCODE3] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CONFIDENTIAL] [bit] NOT NULL,
[BIRTHDATE] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DECEASEDATE] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DECEASEDSTATUS] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRIMARY_EMPLOYER] [nvarchar] (154) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRIMARY_EMPLOYER_LOOKUPID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRIMARY_JOBTITLE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ISRETIRED] [int] NULL,
[ISSELFEMPLOYED] [int] NULL,
[ISWEBADDRESSCONFIDENTIAL] [bit] NULL,
[ISWEBCONFIDENTIAL] [bit] NULL,
[CONSTITUENTID] [uniqueidentifier] NOT NULL,
[PRIMARYCONSTITUENCY] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NICKNAME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
ALTER TABLE [dbo].[Demographics] ADD CONSTRAINT [Ct_LOOKUPID] PRIMARY KEY CLUSTERED  ([LOOKUPID])
GO
