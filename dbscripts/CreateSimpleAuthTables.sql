/****** Object:  Table [dbo].[UserProfile]    Script Date: 12/06/2012 18:18:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create TABLE [dbo].[UserProfile](
    [UserId] [int] IDENTITY(1,1) NOT NULL,
    [UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
    [UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
    [UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 12/06/2012 18:18:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create TABLE [dbo].[webpages_Membership](
    [UserId] [int] NOT NULL,
    [CreateDate] [datetime] NULL,
    [ConfirmationToken] [nvarchar](128) NULL,
    [IsConfirmed] [bit] NULL,
    [LastPasswordFailureDate] [datetime] NULL,
    [PasswordFailuresSinceLastSuccess] [int] NOT NULL,
    [Password] [nvarchar](128) NOT NULL,
    [PasswordChangedDate] [datetime] NULL,
    [PasswordSalt] [nvarchar](128) NOT NULL,
    [PasswordVerificationToken] [nvarchar](128) NULL,
    [PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
    [UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO

ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO

/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 12/06/2012 18:19:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create TABLE [dbo].[webpages_OAuthMembership](
    [Provider] [nvarchar](30) NOT NULL,
    [ProviderUserId] [nvarchar](100) NOT NULL,
    [UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
    [Provider] ASC,
    [ProviderUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 12/06/2012 18:19:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create TABLE [dbo].[webpages_Roles](
    [RoleId] [int] IDENTITY(1,1) NOT NULL,
    [RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
    [RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
    [RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 12/06/2012 18:19:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[webpages_UsersInRoles](
    [UserId] [int] NOT NULL,
    [RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
    [UserId] ASC,
    [RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

alter TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO

ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO

ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO

ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO