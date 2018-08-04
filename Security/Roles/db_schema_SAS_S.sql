CREATE ROLE [db_schema_SAS_S]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'db_schema_SAS_S', N'svc_saslimitschema'
GO
