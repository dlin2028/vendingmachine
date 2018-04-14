USE [DavidVendingMachine]
GO
/****** Object:  Table [dbo].[Machines]    Script Date: 4/14/2018 12:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Machines](
	[Name] [nchar](10) NULL,
	[Location] [geography] NULL,
	[Quarters] [int] NOT NULL,
	[Dimes] [int] NOT NULL,
	[Nickels] [int] NOT NULL,
	[Pennies] [int] NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Machines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
