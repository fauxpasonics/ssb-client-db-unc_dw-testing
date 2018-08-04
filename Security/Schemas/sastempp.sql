CREATE SCHEMA [sastempp]
AUTHORIZATION [ssb_ksniffin]
GO
GRANT SELECT ON SCHEMA:: [sastempp] TO [sas_pdixon]
GO
GRANT SELECT ON SCHEMA:: [sastempp] TO [sas_rmarla]
GO
GRANT SELECT ON SCHEMA:: [sastempp] TO [svc_sasAppUser]
GO
GRANT SELECT ON SCHEMA:: [sastempp] TO [svc_saslimitschema]
GO
GRANT ALTER ON SCHEMA:: [sastempp] TO [svc_saslimitschema]
GO
GRANT CONTROL ON SCHEMA:: [sastempp] TO [svc_saslimitschema]
GO
GRANT CREATE SEQUENCE ON SCHEMA:: [sastempp] TO [svc_saslimitschema]
GO
GRANT DELETE ON SCHEMA:: [sastempp] TO [svc_saslimitschema]
GO
GRANT EXECUTE ON SCHEMA:: [sastempp] TO [svc_saslimitschema]
GO
GRANT INSERT ON SCHEMA:: [sastempp] TO [svc_saslimitschema]
GO
GRANT UPDATE ON SCHEMA:: [sastempp] TO [svc_saslimitschema]
GO
GRANT REFERENCES ON SCHEMA:: [sastempp] TO [svc_sasVAreadonly]
GO
GRANT SELECT ON SCHEMA:: [sastempp] TO [svc_sasVAreadonly]
GO
