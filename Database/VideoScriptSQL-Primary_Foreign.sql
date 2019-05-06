

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

create table UserRole
(
	Id int primary key,
	DisplayName nvarchar(max)
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
	IdRole int not null

	foreign key(IdRole) references UserRole(Id),
)
go



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

create table FavorList 
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


insert into UserRole(Id,DisplayName) values(1, N'Quản lý')
go
insert into UserRole(Id,DisplayName) values(2, N'Nhân viên')
go
insert into UserRole(Id,DisplayName) values(3, N'Khách hàng')
go

insert into Users(DisplayName, Username, Password, Address, Phone, Email, IdRole) values(N'Trân', N'admin', N'db69fc039dcbd2962cb4d28f5891aae1', N'Tiền Giang', N'123456789', N'tran@gmail.com', 1)
go
insert into Users(DisplayName, Username, Password, Address, Phone, Email, IdRole) values(N'Trâm', N'staff', N'db69fc039dcbd2962cb4d28f5891aae1', N'Tiền Giang', N'123456789', N'tran@gmail.com', 2)
go
