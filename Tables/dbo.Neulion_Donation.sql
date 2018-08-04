CREATE TABLE [dbo].[Neulion_Donation]
(
[MemberID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountStatus] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rank] [bigint] NULL,
[Points] [int] NULL,
[LifetimeGivingAmount] [decimal] (15, 2) NULL,
[LifetimePledges] [decimal] (15, 2) NULL,
[LifetimePaid] [decimal] (15, 2) NULL,
[LargestGiftAmount] [decimal] (15, 2) NULL,
[LargestGiftDate] [date] NULL,
[LargestGiftFund] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstPaidDateToAnnualFund] [date] NULL,
[LastPaidDateToAnnualFund] [date] NULL,
[LastFYPaidToAnnualFund] [int] NULL,
[AllGiftsCY] [decimal] (15, 2) NULL,
[StatusCY] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PledgeCY] [decimal] (15, 2) NULL,
[PaidCY] [decimal] (15, 2) NULL,
[BalanceCY] [decimal] (15, 2) NULL,
[AllGiftsPY] [decimal] (15, 2) NULL,
[StatusPY] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PledgePY] [decimal] (15, 2) NULL,
[PaidPY] [decimal] (15, 2) NULL,
[BalancePY] [decimal] (15, 2) NULL,
[UpdatedDate] [datetime] NULL
)
GO
