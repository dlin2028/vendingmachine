USE [DavidVendingMachine]
GO
/****** Object:  StoredProcedure [vend].[UpdateCoins]    Script Date: 4/14/2018 12:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [vend].[UpdateCoins] 
	-- Add the parameters for the stored procedure here
	@machineID uniqueidentifier, 
	@pennies int,
	@nickels int,
	@dimes int,
	@quarters int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT 1 FROM Machines WHERE ID = @machineID)
	BEGIN

	UPDATE Machines
	SET Pennies = @pennies, Nickels = @nickels, Dimes = @dimes, Quarters = @quarters
	WHERE @machineID = ID

	END
	ELSE
	BEGIN

	INSERT INTO Machines (ID, Quarters, Nickels, Dimes, Pennies)
	 VALUES (@machineID, @quarters, @nickels, @dimes, @pennies)

	END
END

GO
