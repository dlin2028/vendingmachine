USE [DavidVendingMachine]
GO
/****** Object:  StoredProcedure [vend].[Register]    Script Date: 4/24/2018 4:44:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [vend].[Register] 
	-- Add the parameters for the stored procedure here
	@name nchar(10) = 0, 
	@machineID uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	IF EXISTS (SELECT 1 FROM Machines WHERE ID = @machineID)
	BEGIN

	UPDATE Machines
	SET Name = @name
	WHERE @machineID = ID

	END
	ELSE
	BEGIN

	INSERT INTO Machines (ID, Name)
	 VALUES (@machineID, @name)

	END

END
GO
