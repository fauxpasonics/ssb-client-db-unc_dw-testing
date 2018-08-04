CREATE TABLE [ods].[BB_Constituent]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL,
[ETL_UpdatedDate] [datetime] NOT NULL,
[ETL_IsDeleted] [bit] NOT NULL,
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ID] [uniqueidentifier] NOT NULL,
[LOOKUPID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ISINACTIVE] [bit] NULL,
[DONOTMAIL] [bit] NULL,
[DONOTEMAIL] [bit] NULL,
[DONOTPHONE] [bit] NULL,
[ISCONSTITUENT] [bit] NULL,
[ISORGANIZATION] [bit] NULL,
[ISGROUP] [bit] NULL,
[ISINDIVIDUAL] [bit] NULL,
[ISCONFIDENTIAL] [bit] NULL,
[GIVESANONYMOUSLY] [bit] NULL,
[GENDERCODE] [tinyint] NULL,
[GENDER] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAREERCODE1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAREERCODE2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CAREERCODE3] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BIRTHDATE] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DECEASEDCONFIRMATIONCODE] [tinyint] NULL,
[DECEASEDCONFIRMATION] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DECEASEDATE] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRIMARY_EMPLOYER] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRIMARY_EMPLOYER_ID] [uniqueidentifier] NULL,
[PRIMARY_JOBTITLE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ISRETIRED] [bit] NULL,
[ISSELFEMPLOYED] [bit] NULL,
[PRIMARYCONSTITUENCY] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAME] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INDIVIDUALINFORMALADDRESSEE] [nvarchar] (700) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INDIVIDUALFORMALSALUTATION] [nvarchar] (700) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INDIVIDUALFORMALADDRESSEE] [nvarchar] (700) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TITLE] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TITLE2] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FIRSTNAME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MIDDLENAME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LASTNAME] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUFFIX] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUFFIX2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NICKNAME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GOESBY] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RATING_CODE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RATING_DESC] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
WITH
(
DATA_COMPRESSION = PAGE
)
GO
ALTER TABLE [ods].[BB_Constituent] ADD CONSTRAINT [PK__BB_Const__3214EC271C4D869F] PRIMARY KEY CLUSTERED  ([ID]) WITH (DATA_COMPRESSION = PAGE)
GO
CREATE NONCLUSTERED INDEX [IDX_BB_Constituent_ISINACTIVE] ON [ods].[BB_Constituent] ([ISINACTIVE]) WITH (DATA_COMPRESSION = PAGE)
GO
