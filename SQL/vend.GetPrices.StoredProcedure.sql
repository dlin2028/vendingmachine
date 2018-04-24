USE [DavidVendingMachine]
GO
/****** Object:  StoredProcedure [vend].[GetPrices]    Script Date: 4/24/2018 4:44:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [vend].[GetPrices] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Name, Price FROM Items
END

GO
