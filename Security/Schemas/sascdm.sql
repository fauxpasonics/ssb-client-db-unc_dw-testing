CREATE SCHEMA [sascdm]
AUTHORIZATION [dbo]
GO
GRANT SELECT ON SCHEMA:: [sascdm] TO [db_schema_SASCDM_SUID]
GO
GRANT DELETE ON SCHEMA:: [sascdm] TO [db_schema_SASCDM_SUID]
GO
GRANT INSERT ON SCHEMA:: [sascdm] TO [db_schema_SASCDM_SUID]
GO
GRANT UPDATE ON SCHEMA:: [sascdm] TO [db_schema_SASCDM_SUID]
GO
GRANT ALTER ON SCHEMA:: [sascdm] TO [db_schema_SASCDM_SUID]
GO
GRANT REFERENCES ON SCHEMA:: [sascdm] TO [sas_pattri]
GO
GRANT REFERENCES ON SCHEMA:: [sascdm] TO [sas_pdixon]
GO
GRANT REFERENCES ON SCHEMA:: [sascdm] TO [sas_rmarla]
GO
GRANT REFERENCES ON SCHEMA:: [sascdm] TO [sas_sedgemon]
GO
GRANT REFERENCES ON SCHEMA:: [sascdm] TO [sas_tcooper]
GO
GRANT SELECT ON SCHEMA:: [sascdm] TO [svc_sasAppUser]
GO
GRANT DELETE ON SCHEMA:: [sascdm] TO [svc_sasAppUser]
GO
GRANT EXECUTE ON SCHEMA:: [sascdm] TO [svc_sasAppUser]
GO
GRANT INSERT ON SCHEMA:: [sascdm] TO [svc_sasAppUser]
GO
GRANT REFERENCES ON SCHEMA:: [sascdm] TO [svc_sasAppUser]
GO
GRANT UPDATE ON SCHEMA:: [sascdm] TO [svc_sasAppUser]
GO
GRANT SELECT ON SCHEMA:: [sascdm] TO [svc_saslimitschema]
GO
GRANT DELETE ON SCHEMA:: [sascdm] TO [svc_saslimitschema]
GO
GRANT EXECUTE ON SCHEMA:: [sascdm] TO [svc_saslimitschema]
GO
GRANT INSERT ON SCHEMA:: [sascdm] TO [svc_saslimitschema]
GO
GRANT REFERENCES ON SCHEMA:: [sascdm] TO [svc_saslimitschema]
GO
GRANT UPDATE ON SCHEMA:: [sascdm] TO [svc_saslimitschema]
GO
GRANT ALTER ON SCHEMA:: [sascdm] TO [svc_saslimitschema]
GO
GRANT CREATE SEQUENCE ON SCHEMA:: [sascdm] TO [svc_saslimitschema]
GO
GRANT SELECT ON SCHEMA:: [sascdm] TO [svc_sasVAreadonly]
GO
