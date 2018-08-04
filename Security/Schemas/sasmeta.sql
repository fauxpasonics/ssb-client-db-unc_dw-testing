CREATE SCHEMA [sasmeta]
AUTHORIZATION [dbo]
GO
GRANT SELECT ON SCHEMA:: [sasmeta] TO [svc_sasAppUser]
GO
GRANT UPDATE ON SCHEMA:: [sasmeta] TO [svc_sasAppUser]
GO
GRANT SELECT ON SCHEMA:: [sasmeta] TO [svc_saslimitschema]
GO
GRANT UPDATE ON SCHEMA:: [sasmeta] TO [svc_saslimitschema]
GO
GRANT ALTER ON SCHEMA:: [sasmeta] TO [svc_saslimitschema]
GO
GRANT CREATE SEQUENCE ON SCHEMA:: [sasmeta] TO [svc_saslimitschema]
GO
GRANT DELETE ON SCHEMA:: [sasmeta] TO [svc_saslimitschema]
GO
GRANT EXECUTE ON SCHEMA:: [sasmeta] TO [svc_saslimitschema]
GO
GRANT INSERT ON SCHEMA:: [sasmeta] TO [svc_saslimitschema]
GO
GRANT REFERENCES ON SCHEMA:: [sasmeta] TO [svc_saslimitschema]
GO
GRANT SELECT ON SCHEMA:: [sasmeta] TO [svc_sasVAreadonly]
GO
