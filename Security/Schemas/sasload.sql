CREATE SCHEMA [sasload]
AUTHORIZATION [dbo]
GO
GRANT DELETE ON SCHEMA:: [sasload] TO [svc_sasAppUser]
GO
GRANT EXECUTE ON SCHEMA:: [sasload] TO [svc_sasAppUser]
GO
GRANT INSERT ON SCHEMA:: [sasload] TO [svc_sasAppUser]
GO
GRANT SELECT ON SCHEMA:: [sasload] TO [svc_sasAppUser]
GO
GRANT UPDATE ON SCHEMA:: [sasload] TO [svc_sasAppUser]
GO
GRANT ALTER ON SCHEMA:: [sasload] TO [svc_saslimitschema]
GO
GRANT DELETE ON SCHEMA:: [sasload] TO [svc_saslimitschema]
GO
GRANT EXECUTE ON SCHEMA:: [sasload] TO [svc_saslimitschema]
GO
GRANT INSERT ON SCHEMA:: [sasload] TO [svc_saslimitschema]
GO
GRANT SELECT ON SCHEMA:: [sasload] TO [svc_saslimitschema]
GO
GRANT CREATE SEQUENCE ON SCHEMA:: [sasload] TO [svc_saslimitschema]
GO
GRANT REFERENCES ON SCHEMA:: [sasload] TO [svc_saslimitschema]
GO
GRANT ALTER ON SCHEMA:: [sasload] TO [svc_sasVAreadonly]
GO
GRANT DELETE ON SCHEMA:: [sasload] TO [svc_sasVAreadonly]
GO
GRANT EXECUTE ON SCHEMA:: [sasload] TO [svc_sasVAreadonly]
GO
GRANT INSERT ON SCHEMA:: [sasload] TO [svc_sasVAreadonly]
GO
GRANT SELECT ON SCHEMA:: [sasload] TO [svc_sasVAreadonly]
GO
GRANT UPDATE ON SCHEMA:: [sasload] TO [svc_sasVAreadonly]
GO
