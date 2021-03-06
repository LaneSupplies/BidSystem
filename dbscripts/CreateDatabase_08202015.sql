USE [master]
GO
DROP DATABASE [Lane]
/****** Object:  Database [Lane]    Script Date: 8/20/2015 8:06:53 PM ******/
CREATE DATABASE [Lane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Lane.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Lane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Lane_log.ldf' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Lane] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lane] SET RECOVERY FULL 
GO
ALTER DATABASE [Lane] SET  MULTI_USER 
GO
ALTER DATABASE [Lane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lane] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Lane] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Lane', N'ON'
GO
USE [Lane]
GO
/****** Object:  Table [dbo].[Activity_Log]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Activity_Log](
	[Activity_Log_ID] [uniqueidentifier]  NOT NULL CONSTRAINT [DF_Activity_Log_ID]  DEFAULT (newid()),
	[Activity_Log_Date] [datetime] NOT NULL,
	[User_ID] [int] NULL,
	[Page] [varchar](40) NULL,
	[Action] [varchar](40) NULL,
	[Message] [varchar](200) NULL,
 CONSTRAINT [PK_Activity_Log] PRIMARY KEY CLUSTERED 
(
	[Activity_Log_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bid_Canopies]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bid_Canopies](
	[Bid_ID] [uniqueidentifier] NOT NULL,
	[Canopy_ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Bid_Canopies] PRIMARY KEY CLUSTERED 
(
	[Bid_ID] ASC,
	[Canopy_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bid_Notes]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bid_Notes](
	[Bid_Note_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Bid_Notes_ID]  DEFAULT (newid()),
	[Notes] [varchar](1000) NOT NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Bid_Notes] PRIMARY KEY CLUSTERED 
(
	[Bid_Note_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bid_Statuses]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bid_Statuses](
	[Bid_Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](40) NOT NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Bid_Statuses] PRIMARY KEY CLUSTERED 
(
	[Bid_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bid_To_Notes]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bid_To_Notes](
	[Bid_ID] [uniqueidentifier]  NOT NULL,
	[Bid_Note_ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Bid_To_Notes] PRIMARY KEY CLUSTERED 
(
	[Bid_ID] ASC,
	[Bid_Note_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bid_Types]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bid_Types](
	[Bid_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NOT NULL,
	[Code] [varchar](5) NOT NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Bid_Types] PRIMARY KEY CLUSTERED 
(
	[Bid_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bids]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bids](
	[Bid_ID] [uniqueidentifier]  NOT NULL CONSTRAINT [DF_Bid_ID]  DEFAULT (newid()),
	[Revision_Number] [int] NOT NULL,
	[Bid_Code] [varchar](10) NOT NULL,
	[Structure_Type_ID] [int] NOT NULL,
	[Bid_Status_ID] [int] NOT NULL,
	[Job_Type_ID] [int] NOT NULL,
	[Scope_Type_ID] [int] NOT NULL,
	[Bid_Type_ID] [int] NOT NULL,
	[Company_ID] [uniqueidentifier] NOT NULL,
	[Customer_ID] [uniqueidentifier] NOT NULL,
	[Customer_Contact_ID] [uniqueidentifier] NOT NULL,
	[Sales_Person_ID] [uniqueidentifier] NULL,
	[Site_ID] [uniqueidentifier] NULL,
	[Shipping_ID] [uniqueidentifier] NULL,
	[Special_Shipping_ID] [uniqueidentifier] NULL,
	[Alternate_Shipping_ID] [uniqueidentifier] NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
	[Modifed_By] [int] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Bids_1] PRIMARY KEY CLUSTERED 
(
	[Bid_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Canopies]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Canopies](
	[Canopy_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Canopy_ID]  DEFAULT (newid()),
	[Canopy_Code] [varchar](10) NULL,
	[Quantity] [int] NULL,
	[Size_Width_Measurement_ID] [uniqueidentifier] NOT NULL,
	[Size_Length_Measurement_ID] [uniqueidentifier] NOT NULL,
	[Clearance_Height_Measurement_ID] [uniqueidentifier] NOT NULL,
	[Column_Quantity] [int] NULL,
	[Column_Type_ID] [int] NULL,
	[Column_Type_Other] [varchar] (50) NULL,
	[Column_Size_Length_Measurement_ID] [uniqueidentifier] NULL,
	[Column_Size_Width_Measurement_ID] [uniqueidentifier] NULL,
	[Column_Size_Thickness_Measurement_ID] [uniqueidentifier] NULL,
	[Column_Size_OD_Measurement_ID] [uniqueidentifier] NULL,
	[Column_Size_Other] [varchar] (50) NULL,
	[Column_Spacing_Notes] [varchar](1000) NULL,
	[Deck_Style_ID] [int] NULL,
	[Deck_Type_ID] [int] NULL,
	[Deck_Color_ID] [int] NULL,
	[Deck_Thickness_Measurement_ID] [uniqueidentifier] NULL,
	[Deck_Gauge] [int] NULL,
	[Image_ID] [uniqueidentifier] NULL,
	[Fascia_Image_ID] [uniqueidentifier] NULL,
	[Fascia_Height_Measurement_ID] [uniqueidentifier] NULL,
	[Fascia_Type_ID] [int] NULL,
	[Fascia_Color_ID] [int] NULL,
	[Fascia_Info] [varchar](2000) NULL,
	[Facia_Thickness_Measurement_ID] [uniqueidentifier] NULL,
	[Drainage_Type_ID] [int] NULL,
	[Drainage_Measurement_ID] [uniqueidentifier] NULL,
	[Other_Notes] [varchar](2000) NULL,
	[Inclusion_Notes] [varchar](2000) NULL,
	[Exclusion_Notes] [varchar](2000) NULL,
	[General_Inclusion_Notes] [varchar](2000) NULL,
	[General_Exclusion_Notes] [varchar](2000) NULL,
	[Base_Price] [decimal](19, 4) NULL,
	[Material_Price] [decimal](19, 4) NULL,
	[Labor_Price] [decimal](19, 4) NULL,
	[Freight_Price] [decimal](19, 4) NULL,
	[Tax_Price] [decimal](19, 4) NULL,
	[Total_Price] [decimal](19, 4) NULL,
	[Alt_Base_Price] [decimal](19, 4) NULL,
	[Design_Loads_Live_Psf] [int] NULL,
	[Design_Load_Wind_Mph] [int] NULL,
	[Design_Load_Wind_Psf] [int] NULL,
	[Design_Load_Snow] [varchar](1000) NULL,
	[Design_Load_Spec] [varchar](1000) NULL,
	[Design_Load_Notes] [varchar](1000) NULL,
	[Drawing_Sealed] [bit] NULL DEFAULT ((0)),
	[Design_Specs] [varchar] (1000) NULL,
	[Has_Perimeter_Gutters] [bit] NULL DEFAULT ((0)),
	[Has_Center_Gutters] [bit] NULL DEFAULT ((0)),
	[Has_Internal_Gutters] [bit] NULL DEFAULT ((0)),
	[Has_External_Gutters] [bit] NULL DEFAULT ((0)),
	[Has_Scruppers] [bit] NULL DEFAULT ((0)),
	[Gutter_Notes] [varchar] (1000) NULL,
	[Drawing_State] [varchar](20) NULL,
	[Drawing_Code] [varchar](20) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
	[Modified_By] [int] NULL,
	[Modifed_Date] [datetime] NULL,
 CONSTRAINT [PK_Canopies] PRIMARY KEY CLUSTERED 
(
	[Canopy_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sites]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sites](
	[Site_ID] [uniqueidentifier]  NOT NULL CONSTRAINT [DF_Site_ID]  DEFAULT (newid()),
	[Main_Name] [varchar](5) NULL,
	[Sub_Name] [varchar](5) NULL,
	[Main_Name_Prefix] [varchar](3) NULL,
	[Main_Name_Suffix] [varchar](3) NULL,
	[Sub_Name_Prefix] [varchar](3) NULL,
	[Sub_Name_Suffix] [varchar](3) NULL,
	[Address_ID] [uniqueidentifier] NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Sites] PRIMARY KEY CLUSTERED 
(
	[Site_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Addresses](
	[Address_ID] [uniqueidentifier]  NOT NULL CONSTRAINT [DF_Address_ID]  DEFAULT (newid()),
	[Address_Line1] [varchar](150) NULL,
	[Address_Line2] [varchar](150) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](30) NULL,
	[Zip] [varchar](15) NULL,
	[Country] [varchar](30) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Colors](
	[Color_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Color_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Column_Spacing_Lengths]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Column_Spacing_Lengths](
	[Column_Spacing_Length_ID] [uniqueidentifier]  NOT NULL CONSTRAINT [DF_Length_ID]  DEFAULT (newid()),
	[Canopy_ID] [uniqueidentifier] NOT NULL,
	[Measurement_ID] [uniqueidentifier] NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_Column_Spacing_Lengths] PRIMARY KEY CLUSTERED 
(
	[Column_Spacing_Length_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Column_Spacing_Widths]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Column_Spacing_Widths](
	[Column_Spacing_Width_ID] [uniqueidentifier]  NOT NULL CONSTRAINT [DF_Width_ID]  DEFAULT (newid()),
	[Canopy_ID] [uniqueidentifier] NOT NULL,
	[Measurement_ID] [uniqueidentifier] NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_Column_Spacing_Widths] PRIMARY KEY CLUSTERED 
(
	[Column_Spacing_Width_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Column_Types]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Column_Types](
	[Column_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Column_Types] PRIMARY KEY CLUSTERED 
(
	[Column_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Company_ID] [uniqueidentifier]  NOT NULL CONSTRAINT [DF_Company_ID]  DEFAULT (newid()),
	[Company_Code] [varchar](10) NULL,
	[CompanyName] [varchar](50) NOT NULL,
	CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Company_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact_Text]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact_Text](
	[Contact_Text_ID] [uniqueidentifier]  NOT NULL CONSTRAINT [DF_Contact_Text_ID]  DEFAULT (newid()),
	[Contact_Type_ID] [int] NOT NULL,
	[Text] [varchar](100) NOT NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Contact_Text] PRIMARY KEY CLUSTERED 
(
	[Contact_Text_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact_Types]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact_Types](
	[Contact_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Contact_Types] PRIMARY KEY CLUSTERED 
(
	[Contact_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Customer_ID]  DEFAULT (newid()),
	[Company_ID] [int] NOT NULL,
	[Bid_Code] [varchar](7) NOT NULL,
	[Sales_Code] [varchar](7) NULL,
	[Company_Region_Name] [varchar](100) NULL,
	[Address_ID] [uniqueidentifier] NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer_Contact]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Contact](
	[Customer_Contact_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Customer_Contact_ID]  DEFAULT (newid()),
	[Customer_ID] [uniqueidentifier] NOT NULL,
	[First_Name] [varchar](75) NULL,
	[Last_Name] [varchar](75) NULL,
	[Email] [varchar](75) NULL,
 CONSTRAINT [PK_Customer_Contact] PRIMARY KEY CLUSTERED 
(
	[Customer_Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Contact_Text]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Contact_Text](
	[Customer_Contact_ID] [uniqueidentifier] NOT NULL,
	[Contact_Text_ID] [uniqueidentifier] NOT NULL,
	CONSTRAINT [PK_Customer_Contact_Text] PRIMARY KEY CLUSTERED 
(
	[Customer_Contact_ID] ASC,
	[Contact_Text_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Deck_Styles]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Deck_Styles](
	[Deck_Style_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Deck_Styles] PRIMARY KEY CLUSTERED 
(
	[Deck_Style_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Deck_Type]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Deck_Types](
	[Deck_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Deck_Type] PRIMARY KEY CLUSTERED 
(
	[Deck_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Drainage_Types]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Drainage_Types](
	[Drainage_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Drainage_Types] PRIMARY KEY CLUSTERED 
(
	[Drainage_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fascia_Types]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fascia_Types](
	[Fascia_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Fascia_Types] PRIMARY KEY CLUSTERED 
(
	[Fascia_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Images]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Images](
	[Image_ID] [uniqueidentifier]  NOT NULL CONSTRAINT [DF_Image_ID]  DEFAULT (newid()),
	[Image_Path] [varchar](100) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Image_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Job_Types]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job_Types](
	[Job_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [varchar](5) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Job_Types] PRIMARY KEY CLUSTERED 
(
	[Job_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Measurements]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurements](
	[Measurement_ID] [uniqueidentifier]  NOT NULL CONSTRAINT [DF_Measurement_ID]  DEFAULT (newid()),
	[Feet] [int] NULL,
	[Inches] [int] NULL,
	[Fractions_ID] [int] NULL,
 CONSTRAINT [PK_Measurements] PRIMARY KEY CLUSTERED 
(
	[Measurement_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fractions]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fractions](
	[Fractions_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](5) NULL
 CONSTRAINT [PK_Fractions_ID] PRIMARY KEY CLUSTERED 
(
	[Fractions_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales_Person_Contact_Text]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Person_Contact_Text](
	[Sales_Person_ID] [uniqueidentifier] NOT NULL,
	[Contact_Text_ID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Sales_Person_Contact_Text] PRIMARY KEY CLUSTERED 
(
	[Sales_Person_ID] ASC,
	[Contact_Text_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Persons]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales_Persons](
	[Sales_Person_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Sales_Person_ID]  DEFAULT (newid()),
	[Sales_Person_Code] [varchar](5) NULL,
	[First_Name] [varchar](75) NULL,
	[Last_Name] [varchar](75) NULL,
	[Address_ID] [uniqueidentifier] NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Sales_Persons] PRIMARY KEY CLUSTERED 
(
	[Sales_Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Scope_Types]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Scope_Types](
	[Scope_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Code] [varchar](5) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Scope_Types] PRIMARY KEY CLUSTERED 
(
	[Scope_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shipping_Info]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipping_Info](
	[Shipping_ID] [uniqueidentifier]  NOT NULL CONSTRAINT [DF_Shipping_ID]  DEFAULT (newid()),
	[Name] [varchar](75) NULL,
	[Address_ID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Shipping_Info] PRIMARY KEY CLUSTERED 
(
	[Shipping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Structure_Types]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Structure_Types](
	[Structure_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Created_By] [int] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Structure_Types] PRIMARY KEY CLUSTERED 
(
	[Structure_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
	[Email] [varchar](100) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 8/20/2015 8:06:54 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/**** Create References ************************/
