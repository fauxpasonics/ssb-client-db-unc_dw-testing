CREATE TABLE [mdm].[MDM_ExtAttributes]
(
[dimcustomerid] [int] NOT NULL,
[extattribute33] [int] NULL,
[extattribute32] [int] NULL,
[extattribute31] [int] NULL,
[extattribute10] [int] NULL,
[extattribute8] [int] NULL,
[extattribute6] [int] NULL,
[extattribute7] [int] NULL,
[extattribute34] [int] NULL,
[extattribute35] [int] NULL,
[extattribute11] [int] NULL,
[extattribute12] [int] NULL,
[extattribute13] [int] NULL,
[extattribute14] [int] NULL
)
GO
CREATE CLUSTERED INDEX [ix_MDM_ExtAttributes] ON [mdm].[MDM_ExtAttributes] ([dimcustomerid])
GO
