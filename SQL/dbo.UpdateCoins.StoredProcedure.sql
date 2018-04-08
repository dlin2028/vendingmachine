USE [DavidVendingMachine]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCoins]    Script Date: 4/8/2018 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCoins] 
	-- Add the parameters for the stored procedure here
	@machineID uniqueidentifier, 
	@pennies int = 0,
	@nickels int,
	@dimes int,
	@quarters int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Machines
	SET Pennies = @pennies, Nickels = @nickels, Dimes = @dimes, Quarters = @quarters
	WHERE @machineID = ID
END

GO
