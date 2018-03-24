USE [DavidVendingMachine]
GO
/****** Object:  Table [dbo].[ItemInventories]    Script Date: 3/24/2018 12:34:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemInventories](
	[ID] [int] NOT NULL,
	[ItemsID] [int] NOT NULL,
 CONSTRAINT [PK_ItemInventories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ItemInventories]  WITH CHECK ADD  CONSTRAINT [FK_ItemInventories_Machines] FOREIGN KEY([ID])
REFERENCES [dbo].[Machines] ([ID])
GO
ALTER TABLE [dbo].[ItemInventories] CHECK CONSTRAINT [FK_ItemInventories_Machines]
GO
