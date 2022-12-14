USE [master]
GO
/****** Object:  Database [Musiker]    Script Date: 12.09.2022 12:07:19 ******/
CREATE DATABASE [Musiker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Musiker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Musiker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Musiker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Musiker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Musiker] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Musiker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Musiker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Musiker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Musiker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Musiker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Musiker] SET ARITHABORT OFF 
GO
ALTER DATABASE [Musiker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Musiker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Musiker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Musiker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Musiker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Musiker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Musiker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Musiker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Musiker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Musiker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Musiker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Musiker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Musiker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Musiker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Musiker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Musiker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Musiker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Musiker] SET RECOVERY FULL 
GO
ALTER DATABASE [Musiker] SET  MULTI_USER 
GO
ALTER DATABASE [Musiker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Musiker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Musiker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Musiker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Musiker] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Musiker', N'ON'
GO
ALTER DATABASE [Musiker] SET QUERY_STORE = OFF
GO
USE [Musiker]
GO
/****** Object:  User [sus]    Script Date: 12.09.2022 12:07:19 ******/
CREATE USER [sus] FOR LOGIN [sus] WITH DEFAULT_SCHEMA=[sus]
GO
/****** Object:  Schema [sus]    Script Date: 12.09.2022 12:07:19 ******/
CREATE SCHEMA [sus]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12.09.2022 12:07:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] NOT NULL,
	[Name] [varchar](45) NOT NULL,
	[Surname] [varchar](45) NOT NULL,
	[C_Adress_ID] [int] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Email] [varchar](45) NOT NULL,
	[Password] [varchar](45) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Adress]    Script Date: 12.09.2022 12:07:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Adress](
	[C_Adress_ID] [int] NOT NULL,
	[C_Street] [varchar](45) NULL,
	[C_House] [int] NULL,
	[C_Floor] [int] NOT NULL,
	[C_Flat] [int] NULL,
 CONSTRAINT [PK_Customer_Adress] PRIMARY KEY CLUSTERED 
(
	[C_Adress_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guitar]    Script Date: 12.09.2022 12:07:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guitar](
	[Guitar_ID] [int] NOT NULL,
	[GuitarName] [varchar](45) NOT NULL,
	[Model] [varchar](45) NULL,
	[Neck_M] [varchar](45) NULL,
	[Deck_M] [varchar](45) NULL,
	[Cost] [int] NULL,
 CONSTRAINT [PK_Guitar] PRIMARY KEY CLUSTERED 
(
	[Guitar_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12.09.2022 12:07:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[C_Adress_ID] [int] NOT NULL,
	[Shop_ID] [int] NOT NULL,
	[Guitar_ID] [int] NOT NULL,
	[Order_Date] [timestamp] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saddam_Hussein]    Script Date: 12.09.2022 12:07:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saddam_Hussein](
	[City_ID] [int] NOT NULL,
	[City_Name] [varchar](45) NULL,
 CONSTRAINT [PK_Saddam_Hussein] PRIMARY KEY CLUSTERED 
(
	[City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop_Adress]    Script Date: 12.09.2022 12:07:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop_Adress](
	[Shop_ID] [int] NOT NULL,
	[City_ID] [int] NOT NULL,
	[S_Street] [varchar](45) NOT NULL,
	[S_House] [varchar](45) NOT NULL,
	[S_Floor] [varchar](45) NOT NULL,
	[S_Flat] [varchar](45) NOT NULL,
 CONSTRAINT [PK_Shop_Adress] PRIMARY KEY CLUSTERED 
(
	[Shop_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer_Adress] FOREIGN KEY([C_Adress_ID])
REFERENCES [dbo].[Customer_Adress] ([C_Adress_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer_Adress]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Guitar] FOREIGN KEY([Guitar_ID])
REFERENCES [dbo].[Guitar] ([Guitar_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Guitar]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shop_Adress] FOREIGN KEY([Shop_ID])
REFERENCES [dbo].[Shop_Adress] ([Shop_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shop_Adress]
GO
ALTER TABLE [dbo].[Shop_Adress]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Adress_Saddam_Hussein] FOREIGN KEY([City_ID])
REFERENCES [dbo].[Saddam_Hussein] ([City_ID])
GO
ALTER TABLE [dbo].[Shop_Adress] CHECK CONSTRAINT [FK_Shop_Adress_Saddam_Hussein]
GO
USE [master]
GO
ALTER DATABASE [Musiker] SET  READ_WRITE 
GO
