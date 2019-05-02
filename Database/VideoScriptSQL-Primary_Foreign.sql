USE [master]
GO
/****** Object:  Database [QLVideo]    Script Date: 05/02/2019 14:25:14 ******/
CREATE DATABASE [QLVideo] ON  PRIMARY 
( NAME = N'QLVideo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QLVideo.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLVideo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QLVideo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLVideo] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLVideo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLVideo] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QLVideo] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QLVideo] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QLVideo] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QLVideo] SET ARITHABORT OFF
GO
ALTER DATABASE [QLVideo] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [QLVideo] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QLVideo] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QLVideo] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QLVideo] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QLVideo] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QLVideo] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QLVideo] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QLVideo] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QLVideo] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QLVideo] SET  DISABLE_BROKER
GO
ALTER DATABASE [QLVideo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QLVideo] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QLVideo] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QLVideo] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QLVideo] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QLVideo] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QLVideo] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QLVideo] SET  READ_WRITE
GO
ALTER DATABASE [QLVideo] SET RECOVERY SIMPLE
GO
ALTER DATABASE [QLVideo] SET  MULTI_USER
GO
ALTER DATABASE [QLVideo] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QLVideo] SET DB_CHAINING OFF
GO
USE [QLVideo]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suplier]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Suplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KindVideo]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KindVideo](
	[Id] [int] NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KindVideo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Object]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Object](
	[Id] [int] NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[IdUnit] [int] NOT NULL,
	[IdKind] [int] NOT NULL,
	[IdSuplier] [int] NOT NULL,
	[Length] [time](7) NOT NULL,
	[View] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Object] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViewList]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViewList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdKind] [int] NOT NULL,
 CONSTRAINT [PK_ViewList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayHistory]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayHistory](
	[Id] [int] NOT NULL,
	[IdObject] [int] NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PayHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyPlaylist]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyPlaylist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdObject] [int] NOT NULL,
	[DisplayNameObject] [nvarchar](50) NOT NULL,
	[IdUser] [int] NOT NULL,
 CONSTRAINT [PK_MyPlaylist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InputInfo]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InputInfo](
	[Id] [int] NOT NULL,
	[IdObject] [int] NOT NULL,
	[DateInput] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[PriceInput] [money] NOT NULL,
	[PriceOutput] [money] NOT NULL,
 CONSTRAINT [PK_InputInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteList]    Script Date: 05/02/2019 14:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayNameObject] [nvarchar](50) NOT NULL,
	[IdUser] [int] NOT NULL,
 CONSTRAINT [PK_FavoriteList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK__Object__IdUnit__164452B1]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[Object]  WITH CHECK ADD FOREIGN KEY([IdUnit])
REFERENCES [dbo].[Unit] ([Id])
GO
/****** Object:  ForeignKey [Object_KindVideo]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[Object]  WITH CHECK ADD  CONSTRAINT [Object_KindVideo] FOREIGN KEY([IdKind])
REFERENCES [dbo].[KindVideo] ([Id])
GO
ALTER TABLE [dbo].[Object] CHECK CONSTRAINT [Object_KindVideo]
GO
/****** Object:  ForeignKey [Object_Suplier]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[Object]  WITH CHECK ADD  CONSTRAINT [Object_Suplier] FOREIGN KEY([IdSuplier])
REFERENCES [dbo].[Suplier] ([Id])
GO
ALTER TABLE [dbo].[Object] CHECK CONSTRAINT [Object_Suplier]
GO
/****** Object:  ForeignKey [Object_Unit]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[Object]  WITH CHECK ADD  CONSTRAINT [Object_Unit] FOREIGN KEY([IdUnit])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Object] CHECK CONSTRAINT [Object_Unit]
GO
/****** Object:  ForeignKey [ViewList_KindVideo]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[ViewList]  WITH CHECK ADD  CONSTRAINT [ViewList_KindVideo] FOREIGN KEY([IdKind])
REFERENCES [dbo].[KindVideo] ([Id])
GO
ALTER TABLE [dbo].[ViewList] CHECK CONSTRAINT [ViewList_KindVideo]
GO
/****** Object:  ForeignKey [Users_UserRole]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [Users_UserRole] FOREIGN KEY([IdRole])
REFERENCES [dbo].[UserRole] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Users_UserRole]
GO
/****** Object:  ForeignKey [PayHistory_Customer]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[PayHistory]  WITH CHECK ADD  CONSTRAINT [PayHistory_Customer] FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[PayHistory] CHECK CONSTRAINT [PayHistory_Customer]
GO
/****** Object:  ForeignKey [PayHistory_Object]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[PayHistory]  WITH CHECK ADD  CONSTRAINT [PayHistory_Object] FOREIGN KEY([IdObject])
REFERENCES [dbo].[Object] ([Id])
GO
ALTER TABLE [dbo].[PayHistory] CHECK CONSTRAINT [PayHistory_Object]
GO
/****** Object:  ForeignKey [MyPlaylist_Object]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[MyPlaylist]  WITH CHECK ADD  CONSTRAINT [MyPlaylist_Object] FOREIGN KEY([IdObject])
REFERENCES [dbo].[Object] ([Id])
GO
ALTER TABLE [dbo].[MyPlaylist] CHECK CONSTRAINT [MyPlaylist_Object]
GO
/****** Object:  ForeignKey [MyPlaylist_Users]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[MyPlaylist]  WITH CHECK ADD  CONSTRAINT [MyPlaylist_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[MyPlaylist] CHECK CONSTRAINT [MyPlaylist_Users]
GO
/****** Object:  ForeignKey [InputInfo_Object]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[InputInfo]  WITH CHECK ADD  CONSTRAINT [InputInfo_Object] FOREIGN KEY([IdObject])
REFERENCES [dbo].[Object] ([Id])
GO
ALTER TABLE [dbo].[InputInfo] CHECK CONSTRAINT [InputInfo_Object]
GO
/****** Object:  ForeignKey [FavoriteList_Users]    Script Date: 05/02/2019 14:25:15 ******/
ALTER TABLE [dbo].[FavoriteList]  WITH CHECK ADD  CONSTRAINT [FavoriteList_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[FavoriteList] CHECK CONSTRAINT [FavoriteList_Users]
GO
