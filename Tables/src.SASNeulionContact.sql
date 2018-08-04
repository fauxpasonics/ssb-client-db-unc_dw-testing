CREATE TABLE [src].[SASNeulionContact]
(
[Member ID] [int] NULL,
[Account Status] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Chapter Name] [nvarchar] (31) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[District Abbr] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Davie ID] [int] NULL,
[Name] [nvarchar] (65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [nvarchar] (31) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Primary Contact] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Donor Status] [nvarchar] (46) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Years Received YA Credit] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Highest Giving Level Requirement] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employer (Touchpoints)] [nvarchar] (53) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title (Touchpoints)] [nvarchar] (119) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Matching Gift Ratio (Touchpoints)] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Match Min (Touchpoints)] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Match Max (Touchpoints)] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Years the Donor Has Upgraded] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Years the Donor has Downgraded] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Years the Donor has given 110%] [int] NULL,
[SR Years] [int] NULL,
[Previous Types of Payment] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Years as Student Ram] [nvarchar] (65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF Sign Up] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMG Staff Member] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMG Signup] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Donor Status Mod Date] [datetime] NULL,
[Referral Member ID] [int] NULL,
[Date of Birth] [nvarchar] (34) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active Date] [datetime] NULL,
[Last Login Date] [datetime] NULL,
[Number of Courtside Passes (Men's Basketball)] [int] NULL,
[Number of Peebles Passes (Men's Basketball)] [int] NULL,
[Date Joined] [nvarchar] (26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF16] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF15] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF14] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF13] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF12] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF11] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF10] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Endowed Scholarships] [nvarchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WE Prospect Rating] [nvarchar] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WE Net Worth] [nvarchar] (28) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WE Gift Capacity Range] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Abilitec ID] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Abilitec ID Duplicate?] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[First Name] [nvarchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Middle Init] [nvarchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last Name] [nvarchar] (53) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name Suffix] [nvarchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Spouse Name] [nvarchar] (53) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Spouse Title] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bill Address1] [nvarchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bill Address2] [nvarchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bill City] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bill State Prov] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bill Zip Code] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bill Country] [nvarchar] (43) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email Address] [nvarchar] (67) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Home Phone] [nvarchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Business Phone] [nvarchar] (29) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bus. Ext] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cell Phone] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [nvarchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Consecutive Years Giving] [int] NULL,
[Total Years Giving] [int] NULL,
[Name/Phone/Email Mod Date] [datetime] NULL,
[Most Recent Contact Change Date] [datetime] NULL,
[ExecBoard] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BoardAdvisors] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PastPresident] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Board of Trustees] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Big Hitter] [nvarchar] (26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_LUpdated_Date] [datetime] NULL,
[ETL_Created_Date] [datetime] NULL
)
GO
