SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE FUNCTION [dbo].[fnContactTypeRank]
(
	@ContactClass CHAR(1) --A (Address), P (Phone), E(Email)
)

RETURNS @Result TABLE 
(  
	ContactType	VARCHAR(25),
    PriorityRank INT
) 
AS
BEGIN

	IF (@ContactClass = 'A')
	BEGIN

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('H', 1)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('B', 2)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('BG', 3)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('TB', 4)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('WC', 5)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('A', 6)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('WC1', 7)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('ACC1', 8)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('FF16', 9)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('ACC2', 10)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('MFF1', 11)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('ACC3', 12)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('MFF', 13)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('MFF2', 14)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('ACC4', 15)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('MFF3', 16)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('MFF4', 17)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('ACC5', 18)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('MFF5', 19)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('MFF6', 20)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('ACC6', 21)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('MFF7', 22)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('MFF8', 23)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('MFF9', 24)
		
	END	

	ELSE IF (@ContactClass = 'P')
	BEGIN

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('B', 1)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('H', 2)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('M', 3)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('P', 4)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('E', 5)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('F', 6)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('SE', 7)

	END

	ELSE IF (@ContactClass = 'E')
	BEGIN

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('E', 1)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('SE', 2)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('B', 3)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('H', 4)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('M', 5)

		INSERT INTO @Result (ContactType, PriorityRank)
		VALUES ('P', 6)


	END


	RETURN

END








GO
