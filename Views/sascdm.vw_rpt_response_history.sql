SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE view [sascdm].[vw_rpt_response_history] as
	select *
	  from sascdm.rpt_response_history
GO
