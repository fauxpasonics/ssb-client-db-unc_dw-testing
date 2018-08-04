CREATE SCHEMA [sasmetap]
AUTHORIZATION [ssb_ksniffin]
GO
GRANT SELECT ON SCHEMA:: [sasmetap] TO [sas_pdixon]
GO
GRANT SELECT ON SCHEMA:: [sasmetap] TO [sas_rmarla]
GO
GRANT SELECT ON SCHEMA:: [sasmetap] TO [svc_sasAppUser]
GO
GRANT SELECT ON SCHEMA:: [sasmetap] TO [svc_saslimitschema]
GO
GRANT ALTER ON SCHEMA:: [sasmetap] TO [svc_saslimitschema]
GO
GRANT CREATE SEQUENCE ON SCHEMA:: [sasmetap] TO [svc_saslimitschema]
GO
GRANT DELETE ON SCHEMA:: [sasmetap] TO [svc_saslimitschema]
GO
GRANT EXECUTE ON SCHEMA:: [sasmetap] TO [svc_saslimitschema]
GO
GRANT INSERT ON SCHEMA:: [sasmetap] TO [svc_saslimitschema]
GO
GRANT REFERENCES ON SCHEMA:: [sasmetap] TO [svc_saslimitschema]
GO
GRANT UPDATE ON SCHEMA:: [sasmetap] TO [svc_saslimitschema]
GO
GRANT SELECT ON SCHEMA:: [sasmetap] TO [svc_sasVAreadonly]
GO
