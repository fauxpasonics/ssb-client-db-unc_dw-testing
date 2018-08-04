CREATE TABLE [mdm].[tmp_Contact_baseTbl_1]
(
[dimcustomerid] [int] NOT NULL IDENTITY(1, 1),
[ssid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sourcesystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[hashplaintext_1] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_1] [varbinary] (32) NULL,
[hashplaintext_2] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_2] [varbinary] (32) NULL,
[hashplaintext_3] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_3] [varbinary] (32) NULL,
[hashplaintext_9] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_9] [varbinary] (32) NULL,
[hashplaintext_12] [nvarchar] (307) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_12] [varbinary] (32) NULL,
[hashplaintext_13] [nvarchar] (752) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_13] [varbinary] (32) NULL,
[hashplaintext_14] [nvarchar] (577) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_14] [varbinary] (32) NULL,
[hashplaintext_15] [nvarchar] (76) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_15] [varbinary] (32) NULL,
[hashplaintext_17] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_17] [varbinary] (32) NULL,
[hashplaintext_19] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_19] [varbinary] (32) NULL,
[hashplaintext_20] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_20] [varbinary] (32) NULL
)
GO
CREATE CLUSTERED INDEX [ix_dimcustomerid] ON [mdm].[tmp_Contact_baseTbl_1] ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_1] ON [mdm].[tmp_Contact_baseTbl_1] ([hash_1]) INCLUDE ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_12] ON [mdm].[tmp_Contact_baseTbl_1] ([hash_12]) INCLUDE ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_13] ON [mdm].[tmp_Contact_baseTbl_1] ([hash_13]) INCLUDE ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_14] ON [mdm].[tmp_Contact_baseTbl_1] ([hash_14]) INCLUDE ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_15] ON [mdm].[tmp_Contact_baseTbl_1] ([hash_15]) INCLUDE ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_17] ON [mdm].[tmp_Contact_baseTbl_1] ([hash_17]) INCLUDE ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_19] ON [mdm].[tmp_Contact_baseTbl_1] ([hash_19]) INCLUDE ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_2] ON [mdm].[tmp_Contact_baseTbl_1] ([hash_2]) INCLUDE ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_20] ON [mdm].[tmp_Contact_baseTbl_1] ([hash_20]) INCLUDE ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_3] ON [mdm].[tmp_Contact_baseTbl_1] ([hash_3]) INCLUDE ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_9] ON [mdm].[tmp_Contact_baseTbl_1] ([hash_9]) INCLUDE ([dimcustomerid])
GO
