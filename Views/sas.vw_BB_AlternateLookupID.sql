SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_BB_AlternateLookupID]
AS
SELECT ID,
        ConstituentID,
        AlternateLookupIDType,
        AlternateLookupID,
        CAST(DateAdded AS DATE) DateAdded,
        CAST(DateChanged AS DATE) DateChanged
FROM ods.BB_ALTERNATELOOKUPID (NOLOCK)
GO
