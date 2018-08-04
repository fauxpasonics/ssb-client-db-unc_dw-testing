CREATE ROLE [sas_schema_ro]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'sas_schema_ro', N'ajohnston_unc.edu'
GO
EXEC sp_addrolemember N'sas_schema_ro', N'nick_ramsclub.com'
GO
EXEC sp_addrolemember N'sas_schema_ro', N'rick.root_unc.edu'
GO
EXEC sp_addrolemember N'sas_schema_ro', N'rjmiller_unc.edu'
GO
EXEC sp_addrolemember N'sas_schema_ro', N'scott_jackson_unc.edu'
GO
