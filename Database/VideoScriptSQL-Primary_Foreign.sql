--USE [master]
--GO
--/****** Object:  Database [QLVideo]    Script Date: 05/02/2019 14:25:14 ******/
--CREATE DATABASE [QLVideo]
--GO
--USE [QLVideo]
--GO
--/****** Object:  Table [dbo].[Customer]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
----CREATE TABLE [dbo].[Customer](
----	[Id] [int] IDENTITY(1,1) NOT NULL,
----	[DisplayName] [nvarchar](50) NOT NULL,
----	[Address] [nvarchar](50) NOT NULL,
----	[Phone] [nchar](10) NOT NULL,
----	[Email] [nvarchar](50) NOT NULL,
---- CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
----(
----	[Id] ASC
----)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
----) ON [PRIMARY]
----GO
--/****** Object:  Table [dbo].[UserRole]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
----CREATE TABLE [dbo].[UserRole](
----	[Id] [int],
----	[DisplayName] [nvarchar](50) NOT NULL,
---- CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
----(
----	[Id] ASC
----)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
----) ON [PRIMARY]
----GO
--/****** Object:  Table [dbo].[Unit]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[Unit](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[DisplayName] [nvarchar](50) NOT NULL,
-- CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO
--/****** Object:  Table [dbo].[Suplier]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[Suplier](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[DisplayName] [nvarchar](50) NOT NULL,
-- CONSTRAINT [PK_Suplier] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO
--/****** Object:  Table [dbo].[KindVideo]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[KindVideo](
--	[Id] [int] NOT NULL,
--	[DisplayName] [nvarchar](50) NOT NULL,
--	[Status] [nvarchar](50) NOT NULL,
-- CONSTRAINT [PK_KindVideo] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO
--/****** Object:  Table [dbo].[Object]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[Object](
--	[Id] [int] NOT NULL,
--	[DisplayName] [nvarchar](50) NOT NULL,
--	[IdUnit] [int] NOT NULL,
--	[IdKind] [int] NOT NULL,
--	[IdSuplier] [int] NOT NULL,
--	[Length] [time](7) NOT NULL,
--	[View] [nvarchar](max) NOT NULL,
-- CONSTRAINT [PK_Object] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--GO
--/****** Object:  Table [dbo].[ViewList]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[ViewList](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[IdKind] [int] NOT NULL,
-- CONSTRAINT [PK_ViewList] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO
--/****** Object:  Table [dbo].[Users]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[Users](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[UserName] [nvarchar](50) NOT NULL,
--	[Password] [nvarchar](50) NOT NULL,
--	[DisplayName] [nvarchar](50) NOT NULL,
--	[Address] [nvarchar](50) NOT NULL,
--	[Phone] [nchar](10) NOT NULL,
--	[Email] [nvarchar](50) NOT NULL,
--	[Role] [int] NOT NULL,
-- CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO
--/****** Object:  Table [dbo].[PayHistory]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[PayHistory](
--	[Id] [int] NOT NULL,
--	[IdObject] [int] NOT NULL,
--	[IdCustomer] [int] NOT NULL,
--	[Total] [money] NOT NULL,
--	[Status] [nvarchar](50) NOT NULL,
-- CONSTRAINT [PK_PayHistory] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO
--/****** Object:  Table [dbo].[MyPlaylist]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[MyPlaylist](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[IdObject] [int] NOT NULL,
--	[DisplayNameObject] [nvarchar](50) NOT NULL,
--	[IdUser] [int] NOT NULL,
-- CONSTRAINT [PK_MyPlaylist] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO
--/****** Object:  Table [dbo].[InputInfo]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[InputInfo](
--	[Id] [int] NOT NULL,
--	[IdObject] [int] NOT NULL,
--	[DateInput] [datetime] NOT NULL,
--	[Status] [nvarchar](50) NOT NULL,
--	[PriceInput] [money] NOT NULL,
--	[PriceOutput] [money] NOT NULL,
-- CONSTRAINT [PK_InputInfo] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO
--/****** Object:  Table [dbo].[FavoriteList]    Script Date: 05/02/2019 14:25:15 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[FavoriteList](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[DisplayNameObject] [nvarchar](50) NOT NULL,
--	[IdUser] [int] NOT NULL,
-- CONSTRAINT [PK_FavoriteList] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]
--GO
----/****** Object:  ForeignKey [FK__Object__IdUnit__164452B1]    Script Date: 05/02/2019 14:25:15 ******/
----ALTER TABLE [dbo].[Object]  WITH CHECK ADD FOREIGN KEY([IdUnit])
----REFERENCES [dbo].[Unit] ([Id])
----GO
--/****** Object:  ForeignKey [Object_KindVideo]    Script Date: 05/02/2019 14:25:15 ******/
--ALTER TABLE [dbo].[Object]  WITH CHECK ADD  CONSTRAINT [Object_KindVideo] FOREIGN KEY([IdKind])
--REFERENCES [dbo].[KindVideo] ([Id])
--GO
--ALTER TABLE [dbo].[Object] CHECK CONSTRAINT [Object_KindVideo]
--GO
--/****** Object:  ForeignKey [Object_Suplier]    Script Date: 05/02/2019 14:25:15 ******/
--ALTER TABLE [dbo].[Object]  WITH CHECK ADD  CONSTRAINT [Object_Suplier] FOREIGN KEY([IdSuplier])
--REFERENCES [dbo].[Suplier] ([Id])
--GO
--ALTER TABLE [dbo].[Object] CHECK CONSTRAINT [Object_Suplier]
--GO
--/****** Object:  ForeignKey [Object_Unit]    Script Date: 05/02/2019 14:25:15 ******/
--ALTER TABLE [dbo].[Object]  WITH CHECK ADD  CONSTRAINT [Object_Unit] FOREIGN KEY([IdUnit])
--REFERENCES [dbo].[Unit] ([Id])
--GO
--ALTER TABLE [dbo].[Object] CHECK CONSTRAINT [Object_Unit]
--GO
--/****** Object:  ForeignKey [ViewList_KindVideo]    Script Date: 05/02/2019 14:25:15 ******/
--ALTER TABLE [dbo].[ViewList]  WITH CHECK ADD  CONSTRAINT [ViewList_KindVideo] FOREIGN KEY([IdKind])
--REFERENCES [dbo].[KindVideo] ([Id])
--GO
--ALTER TABLE [dbo].[ViewList] CHECK CONSTRAINT [ViewList_KindVideo]
--GO
--/****** Object:  ForeignKey [Users_UserRole]    Script Date: 05/02/2019 14:25:15 ******/
----ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [Users_UserRole] FOREIGN KEY([IdRole])
----REFERENCES [dbo].[UserRole] ([Id])
----GO
----ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Users_UserRole]
----GO
--/****** Object:  ForeignKey [PayHistory_User]    Script Date: 05/02/2019 14:25:15 ******/
--ALTER TABLE [dbo].[PayHistory]  WITH CHECK ADD  CONSTRAINT [PayHistory_User] FOREIGN KEY([IdUser])
--REFERENCES [dbo].[User] ([Id])
--GO
--ALTER TABLE [dbo].[PayHistory] CHECK CONSTRAINT [PayHistory_User]
--GO
--/****** Object:  ForeignKey [PayHistory_Object]    Script Date: 05/02/2019 14:25:15 ******/
--ALTER TABLE [dbo].[PayHistory]  WITH CHECK ADD  CONSTRAINT [PayHistory_Object] FOREIGN KEY([IdObject])
--REFERENCES [dbo].[Object] ([Id])
--GO
--ALTER TABLE [dbo].[PayHistory] CHECK CONSTRAINT [PayHistory_Object]
--GO
--/****** Object:  ForeignKey [MyPlaylist_Object]    Script Date: 05/02/2019 14:25:15 ******/
--ALTER TABLE [dbo].[MyPlaylist]  WITH CHECK ADD  CONSTRAINT [MyPlaylist_Object] FOREIGN KEY([IdObject])
--REFERENCES [dbo].[Object] ([Id])
--GO
--ALTER TABLE [dbo].[MyPlaylist] CHECK CONSTRAINT [MyPlaylist_Object]
--GO
--/****** Object:  ForeignKey [MyPlaylist_Users]    Script Date: 05/02/2019 14:25:15 ******/
--ALTER TABLE [dbo].[MyPlaylist]  WITH CHECK ADD  CONSTRAINT [MyPlaylist_Users] FOREIGN KEY([IdUser])
--REFERENCES [dbo].[Users] ([Id])
--GO
--ALTER TABLE [dbo].[MyPlaylist] CHECK CONSTRAINT [MyPlaylist_Users]
--GO
--/****** Object:  ForeignKey [InputInfo_Object]    Script Date: 05/02/2019 14:25:15 ******/
--ALTER TABLE [dbo].[InputInfo]  WITH CHECK ADD  CONSTRAINT [InputInfo_Object] FOREIGN KEY([IdObject])
--REFERENCES [dbo].[Object] ([Id])
--GO
--ALTER TABLE [dbo].[InputInfo] CHECK CONSTRAINT [InputInfo_Object]
--GO
--/****** Object:  ForeignKey [FavoriteList_Users]    Script Date: 05/02/2019 14:25:15 ******/
--ALTER TABLE [dbo].[FavoriteList]  WITH CHECK ADD  CONSTRAINT [FavoriteList_Users] FOREIGN KEY([IdUser])
--REFERENCES [dbo].[Users] ([Id])
--GO
--ALTER TABLE [dbo].[FavoriteList] CHECK CONSTRAINT [FavoriteList_Users]
--GO


