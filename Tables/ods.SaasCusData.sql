CREATE TABLE [ods].[SaasCusData]
(
[SaasCusData_SK] [int] NOT NULL IDENTITY(1, 1),
[BusinessKey_Hash] [binary] (64) NOT NULL,
[Attribute_Hash] [binary] (64) NULL,
[Member ID] [int] NULL,
[District Abbr] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Davie ID] [nvarchar] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [nvarchar] (31) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Primary Contact] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[SR Years] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Previous Types of Payment] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Years as Student Ram] [nvarchar] (65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF Sign Up] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMG Staff Member] [nvarchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMG Signup] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date of Birth] [nvarchar] (34) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number of Courtside Passes (Men's Basketball)] [int] NULL,
[Number of Peebles Passes (Men's Basketball)] [int] NULL,
[Date Joined] [nvarchar] (26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF16] [nvarchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF15] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF14] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF13] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF12] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF11] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DQ AF10] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Endowed Scholarships] [nvarchar] (37) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WE Prospect Rating] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WE Net Worth] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WE Gift Capacity Range] [nvarchar] (44) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Abilitec ID] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Abilitec ID Duplicate?] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Consecutive Years Giving] [int] NULL,
[Total Years Giving] [int] NULL,
[ExecBoard] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BoardAdvisors] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PastPresident] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Board of Trustees] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Big Hitter] [nvarchar] (26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Campaigns] [nvarchar] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Communication Received] [nvarchar] (124) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active Date] [datetime] NULL,
[Last Login Date] [datetime] NULL,
[RC Primary Title] [nvarchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Primary First] [nvarchar] (28) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Primary Middle] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Primary Last] [nvarchar] (53) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Primary Suf] [nvarchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Primary Salutation] [nvarchar] (28) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Secondary Title] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Secondary First] [nvarchar] (26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Secondary Middle] [nvarchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Secondary Last] [nvarchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Secondary Suf] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Secondary Salutation] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Secondary Maiden] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Contact Info Notes] [nvarchar] (84) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Other Account Name] [nvarchar] (47) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Business Name] [nvarchar] (53) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Referring Member (and his/her hometown)] [nvarchar] (71) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Donor Status Mod Date] [datetime] NULL,
[Secondary Contact] [int] NULL,
[Prospect Stage] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonID] [int] NULL,
[PersonFirstName] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonNickName] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonMiddleName] [nvarchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonLastName] [nvarchar] (53) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonSuffix] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Constituencies] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sports] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email1Email] [nvarchar] (49) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email1Type] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email1IsPrimary] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone1Phone] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone1Type] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone2Phone] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone2Type] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone3Phone] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone3Type] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1Type] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1Line1] [nvarchar] (47) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1Line2] [nvarchar] (42) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1City] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1State] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1Zip] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1IsPrimary] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Work1Company] [nvarchar] (55) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Edu1SchoolName] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Edu1Year] [int] NULL,
[Edu1Degree] [nvarchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Edu2SchoolName] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Edu2Year] [int] NULL,
[Edu2Degree] [nvarchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GTCapacityScore] [nvarchar] (28) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GTDonorScore] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GTLifetimeAmount] [money] NULL,
[GTLargest Gift Amount] [money] NULL,
[GTLargest Gift Date] [datetime] NULL,
[GTLARGESTGIFTLABEL] [nvarchar] (92) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GTLASTGIFTAMOUNT] [int] NULL,
[GTLastGiftDate] [datetime] NULL,
[GTLASTGIFTLABEL] [int] NULL,
[GTGiftTotal2017] [money] NULL,
[GTGiftTotal2016] [money] NULL,
[GTGiftTotal2015] [money] NULL,
[GTGiftTotal2014] [money] NULL,
[GTGiftTotal2013] [money] NULL,
[GTGiftTotal2012] [money] NULL,
[GTGiftTotal2011] [money] NULL,
[GTGiftTotal2010] [money] NULL,
[GTGiftTotal2009] [money] NULL,
[Assignee1Name] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assignee1ID] [int] NULL,
[Assignee1Stage] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assignee1Type] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assignee2Name] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assignee2ID] [int] NULL,
[Assignee2Stage] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assignee2Type] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Spouse Name] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Points] [money] NULL,
[Rank] [int] NULL,
[Current Year Giving Level] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Current Year Pledge] [money] NULL,
[Current Year Paid] [money] NULL,
[Current Year Balance] [money] NULL,
[Last Annual Fund Gift] [datetime] NULL,
[Upgrade/Downgrade] [nvarchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Previous Year Giving Level] [nvarchar] (17) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Has MB Tickets] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MB Parking Location(s)] [nvarchar] (59) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Has MB Parking] [int] NULL,
[MB Ticket Location(s)] [nvarchar] (125) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Has FB Tickets] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FB Ticket Location(s)] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Has FB Parking] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FB Parking Location(s)] [nvarchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Major Gift Prospect] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Donor Groups] [int] NULL,
[Years Upgraded] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Years Downgraded] [nvarchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Years 110%] [int] NULL,
[Inactivation Date] [datetime] NULL,
[Inactivation Reason] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNC All Time Giving] [money] NULL,
[UNC Prospect Manager] [nvarchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNC Prospect Rating] [nvarchar] (62) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNC Alumnus Constituency] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Chapter Name] [nvarchar] (28) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[District Name] [nvarchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DonorStatusModDate] [datetime] NULL,
[First Paid to Annual] [datetime] NULL,
[Last Paid to Annual] [datetime] NULL,
[AF17 Retention] [nvarchar] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF16 Retention] [nvarchar] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF15 Retention] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF14 Retention] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF13 Retention] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF12 Retention] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF11 Retention] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF10 Retention] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF09 Retention] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF08 Retention] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF07 Retention] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AF06 Retention] [int] NULL,
[Referring Member] [nvarchar] (71) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number Referred Members] [int] NULL,
[Value Referred Members] [int] NULL,
[Referral Credit Issued] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New Member Call] [int] NULL,
[Promo Code] [nvarchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Need to contact donor] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assigned need to contact] [nvarchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNC Athletics Staff] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prefer ecommunication] [nvarchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Do Not Solicit] [nvarchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Only eBill] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Do Not Email] [nvarchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Do Not Mail] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Do Not Call] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Do Not SMS] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Membership Packet Sent Date] [nvarchar] (26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RC Special Code] [nvarchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ROW_NUM] [int] NOT NULL,
[EFF_BEG_DATE] [date] NULL,
[EFF_END_DATE] [date] NOT NULL,
[ETL_CREATED_DATE] [datetime] NOT NULL,
[ETL_LUPDATED_DATE] [datetime] NOT NULL
)
GO
ALTER TABLE [ods].[SaasCusData] ADD CONSTRAINT [PK__SaasCusD__5106590E84B8855D] PRIMARY KEY CLUSTERED  ([BusinessKey_Hash], [ROW_NUM], [EFF_END_DATE])
GO
