CREATE SCHEMA [sastemp]
AUTHORIZATION [dbo]
GO
GRANT SELECT ON SCHEMA:: [sastemp] TO [db_schema_SASTEMP_SUID]
GO
GRANT UPDATE ON SCHEMA:: [sastemp] TO [db_schema_SASTEMP_SUID]
GO
GRANT ALTER ON SCHEMA:: [sastemp] TO [db_schema_SASTEMP_SUID]
GO
GRANT DELETE ON SCHEMA:: [sastemp] TO [db_schema_SASTEMP_SUID]
GO
GRANT INSERT ON SCHEMA:: [sastemp] TO [db_schema_SASTEMP_SUID]
GO
GRANT SELECT ON SCHEMA:: [sastemp] TO [svc_sasAppUser]
GO
GRANT UPDATE ON SCHEMA:: [sastemp] TO [svc_sasAppUser]
GO
GRANT ALTER ON SCHEMA:: [sastemp] TO [svc_saslimitschema]
GO
GRANT SELECT ON SCHEMA:: [sastemp] TO [svc_sasVAreadonly]
GO