-------------------------------------------------------------
create database QuanLyVideo
go
use QuanLyVideo
go

create table Unit
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(max)
)
go

create table Suplier
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(max),
)
go

create table KindVideo
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(max),
	Status nvarchar(max)
)
go

create table Object
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(max),
	IdUnit int not null,
	IdKind int not null,
	IdSuplier int not null,
	Length time(7) not null,
	Vieww int not null,
	
	foreign key(IdUnit) references Unit(Id),
	foreign key(IdSuplier) references Suplier(Id),
	foreign key(IdKind) references KindVideo(Id),
)
go

create table Users
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(max),
	UserName nvarchar(100),
	Password nvarchar(max),
	Address nvarchar(max),
	Phone nvarchar(20),
	Email nvarchar(200),
	Role int not null
)
go
--insert into Users(DisplayName, Username, Password, IdRole) values(N'RongK9', N'admin', N'db69fc039dcbd2962cb4d28f5891aae1', 1)
--go
--insert into Users(DisplayName, Username, Password, IdRole) values(N'Nhân viên', N'staff', N'978aae9bb6bee8fb75de3e4830a1be46', 2)
--go

create table InputInfo
(
	Id int identity(1,1) primary key,
	IdObject int not null,
	DateInput date,
	InputPrice float default 0,
	OutputPrice float default 0,
	Status nvarchar(max)

	foreign key (IdObject) references Object(Id),
)
go

create table PayHistory 
(
	Id int identity(1,1) primary key,
	IdObject int not null,	
	IdUser int not null,
	Total int,	
	Status nvarchar(max)

	foreign key (IdObject) references Object(Id),
	foreign key (IdUser) references Users(Id)
)
go

create table MyPlayList 
(
	Id int identity(1,1) primary key,
	IdObject int not null,	
	IdUser int not null,
	DisplayNameObject nvarchar(max),

	foreign key (IdObject) references Object(Id),
	foreign key (IdUser) references Users(Id)
)
go

create table MyPlayList 
(
	Id int identity(1,1) primary key,
	IdUser int not null,
	DisplayNameObject nvarchar(max),

	foreign key (IdUser) references Users(Id)
)
go

create table ViewList 
(
	Id int identity(1,1) primary key,
	IdKind int not null,

	foreign key (IdKind) references KindVideo(Id)
)
go