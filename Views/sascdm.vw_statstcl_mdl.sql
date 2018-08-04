SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [sascdm].[vw_statstcl_mdl] as
select *
  from sascdm.statscl_mdl
GO
