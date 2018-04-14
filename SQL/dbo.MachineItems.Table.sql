USE [DavidVendingMachine]
GO
/****** Object:  Table [dbo].[MachineItems]    Script Date: 4/14/2018 12:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineItems](
	[ItemID] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[MachineID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[MachineItems]  WITH CHECK ADD  CONSTRAINT [FK_MachineItems_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[MachineItems] CHECK CONSTRAINT [FK_MachineItems_Items]
GO
ALTER TABLE [dbo].[MachineItems]  WITH CHECK ADD  CONSTRAINT [FK_MachineItems_Machines] FOREIGN KEY([MachineID])
REFERENCES [dbo].[Machines] ([ID])
GO
ALTER TABLE [dbo].[MachineItems] CHECK CONSTRAINT [FK_MachineItems_Machines]
GO
