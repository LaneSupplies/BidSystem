USE [master]
GO
/****** Object:  Database [Lane]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE DATABASE [Lane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Lane.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Lane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Lane_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Activity_Log]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Activity_Log](
	[Activity_Log_ID] [uniqueidentifier] NOT NULL,
	[Activity_Log_Date] [datetime] NULL,
	[User_ID] [uniqueidentifier] NULL,
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
/****** Object:  Table [dbo].[Addresses]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Addresses](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Bid_Canopies]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bid_Canopies](
	[Bids_Bid_ID] [int] NOT NULL,
	[Canopies_Canopy_ID] [int] NOT NULL,
 CONSTRAINT [PK_Bid_Canopies] PRIMARY KEY CLUSTERED 
(
	[Bids_Bid_ID] ASC,
	[Canopies_Canopy_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bid_Notes]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bid_Notes](
	[Bid_Note_ID] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [varchar](80) NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Bid_Notes] PRIMARY KEY CLUSTERED 
(
	[Bid_Note_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bid_Statuses]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bid_Statuses](
	[Bid_Status_ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](40) NULL,
	[Create_Date] [datetime] NULL,
	[Created_By] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Bid_Statuses] PRIMARY KEY CLUSTERED 
(
	[Bid_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bid_To_Notes]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bid_To_Notes](
	[Bid_ID] [int] NOT NULL,
	[Bid_Note_ID] [int] NOT NULL,
 CONSTRAINT [PK_Bid_To_Notes] PRIMARY KEY CLUSTERED 
(
	[Bid_ID] ASC,
	[Bid_Note_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bid_Types]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bid_Types](
	[Bid_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Create_Date] [datetime] NULL,
	[Created_By] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Bid_Types] PRIMARY KEY CLUSTERED 
(
	[Bid_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bids]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bids](
	[Bid_ID] [int] NOT NULL,
	[Revision_Number] [int] NOT NULL,
	[Bid_Type_ID] [int] NOT NULL,
	[Bid_Status_ID] [int] NOT NULL,
	[Job_Type_ID] [int] NOT NULL,
	[Scope_Type_ID] [int] NOT NULL,
	[Bio_Type_ID] [int] NOT NULL,
	[Customer_ID] [uniqueidentifier] NULL,
	[Sales_Person_ID] [uniqueidentifier] NOT NULL,
	[Site_ID] [int] NULL,
	[Shipping_ID] [int] NOT NULL,
	[Bid_Note_ID] [int] NOT NULL,
	[Canopy_ID] [int] NOT NULL,
	[Created_By] [uniqueidentifier] NOT NULL,
	[Create_Date] [datetime] NULL,
	[Modifed_By] [uniqueidentifier] NULL,
	[Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Bids] PRIMARY KEY CLUSTERED 
(
	[Bid_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bio_Types]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bio_Types](
	[Bio_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Code] [varchar](5) NULL,
	[Create_Date] [datetime] NULL,
	[Created_By] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Bio_Types] PRIMARY KEY CLUSTERED 
(
	[Bio_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Canopies]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Canopies](
	[Canopy_ID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[Size_Width_Measure_ID] [int] NOT NULL,
	[Size_Height_Measure_ID] [int] NOT NULL,
	[Clearance_Height_Measure_ID] [int] NOT NULL,
	[Column_Quantity] [int] NULL,
	[Column_Type_ID] [int] NOT NULL,
	[Column_Size_Measure_ID] [int] NOT NULL,
	[Column_Shape_ID] [int] NOT NULL,
	[Column_Spacing_Length_ID] [int] NOT NULL,
	[Column_Spacing_Width_ID] [int] NULL,
	[Column_Spacing_Notes] [varchar](1000) NULL,
	[Deck_Style_ID] [int] NOT NULL,
	[Deck_Color_ID] [int] NULL,
	[Deck_Thickness_Measure_ID] [int] NOT NULL,
	[Image_ID] [int] NOT NULL,
	[Facia_Height_Measure_ID] [int] NOT NULL,
	[Facia_Type_ID] [int] NOT NULL,
	[Facia_Color_ID] [int] NOT NULL,
	[Drainage_Type_ID] [int] NOT NULL,
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
	[Design_Load_Notes] [varchar](1000) NULL,
	[Drawing_Sealed] [varchar](1) NULL,
	[Drawing_State] [varchar](20) NULL,
	[Drawing_Code] [varchar](20) NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NULL,
	[Modified_By] [uniqueidentifier] NULL,
	[Modifed_Date] [datetime] NULL,
 CONSTRAINT [PK_Canopies] PRIMARY KEY CLUSTERED 
(
	[Canopy_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Canopy_Column_Spacing_Length_Measurements]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canopy_Column_Spacing_Length_Measurements](
	[Canopies_Canopy_ID] [int] NOT NULL,
	[Measurement_Lists_Measurement_List_ID] [int] NOT NULL,
 CONSTRAINT [PK_Canopy_Column_Spacing_Length_Measurements] PRIMARY KEY CLUSTERED 
(
	[Canopies_Canopy_ID] ASC,
	[Measurement_Lists_Measurement_List_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Canopy_Column_Spacing_Width_Measurements]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canopy_Column_Spacing_Width_Measurements](
	[Canopies1_Canopy_ID] [int] NOT NULL,
	[Measurement_Lists1_Measurement_List_ID] [int] NOT NULL,
 CONSTRAINT [PK_Canopy_Column_Spacing_Width_Measurements] PRIMARY KEY CLUSTERED 
(
	[Canopies1_Canopy_ID] ASC,
	[Measurement_Lists1_Measurement_List_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Colors]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Colors](
	[Color_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Color_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Column_Shapes]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Column_Shapes](
	[Column_Shape_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Create_Date] [datetime] NULL,
	[Created_By] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Column_Shapes] PRIMARY KEY CLUSTERED 
(
	[Column_Shape_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Column_Types]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Column_Types](
	[Column_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Create_Date] [datetime] NULL,
	[Created_By] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Column_Types] PRIMARY KEY CLUSTERED 
(
	[Column_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact_Info]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact_Info](
	[Contact_Info_ID] [int] IDENTITY(1,1) NOT NULL,
	[Contact_Type_ID] [int] NOT NULL,
	[Contact_Text] [varchar](100) NOT NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Contact_Info] PRIMARY KEY CLUSTERED 
(
	[Contact_Info_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact_List]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_List](
	[Contact_Info_Contact_Info_ID] [int] NOT NULL,
	[Users_UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Contact_List] PRIMARY KEY CLUSTERED 
(
	[Contact_Info_Contact_Info_ID] ASC,
	[Users_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact_Types]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact_Types](
	[Contact_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Contact_Types] PRIMARY KEY CLUSTERED 
(
	[Contact_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[UserId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Users_UserId]  DEFAULT (newid()),
	[Login_ID] [varchar](20) NULL,
	[First_Name] [varchar](75) NULL,
	[Last_Name] [varchar](75) NULL,
	[Email] [varchar](75) NULL,
	[Company_Name] [varchar](100) NULL,
	[Contacts_ID] [int] NULL,
	[Address_ID] [int] NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Deck_Styles]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Deck_Styles](
	[Deck_Style_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Create_Date] [datetime] NULL,
	[Created_By] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Deck_Styles] PRIMARY KEY CLUSTERED 
(
	[Deck_Style_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Drainage_Types]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Drainage_Types](
	[Drainage_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Drainage_Types] PRIMARY KEY CLUSTERED 
(
	[Drainage_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Facia_Types]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Facia_Types](
	[Facia_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Facia_Types] PRIMARY KEY CLUSTERED 
(
	[Facia_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Images]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Images](
	[Image_ID] [int] IDENTITY(1,1) NOT NULL,
	[Color_ID] [int] NULL,
	[Image_Path] [varchar](100) NULL,
	[Create_Date] [datetime] NULL,
	[Created_By] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Image_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Job_Types]    Script Date: 12/14/2014 11:45:22 AM ******/
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
	[Create_Date] [datetime] NULL,
	[Created_By] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Job_Types] PRIMARY KEY CLUSTERED 
