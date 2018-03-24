USE [DavidVendingMachine]
GO
/****** Object:  Table [dbo].[Machines]    Script Date: 3/24/2018 12:34:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Machines](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Location] [geography] NOT NULL,
	[Quarters] [int] NOT NULL,
	[Dimes] [int] NOT NULL,
	[Nickels] [int] NOT NULL,
	[Pennies] [int] NOT NULL,
 CONSTRAINT [PK_Machines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
