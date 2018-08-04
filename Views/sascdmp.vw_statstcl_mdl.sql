SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [sascdmp].[vw_statstcl_mdl] as
select *
  from sascdmp.statscl_mdl
GO
