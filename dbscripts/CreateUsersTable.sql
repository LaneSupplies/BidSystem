USE [Lane]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 6/8/2014 7:30:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Users](
	[User_ID] [uniqueidentifier] NOT NULL,
	[Company_Name] [varchar](100) NULL,
	[First_Name] [varchar](75) NULL,
	[Last_Name] [varchar](75) NULL,
	[Login_ID] [varchar](20) NULL,
	[Email] [varchar](75) NULL,
	[Contacts_ID] [int] NULL,
	[Address_ID] [int] NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NULL	
	
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DEF_Users_User_ID]  DEFAULT (newid()) FOR [User_ID]
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [Addresses_Users] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[Addresses] ([Address_ID])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Addresses_Users]
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [Contact_Lists_Users] FOREIGN KEY([Contacts_ID])
REFERENCES [dbo].[Contact_Lists] ([Contacts_ID])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Contact_Lists_Users]
GO


