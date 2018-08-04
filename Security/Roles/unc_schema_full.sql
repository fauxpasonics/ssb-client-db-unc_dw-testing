CREATE ROLE [unc_schema_full]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'unc_schema_full', N'ajohnston_unc.edu'
GO
EXEC sp_addrolemember N'unc_schema_full', N'nick_ramsclub.com'
GO
EXEC sp_addrolemember N'unc_schema_full', N'rick.root_unc.edu'
GO
EXEC sp_addrolemember N'unc_schema_full', N'rjmiller_unc.edu'
GO
EXEC sp_addrolemember N'unc_schema_full', N'scott_jackson_unc.edu'
GO
EXEC sp_addrolemember N'unc_schema_full', N'svcLogi'
GO
