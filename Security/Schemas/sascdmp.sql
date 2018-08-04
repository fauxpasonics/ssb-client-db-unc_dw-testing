CREATE SCHEMA [sascdmp]
AUTHORIZATION [ssb_ksniffin]
GO
GRANT REFERENCES ON SCHEMA:: [sascdmp] TO [sas_pattri]
GO
GRANT REFERENCES ON SCHEMA:: [sascdmp] TO [sas_pdixon]
GO
GRANT SELECT ON SCHEMA:: [sascdmp] TO [sas_pdixon]
GO
GRANT REFERENCES ON SCHEMA:: [sascdmp] TO [sas_rmarla]
GO
GRANT SELECT ON SCHEMA:: [sascdmp] TO [sas_rmarla]
GO
GRANT REFERENCES ON SCHEMA:: [sascdmp] TO [svc_sasAppUser]
GO
GRANT SELECT ON SCHEMA:: [sascdmp] TO [svc_sasAppUser]
GO
GRANT REFERENCES ON SCHEMA:: [sascdmp] TO [svc_saslimitschema]
GO
GRANT SELECT ON SCHEMA:: [sascdmp] TO [svc_saslimitschema]
GO
GRANT ALTER ON SCHEMA:: [sascdmp] TO [svc_saslimitschema]
GO
GRANT CREATE SEQUENCE ON SCHEMA:: [sascdmp] TO [svc_saslimitschema]
GO
GRANT DELETE ON SCHEMA:: [sascdmp] TO [svc_saslimitschema]
GO
GRANT EXECUTE ON SCHEMA:: [sascdmp] TO [svc_saslimitschema]
GO
GRANT INSERT ON SCHEMA:: [sascdmp] TO [svc_saslimitschema]
GO
GRANT UPDATE ON SCHEMA:: [sascdmp] TO [svc_saslimitschema]
GO
GRANT REFERENCES ON SCHEMA:: [sascdmp] TO [svc_sasVAreadonly]
GO
GRANT SELECT ON SCHEMA:: [sascdmp] TO [svc_sasVAreadonly]
GO