ALTER TABLE [dbo].[Bid_Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Bid_Canopies_Canopies] FOREIGN KEY([Canopy_ID])
REFERENCES [dbo].[Canopies] ([Canopy_ID])
GO
ALTER TABLE [dbo].[Bid_Canopies] CHECK CONSTRAINT [FK_Bid_Canopies_Canopies]
GO
ALTER TABLE [dbo].[Bid_To_Notes]  WITH CHECK ADD  CONSTRAINT [FK_Bid_To_Notes_Bid_Notes] FOREIGN KEY([Bid_Note_ID])
REFERENCES [dbo].[Bid_Notes] ([Bid_Note_ID])
GO
ALTER TABLE [dbo].[Bid_To_Notes] CHECK CONSTRAINT [FK_Bid_To_Notes_Bid_Notes]
GO
ALTER TABLE [dbo].[Bid_To_Notes]  WITH CHECK ADD  CONSTRAINT [FK_Bid_To_Notes_Bids] FOREIGN KEY([Bid_ID])
REFERENCES [dbo].[Bids] ([Bid_ID])
GO
ALTER TABLE [dbo].[Bid_To_Notes] CHECK CONSTRAINT [FK_Bid_To_Notes_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Alternate_Shipping_Info_Bids] FOREIGN KEY([Alternate_Shipping_ID])
REFERENCES [dbo].[Shipping_Info] ([Shipping_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Alternate_Shipping_Info_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bid_Statuses_Bids] FOREIGN KEY([Bid_Status_ID])
REFERENCES [dbo].[Bid_Statuses] ([Bid_Status_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bid_Statuses_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bid_Types_Bids] FOREIGN KEY([Bid_Type_ID])
REFERENCES [dbo].[Bid_Types] ([Bid_Type_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bid_Types_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bids_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bids_Customer]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Job_Types_Bids] FOREIGN KEY([Job_Type_ID])
REFERENCES [dbo].[Job_Types] ([Job_Type_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Job_Types_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Persons_Bids] FOREIGN KEY([Sales_Person_ID])
REFERENCES [dbo].[Sales_Persons] ([Sales_Person_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Sales_Persons_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Scope_Types_Bids] FOREIGN KEY([Scope_Type_ID])
REFERENCES [dbo].[Scope_Types] ([Scope_Type_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Scope_Types_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Shipping_Info_Bids] FOREIGN KEY([Shipping_ID])
REFERENCES [dbo].[Shipping_Info] ([Shipping_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Shipping_Info_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Sites_Bids] FOREIGN KEY([Site_ID])
REFERENCES [dbo].[Sites] ([Site_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Sites_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Special_Shipping_Info_Bids] FOREIGN KEY([Special_Shipping_ID])
REFERENCES [dbo].[Shipping_Info] ([Shipping_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Special_Shipping_Info_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Structure_Types_Bids] FOREIGN KEY([Structure_Type_ID])
REFERENCES [dbo].[Structure_Types] ([Structure_Type_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Structure_Types_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Company_ID_Bids] FOREIGN KEY([Company_ID])
REFERENCES [dbo].[Company] ([Company_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Company_ID_Bids]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Contact_Bids] FOREIGN KEY([Customer_Contact_ID])
REFERENCES [dbo].[Customer_Contact] ([Customer_Contact_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Customer_Contact_Bids]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Canopies_Measurement_Size_Width] FOREIGN KEY([Size_Width_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Canopies_Measurement_Size_Width]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Canopies_Measurement_Size_Length] FOREIGN KEY([Size_Length_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Canopies_Measurement_Size_Length]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Canopies_Measurement_Clearance_Height] FOREIGN KEY([Clearance_Height_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Canopies_Measurement_Clearance_Height]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Canopies_Measurement_Column_Size_Length] FOREIGN KEY([Column_Size_Length_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Canopies_Measurement_Column_Size_Length]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Canopies_Measurement_Column_Size_Width] FOREIGN KEY([Column_Size_Width_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Canopies_Measurement_Column_Size_Width]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Canopies_Measurement_Column_Size_Thickness] FOREIGN KEY([Column_Size_Thickness_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Canopies_Measurement_Column_Size_Thickness]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Canopies_Measurement_Column_Size_OD] FOREIGN KEY([Column_Size_OD_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Canopies_Measurement_Column_Size_OD]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Canopies_Measurement_Deck_Thickness] FOREIGN KEY([Deck_Thickness_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Canopies_Measurement_Deck_Thickness]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Canopies_Fascia_Image] FOREIGN KEY([Fascia_Image_ID])
REFERENCES [dbo].[Images] ([Image_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Canopies_Fascia_Image]
GO

ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Canopies_Measurement_Fascia_Height] FOREIGN KEY([Fascia_Height_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Canopies_Measurement_Fascia_Height]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Canopies_Measurement_Drainage] FOREIGN KEY([Drainage_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Canopies_Measurement_Drainage]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Colors_Canopy_1] FOREIGN KEY([Deck_Color_ID])
REFERENCES [dbo].[Colors] ([Color_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Colors_Canopy_1]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Colors_Canopy_2] FOREIGN KEY([Fascia_Color_ID])
REFERENCES [dbo].[Colors] ([Color_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Colors_Canopy_2]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Column_Types_Canopy] FOREIGN KEY([Column_Type_ID])
REFERENCES [dbo].[Column_Types] ([Column_Type_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Column_Types_Canopy]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Deck_Styles_Canopy] FOREIGN KEY([Deck_Style_ID])
REFERENCES [dbo].[Deck_Styles] ([Deck_Style_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Deck_Styles_Canopy]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Deck_Type_Canopy] FOREIGN KEY([Deck_Type_ID])
REFERENCES [dbo].[Deck_Types] ([Deck_Type_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Deck_Styles_Canopy]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Drainage_Measurement_Canopy] FOREIGN KEY([Drainage_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Drainage_Measurement_Canopy]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Drainage_Types_Canopy] FOREIGN KEY([Drainage_Type_ID])
REFERENCES [dbo].[Drainage_Types] ([Drainage_Type_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Drainage_Types_Canopy]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Fascia_Types_Canopy] FOREIGN KEY([Fascia_Type_ID])
REFERENCES [dbo].[Fascia_Types] ([Fascia_Type_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Fascia_Types_Canopy]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Fascia_Thickness_Canopy] FOREIGN KEY([Facia_Thickness_Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Fascia_Thickness_Canopy]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Images_Canopy] FOREIGN KEY([Image_ID])
REFERENCES [dbo].[Images] ([Image_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Images_Canopy]
GO
ALTER TABLE [dbo].[Column_Spacing_Lengths]  WITH CHECK ADD  CONSTRAINT [FK_Column_Spacing_Lengths_Measurements] FOREIGN KEY([Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Column_Spacing_Lengths] CHECK CONSTRAINT [FK_Column_Spacing_Lengths_Measurements]
GO

ALTER TABLE [dbo].[Column_Spacing_Lengths]  WITH CHECK ADD  CONSTRAINT [FK_Column_Spacing_Lengths_Canopy] FOREIGN KEY([Canopy_ID])
REFERENCES [dbo].[Canopies] ([Canopy_ID])
GO
ALTER TABLE [dbo].[Column_Spacing_Lengths] CHECK CONSTRAINT [FK_Column_Spacing_Lengths_Canopy]
GO

ALTER TABLE [dbo].[Column_Spacing_Widths]  WITH CHECK ADD  CONSTRAINT [FK_Column_Spacing_Widths_Measurements] FOREIGN KEY([Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Column_Spacing_Widths] CHECK CONSTRAINT [FK_Column_Spacing_Widths_Measurements]
GO

ALTER TABLE [dbo].[Column_Spacing_Widths]  WITH CHECK ADD  CONSTRAINT [FK_Column_Spacing_Widths_Canopy] FOREIGN KEY([Canopy_ID])
REFERENCES [dbo].[Canopies] ([Canopy_ID])
GO
ALTER TABLE [dbo].[Column_Spacing_Widths] CHECK CONSTRAINT [FK_Column_Spacing_Widths_Canopy]
GO

ALTER TABLE [dbo].[Contact_Text]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Text_Contact_Types] FOREIGN KEY([Contact_Type_ID])
REFERENCES [dbo].[Contact_Types] ([Contact_Type_ID])
GO
ALTER TABLE [dbo].[Contact_Text] CHECK CONSTRAINT [FK_Contact_Text_Contact_Types]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Addresses] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[Addresses] ([Address_ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Addresses]
GO
ALTER TABLE [dbo].[Customer_Contact_Text]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Contact_Text_Contact_Text] FOREIGN KEY([Contact_Text_ID])
REFERENCES [dbo].[Contact_Text] ([Contact_Text_ID])
GO
ALTER TABLE [dbo].[Customer_Contact_Text] CHECK CONSTRAINT [FK_Customer_Contact_Text_Contact_Text]
GO

ALTER TABLE [dbo].[Customer_Contact]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Contact_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Customer_Contact] CHECK CONSTRAINT [FK_Customer_Contact_Customer]
GO

ALTER TABLE [dbo].[Customer_Contact_Text]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Contact_Text_Customer] FOREIGN KEY([Customer_Contact_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Customer_Contact_Text] CHECK CONSTRAINT [FK_Customer_Contact_Text_Customer]
GO
ALTER TABLE [dbo].[Sales_Person_Contact_Text]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Person_Contact_Text_Contact_Text] FOREIGN KEY([Contact_Text_ID])
REFERENCES [dbo].[Contact_Text] ([Contact_Text_ID])
GO
ALTER TABLE [dbo].[Sales_Person_Contact_Text] CHECK CONSTRAINT [FK_Sales_Person_Contact_Text_Contact_Text]
GO
ALTER TABLE [dbo].[Sales_Person_Contact_Text]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Person_Contact_Text_Sales_Persons] FOREIGN KEY([Sales_Person_ID])
REFERENCES [dbo].[Sales_Persons] ([Sales_Person_ID])
GO
ALTER TABLE [dbo].[Sales_Person_Contact_Text] CHECK CONSTRAINT [FK_Sales_Person_Contact_Text_Sales_Persons]
GO
ALTER TABLE [dbo].[Sales_Persons]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Person_Address] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[Addresses] ([Address_ID])
GO
ALTER TABLE [dbo].[Sales_Persons] CHECK CONSTRAINT [FK_Sales_Person_Address]
GO
ALTER TABLE [dbo].[Sites]  WITH CHECK ADD  CONSTRAINT [FK_Sites_Addresses] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[Addresses] ([Address_ID])
GO
ALTER TABLE [dbo].[Sites] CHECK CONSTRAINT [FK_Sites_Addresses]
GO
ALTER TABLE [dbo].[Measurements]  WITH CHECK ADD  CONSTRAINT [fk_Measurements_Fractions] FOREIGN KEY([Fractions_ID])
REFERENCES [dbo].[Fractions] ([Fractions_ID])
GO
ALTER TABLE [dbo].[Measurements] CHECK CONSTRAINT [fk_Measurements_Fractions]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
/****** Object:  StoredProcedure [dbo].[BidSearch]    Script Date: 8/20/2015 8:06:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BidSearch] 
	-- Add the parameters for the stored procedure here
	@BidId [uniqueidentifier] = '00000000-0000-0000-0000-000000000000', 
	@StructTypeId int = 0,
	@SiteId [uniqueidentifier] = '00000000-0000-0000-0000-000000000000',
	@BidStatusId int = 0,
	@JobTypeId int = 0

AS
BEGIN
	SELECT BI.Bid_ID
		  ,BI.Bid_Status_ID
		  ,BI.Structure_Type_ID
		  ,BI.Revision_Number
		  ,BI.Bid_Type_ID
		  ,BI.Customer_ID
		  ,BI.Site_ID
		  ,SI.Main_Name_Prefix + '-' + SI.Main_Name + '-' + SI.Main_Name_Suffix as Main_Site_Name
		  ,SI.Sub_Name_Prefix + '-' + SI.Sub_Name + '-' + SI.Sub_Name_Suffix as Main_Site_Name
		  ,BI.Job_Type_ID
		  ,BI.Sales_Person_ID
		  ,ST.Name as Structure_Type_Name
		  ,JT.Name as Job_Type_Name
		  ,BS.Status as Bid_Status_Name
		  ,AD.Address_Line1 as Address_Line
		  ,AD.City as City
		  ,AD.State as State
	FROM Bids BI
		,Structure_Types ST
		,Job_Types JT
		,Sites SI
		,Bid_Statuses BS
		,Addresses AD
	WHERE BI.Structure_Type_ID = ST.Structure_Type_ID
	  AND BI.Bid_Status_ID = BS.Bid_Status_ID
	  AND BI.Site_ID = SI.Site_ID
	  AND BI.Job_Type_ID = JT.Job_Type_ID
	  AND (BI.Shipping_ID = AD.Address_ID 
		OR SI.Address_ID = AD.Address_ID)
	  AND (BI.Bid_ID = @BidId 
	    OR ST.Structure_Type_ID = @StructTypeId 
		OR JT.Job_Type_ID = @JobTypeId 
		OR SI.Site_ID = @SiteId
		OR BS.Bid_Status_ID = @BidStatusId)
	
END



GO
USE [master]
GO
ALTER DATABASE [Lane] SET  READ_WRITE 
GO
