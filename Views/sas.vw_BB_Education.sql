SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [sas].[vw_BB_Education]
AS
SELECT TOP 386  ID AS EducationID ,
        CAST(ConstituentID AS NVARCHAR(100)) ConstituentID ,
        TRY_CAST(CAST(( LEFT(DATEGRADUATED, 4) + '-' + SUBSTRING(DATEGRADUATED, 5, 2)
               + '-' + RIGHT(DATEGRADUATED, 2) ) AS NVARCHAR(20)) AS DATE) DateGraduated ,
        Degree ,
        DegreeType ,
        ClassOf ,
        Program ,
        Institution ,
        School ,
        Major ,
        CAST(ISPRIMARY AS INT) AS IsPrimary ,
        ConstituencyStatus
FROM    ods.BB_OTHEREDUCATION (NOLOCK)
UNION ALL
SELECT  ID AS EducationID ,
        ConstituentID ,
        TRY_CAST(( LEFT(DATEGRADUATED, 4) + '-' + SUBSTRING(DATEGRADUATED, 5, 2)
               + '-' + RIGHT(DATEGRADUATED, 2) ) AS NVARCHAR(20)) DateGraduated ,
        Degree ,
        DegreeType ,
        ClassOf ,
        Program ,
        'University of North Carolina' AS Institution ,
        School ,
        Major ,
        CAST(ISPRIMARY AS INT) AS IsPrimary ,
        ConstituencyStatus
FROM    ods.BB_UNCEDUCATION   (NOLOCK) 

GO
