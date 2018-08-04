SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [sas].[proc_Neulion_Donation]
AS

DECLARE @AllGiftsCY NVARCHAR(50) = CONCAT('AllGifts',RIGHT(CAST(YEAR(GETDATE()) AS NVARCHAR(4)),2))
DECLARE @AllGiftsPY NVARCHAR(50) = CONCAT('AllGifts',RIGHT(CAST((YEAR(GETDATE())-1) AS NVARCHAR(4)),2))
DECLARE @StatusCY NVARCHAR(50) = CONCAT('Status',RIGHT(CAST(YEAR(GETDATE()) AS NVARCHAR(4)),2))
DECLARE @StatusPY NVARCHAR(50) = CONCAT('Status',RIGHT(CAST((YEAR(GETDATE())-1) AS NVARCHAR(4)),2))
DECLARE @PledgeCY NVARCHAR(50) = CONCAT('Pledge',RIGHT(CAST(YEAR(GETDATE()) AS NVARCHAR(4)),2))
DECLARE @PledgePY NVARCHAR(50) = CONCAT('Pledge',RIGHT(CAST((YEAR(GETDATE())-1) AS NVARCHAR(4)),2))
DECLARE @PaidCY NVARCHAR(50) = CONCAT('AllGifts',RIGHT(CAST(YEAR(GETDATE()) AS NVARCHAR(4)),2))
DECLARE @PaidPY NVARCHAR(50) = CONCAT('AllGifts',RIGHT(CAST((YEAR(GETDATE())-1) AS NVARCHAR(4)),2))
DECLARE @BalanceCY NVARCHAR(50) = CONCAT('AllGifts',RIGHT(CAST(YEAR(GETDATE()) AS NVARCHAR(4)),2))
DECLARE @BalancePY NVARCHAR(50) = CONCAT('AllGifts',RIGHT(CAST((YEAR(GETDATE())-1) AS NVARCHAR(4)),2))

TRUNCATE TABLE dbo.Neulion_Donation

INSERT INTO dbo.Neulion_Donation
        ( MemberID ,
          AccountStatus ,
          Rank ,
          Points ,
          LifetimeGivingAmount ,
          LifetimePledges ,
          LifetimePaid ,
          LargestGiftAmount ,
          LargestGiftDate ,
          LargestGiftFund ,
          FirstPaidDateToAnnualFund ,
          LastPaidDateToAnnualFund ,
          LastFYPaidToAnnualFund ,
          AllGiftsCY ,
          StatusCY ,
          PledgeCY ,
          PaidCY ,
          BalanceCY ,
          AllGiftsPY ,
          StatusPY ,
          PledgePY ,
          PaidPY ,
          BalancePY ,
          UpdatedDate
        )


SELECT MemberID
	, AccountStatus
	, [Rank]
	, Points
	, LifetimeGivingAmount
	, LifetimePledges
	, LifetimePaid
	, LargestGiftAmount
	, LargestGiftDate
	, LargestGiftFund
	, FirstPaidDateToAnnualFund
	, LastPaidDateToAnnualFund
	, LastFYPaidToAnnualFund
	, @AllGiftsCY AS AllGiftsCY
	, @StatusCY AS StatusCY
	, @PledgeCY AS StatusCY
	, @PaidCY AS PaidCY
	, @BalanceCY AS BalanceCY
	, @AllGiftsPY AS AllGiftsPY
	, @StatusPY AS StatusPY
	, @PledgePY AS StatusPY
	, @PaidPY AS PaidPY
	, @BalancePY AS BalancePY
	, GETDATE() AS UpdatedDate
FROM ods.Neulion_Donation
GO
