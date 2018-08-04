CREATE TABLE [stg].[Sync_temp_ods_BB_UNCEducation]
(
[ETL_ID] [int] NOT NULL,
[ETL_CreatedDate] [datetime] NOT NULL,
[ETL_UpdatedDate] [datetime] NOT NULL,
[ETL_IsDeleted] [bit] NOT NULL,
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ID] [uniqueidentifier] NOT NULL,
[CONSTITUENTID] [uniqueidentifier] NULL,
[DATEGRADUATED] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEGREE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEGREECODE] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DEGREETYPE] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLASSOF] [smallint] NULL,
[PROGRAM] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SCHOOL] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAJOR] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ISPRIMARY] [bit] NULL,
[CONSTITUENCYSTATUS] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_Sync_Id] [int] NOT NULL IDENTITY(1, 1)
)
GO
ALTER TABLE [stg].[Sync_temp_ods_BB_UNCEducation] ADD CONSTRAINT [PK__Sync_tem__19364FD218756BBA] PRIMARY KEY CLUSTERED  ([ETL_Sync_Id])
GO