(
	[Job_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Measurement_Lists]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement_Lists](
	[Measurement_List_ID] [int] IDENTITY(1,1) NOT NULL,
	[Measurement_ID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Sequence_Number] [int] NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Measurement_Lists] PRIMARY KEY CLUSTERED 
(
	[Measurement_List_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Measurements]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurements](
	[Measurement_ID] [int] IDENTITY(1,1) NOT NULL,
	[Feet] [int] NULL,
	[Inches] [int] NULL,
 CONSTRAINT [PK_Measurements] PRIMARY KEY CLUSTERED 
(
	[Measurement_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Persons]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales_Persons](
	[Sales_Person_ID] [uniqueidentifier] NOT NULL,
	[First_Name] [varchar](75) NULL,
	[Last_Name] [varchar](75) NULL,
	[Address_ID] [int] NULL,
	[Contact_ID] [int] NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Sales_Persons] PRIMARY KEY CLUSTERED 
(
	[Sales_Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Scope_Types]    Script Date: 12/14/2014 11:45:22 AM ******/
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
	[Create_Date] [datetime] NULL,
	[Created_By] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Scope_Types] PRIMARY KEY CLUSTERED 
(
	[Scope_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shipping_Info]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipping_Info](
	[Shipping_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](75) NULL,
	[Address_ID] [int] NULL,
 CONSTRAINT [PK_Shipping_Info] PRIMARY KEY CLUSTERED 
(
	[Shipping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sites]    Script Date: 12/14/2014 11:45:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sites](
	[Site_ID] [int] NOT NULL,
	[Name] [varchar](75) NULL,
	[Address_ID] [int] NULL,
	[Created_By] [uniqueidentifier] NULL,
	[Create_Date] [datetime] NULL,
 CONSTRAINT [PK_Sites] PRIMARY KEY CLUSTERED 
(
	[Site_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 12/14/2014 11:45:22 AM ******/
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
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 12/14/2014 11:45:22 AM ******/
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
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 12/14/2014 11:45:22 AM ******/
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
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 12/14/2014 11:45:22 AM ******/
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
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 12/14/2014 11:45:22 AM ******/
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
/****** Object:  Index [IX_FK_Bid_Canopies_Canopy]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Bid_Canopies_Canopy] ON [dbo].[Bid_Canopies]
(
	[Canopies_Canopy_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Bid_Notes_Bids]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Bid_Notes_Bids] ON [dbo].[Bids]
(
	[Bid_Note_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Bid_Statuses_Bids]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Bid_Statuses_Bids] ON [dbo].[Bids]
(
	[Bid_Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Bid_Types_Bids]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Bid_Types_Bids] ON [dbo].[Bids]
(
	[Bid_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Bio_Types_Bids]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Bio_Types_Bids] ON [dbo].[Bids]
(
	[Bio_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Job_Types_Bids]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Job_Types_Bids] ON [dbo].[Bids]
(
	[Job_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Sales_Persons_Bids]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Sales_Persons_Bids] ON [dbo].[Bids]
(
	[Sales_Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Scope_Types_Bids]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Scope_Types_Bids] ON [dbo].[Bids]
(
	[Scope_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Shipping_Info_Bids]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Shipping_Info_Bids] ON [dbo].[Bids]
(
	[Shipping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Sites_Bids]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Sites_Bids] ON [dbo].[Bids]
(
	[Site_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_Bids_Created_By]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Users_Bids_Created_By] ON [dbo].[Bids]
(
	[Created_By] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_Bids_Modified_By]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Users_Bids_Modified_By] ON [dbo].[Bids]
(
	[Modifed_By] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Colors_Canopy_1]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Colors_Canopy_1] ON [dbo].[Canopies]
(
	[Deck_Color_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Colors_Canopy_2]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Colors_Canopy_2] ON [dbo].[Canopies]
(
	[Facia_Color_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Column_Shapes_Canopy]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Column_Shapes_Canopy] ON [dbo].[Canopies]
(
	[Column_Shape_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Column_Types_Canopy]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Column_Types_Canopy] ON [dbo].[Canopies]
(
	[Column_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Deck_Styles_Canopy]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Deck_Styles_Canopy] ON [dbo].[Canopies]
(
	[Deck_Style_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Drainage_Types_Canopy]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Drainage_Types_Canopy] ON [dbo].[Canopies]
(
	[Drainage_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Facia_Types_Canopy]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Facia_Types_Canopy] ON [dbo].[Canopies]
(
	[Facia_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Images_Canopy]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Images_Canopy] ON [dbo].[Canopies]
(
	[Image_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Measurements_Canopy_Clearance_Height]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Measurements_Canopy_Clearance_Height] ON [dbo].[Canopies]
(
	[Clearance_Height_Measure_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Measurements_Canopy_Column_Size]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Measurements_Canopy_Column_Size] ON [dbo].[Canopies]
(
	[Column_Size_Measure_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Measurements_Canopy_Deck_Thickness]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Measurements_Canopy_Deck_Thickness] ON [dbo].[Canopies]
(
	[Deck_Thickness_Measure_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Measurements_Canopy_Facia_Height]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Measurements_Canopy_Facia_Height] ON [dbo].[Canopies]
(
	[Facia_Height_Measure_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Measurements_Canopy_Size_Height]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Measurements_Canopy_Size_Height] ON [dbo].[Canopies]
(
	[Size_Height_Measure_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Measurements_Canopy_Size_Width]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Measurements_Canopy_Size_Width] ON [dbo].[Canopies]
(
	[Size_Width_Measure_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_Canopy_Created_By]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Users_Canopy_Created_By] ON [dbo].[Canopies]
(
	[Created_By] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Users_Canopy_Modified_By]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Users_Canopy_Modified_By] ON [dbo].[Canopies]
(
	[Modified_By] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Canopy_Column_Spacing_Length_Measurements_Measurement_Lists]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Canopy_Column_Spacing_Length_Measurements_Measurement_Lists] ON [dbo].[Canopy_Column_Spacing_Length_Measurements]
(
	[Measurement_Lists_Measurement_List_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Canopy_Column_Spacing_Width_Measurements_Measurement_Lists]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Canopy_Column_Spacing_Width_Measurements_Measurement_Lists] ON [dbo].[Canopy_Column_Spacing_Width_Measurements]
(
	[Measurement_Lists1_Measurement_List_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Contact_Info_Contact_Types]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Contact_Info_Contact_Types] ON [dbo].[Contact_Info]
(
	[Contact_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Contact_List_User]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Contact_List_User] ON [dbo].[Contact_List]
(
	[Users_UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Addresses_Users]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Addresses_Users] ON [dbo].[Customer]
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Measurements_Measurement_Lists]    Script Date: 12/14/2014 11:45:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Measurements_Measurement_Lists] ON [dbo].[Measurement_Lists]
(
	[Measurement_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bid_Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Bid_Canopies_Bid] FOREIGN KEY([Bids_Bid_ID])
REFERENCES [dbo].[Bids] ([Bid_ID])
GO
ALTER TABLE [dbo].[Bid_Canopies] CHECK CONSTRAINT [FK_Bid_Canopies_Bid]
GO
ALTER TABLE [dbo].[Bid_Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Bid_Canopies_Canopy] FOREIGN KEY([Canopies_Canopy_ID])
REFERENCES [dbo].[Canopies] ([Canopy_ID])
GO
ALTER TABLE [dbo].[Bid_Canopies] CHECK CONSTRAINT [FK_Bid_Canopies_Canopy]
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
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bio_Types_Bids] FOREIGN KEY([Bio_Type_ID])
REFERENCES [dbo].[Bio_Types] ([Bio_Type_ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bio_Types_Bids]
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
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Colors_Canopy_1] FOREIGN KEY([Deck_Color_ID])
REFERENCES [dbo].[Colors] ([Color_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Colors_Canopy_1]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Colors_Canopy_2] FOREIGN KEY([Facia_Color_ID])
REFERENCES [dbo].[Colors] ([Color_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Colors_Canopy_2]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Column_Shapes_Canopy] FOREIGN KEY([Column_Shape_ID])
REFERENCES [dbo].[Column_Shapes] ([Column_Shape_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Column_Shapes_Canopy]
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
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Drainage_Types_Canopy] FOREIGN KEY([Drainage_Type_ID])
REFERENCES [dbo].[Drainage_Types] ([Drainage_Type_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Drainage_Types_Canopy]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Facia_Types_Canopy] FOREIGN KEY([Facia_Type_ID])
REFERENCES [dbo].[Facia_Types] ([Facia_Type_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Facia_Types_Canopy]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Images_Canopy] FOREIGN KEY([Image_ID])
REFERENCES [dbo].[Images] ([Image_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Images_Canopy]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Clearance_Height] FOREIGN KEY([Clearance_Height_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Clearance_Height]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Column_Size] FOREIGN KEY([Column_Size_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Column_Size]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Deck_Thickness] FOREIGN KEY([Deck_Thickness_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Deck_Thickness]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Facia_Height] FOREIGN KEY([Facia_Height_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Facia_Height]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Size_Height] FOREIGN KEY([Size_Height_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Size_Height]
GO
ALTER TABLE [dbo].[Canopies]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Canopy_Size_Width] FOREIGN KEY([Size_Width_Measure_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Canopies] CHECK CONSTRAINT [FK_Measurements_Canopy_Size_Width]
GO
ALTER TABLE [dbo].[Canopy_Column_Spacing_Length_Measurements]  WITH CHECK ADD  CONSTRAINT [FK_Canopy_Column_Spacing_Length_Measurements_Canopy] FOREIGN KEY([Canopies_Canopy_ID])
REFERENCES [dbo].[Canopies] ([Canopy_ID])
GO
ALTER TABLE [dbo].[Canopy_Column_Spacing_Length_Measurements] CHECK CONSTRAINT [FK_Canopy_Column_Spacing_Length_Measurements_Canopy]
GO
ALTER TABLE [dbo].[Canopy_Column_Spacing_Length_Measurements]  WITH CHECK ADD  CONSTRAINT [FK_Canopy_Column_Spacing_Length_Measurements_Measurement_Lists] FOREIGN KEY([Measurement_Lists_Measurement_List_ID])
REFERENCES [dbo].[Measurement_Lists] ([Measurement_List_ID])
GO
ALTER TABLE [dbo].[Canopy_Column_Spacing_Length_Measurements] CHECK CONSTRAINT [FK_Canopy_Column_Spacing_Length_Measurements_Measurement_Lists]
GO
ALTER TABLE [dbo].[Canopy_Column_Spacing_Width_Measurements]  WITH CHECK ADD  CONSTRAINT [FK_Canopy_Column_Spacing_Width_Measurements_Canopy] FOREIGN KEY([Canopies1_Canopy_ID])
REFERENCES [dbo].[Canopies] ([Canopy_ID])
GO
ALTER TABLE [dbo].[Canopy_Column_Spacing_Width_Measurements] CHECK CONSTRAINT [FK_Canopy_Column_Spacing_Width_Measurements_Canopy]
GO
ALTER TABLE [dbo].[Canopy_Column_Spacing_Width_Measurements]  WITH CHECK ADD  CONSTRAINT [FK_Canopy_Column_Spacing_Width_Measurements_Measurement_Lists] FOREIGN KEY([Measurement_Lists1_Measurement_List_ID])
REFERENCES [dbo].[Measurement_Lists] ([Measurement_List_ID])
GO
ALTER TABLE [dbo].[Canopy_Column_Spacing_Width_Measurements] CHECK CONSTRAINT [FK_Canopy_Column_Spacing_Width_Measurements_Measurement_Lists]
GO
ALTER TABLE [dbo].[Contact_Info]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Info_Contact_Types] FOREIGN KEY([Contact_Type_ID])
REFERENCES [dbo].[Contact_Types] ([Contact_Type_ID])
GO
ALTER TABLE [dbo].[Contact_Info] CHECK CONSTRAINT [FK_Contact_Info_Contact_Types]
GO
ALTER TABLE [dbo].[Contact_List]  WITH CHECK ADD  CONSTRAINT [FK_Contact_List_Contact_Info] FOREIGN KEY([Contact_Info_Contact_Info_ID])
REFERENCES [dbo].[Contact_Info] ([Contact_Info_ID])
GO
ALTER TABLE [dbo].[Contact_List] CHECK CONSTRAINT [FK_Contact_List_Contact_Info]
GO
ALTER TABLE [dbo].[Measurement_Lists]  WITH CHECK ADD  CONSTRAINT [FK_Measurements_Measurement_Lists] FOREIGN KEY([Measurement_ID])
REFERENCES [dbo].[Measurements] ([Measurement_ID])
GO
ALTER TABLE [dbo].[Measurement_Lists] CHECK CONSTRAINT [FK_Measurements_Measurement_Lists]
GO
ALTER TABLE [dbo].[Sites]  WITH CHECK ADD  CONSTRAINT [FK_Sites_Addresses] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[Addresses] ([Address_ID])
GO
ALTER TABLE [dbo].[Sites] CHECK CONSTRAINT [FK_Sites_Addresses]
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
USE [master]
GO
ALTER DATABASE [Lane] SET  READ_WRITE 
GO
