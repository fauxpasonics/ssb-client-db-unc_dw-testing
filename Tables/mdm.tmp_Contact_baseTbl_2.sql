CREATE TABLE [mdm].[tmp_Contact_baseTbl_2]
(
[dimcustomerid] [int] NOT NULL,
[ssid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sourcesystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[hashplaintext_16] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[hash_16] [varbinary] (32) NULL
)
GO
CREATE CLUSTERED INDEX [ix_dimcustomerid] ON [mdm].[tmp_Contact_baseTbl_2] ([dimcustomerid])
GO
CREATE NONCLUSTERED INDEX [ix_hash_16] ON [mdm].[tmp_Contact_baseTbl_2] ([hash_16]) INCLUDE ([dimcustomerid])
GO
