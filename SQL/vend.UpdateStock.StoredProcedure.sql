USE [DavidVendingMachine]
GO
/****** Object:  StoredProcedure [vend].[UpdateStock]    Script Date: 4/8/2018 4:33:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [vend].[UpdateStock]
@MachineID uniqueidentifier,
@ItemName nchar(100),
@Count int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @itemID int
	SET @itemID = (SELECT TOP 1 ItemID FROM Items WHERE @ItemName = Name)

	UPDATE MachineItems
	SET Count = @Count 
	WHERE MachineID = @MachineID and ItemID = @itemID 
END



GO
