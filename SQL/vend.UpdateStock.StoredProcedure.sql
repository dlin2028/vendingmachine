USE [DavidVendingMachine]
GO
/****** Object:  StoredProcedure [vend].[UpdateStock]    Script Date: 3/24/2018 12:34:00 PM ******/
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
@MachineID int,
@ItemID int,
@Count int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE MachineItems SET Count = @Count WHERE MachineID = @MachineID and ItemID = @ItemID 
END


GO
