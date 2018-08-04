CREATE SCHEMA [sas]
AUTHORIZATION [dbo]
GO
GRANT SELECT ON SCHEMA:: [sas] TO [db_schema_SAS_S]
GO
GRANT SELECT ON SCHEMA:: [sas] TO [sas_schema_ro]
GO
GRANT SELECT ON SCHEMA:: [sas] TO [sas_sedgemon]
GO
GRANT EXECUTE ON SCHEMA:: [sas] TO [sas_sedgemon]
GO
GRANT REFERENCES ON SCHEMA:: [sas] TO [sas_sedgemon]
GO
GRANT VIEW DEFINITION ON SCHEMA:: [sas] TO [sas_sedgemon]
GO
GRANT SELECT ON SCHEMA:: [sas] TO [svc_sasAppUser]
GO
GRANT SELECT ON SCHEMA:: [sas] TO [svc_sasVAreadonly]
GO
GRANT SELECT ON SCHEMA:: [sas] TO [unc_nickfulton]
GO
GRANT SELECT ON SCHEMA:: [sas] TO [unc_rickroot]
GO
GRANT SELECT ON SCHEMA:: [sas] TO [unc_ryanmiller]
GO
