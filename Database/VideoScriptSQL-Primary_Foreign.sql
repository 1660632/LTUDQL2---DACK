

-------------------------------------------------------------
create database QuanLyVideo
go
use QuanLyVideo
go


create table Suplier
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(max),
)
go

insert into Suplier(DisplayName) values (N'Nexflit')
insert into Suplier(DisplayName) values (N'Phim Mới')
insert into Suplier(DisplayName) values (N'Điền Quân')
insert into Suplier(DisplayName) values (N'HTV Entertainment')

create table KindVideo
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(max),
	Status int
)
go

insert into KindVideo(DisplayName, Status) values (N'Tình Cảm', 1)
insert into KindVideo(DisplayName, Status) values (N'Hành Động', 1)
insert into KindVideo(DisplayName, Status) values (N'Viễn Tưởng', 1)
insert into KindVideo(DisplayName, Status) values (N'Phiêu Lưu', 1)
insert into KindVideo(DisplayName, Status) values (N'Âm Nhạc', 1)
insert into KindVideo(DisplayName, Status) values (N'Hài Hước', 1)
insert into KindVideo(DisplayName, Status) values (N'Lịch Sử', 1)
insert into KindVideo(DisplayName, Status) values (N'Hoạt Hình', 1)
insert into KindVideo(DisplayName, Status) values (N'Kinh Dị', 1)
insert into KindVideo(DisplayName, Status) values (N'Thần Thoại', 1)
insert into KindVideo(DisplayName, Status) values (N'Hình Sự', 1)
insert into KindVideo(DisplayName, Status) values (N'Huyền Bí', 1)

create table Object
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(max),	
	IdKind int not null,
	IdSuplier int not null,
	DateInput date,
	InputPrice float default 0,
	OutputPrice float default 0,	
	Length time(7) not null,
	Vieww int not null,
	Status nvarchar(max)
	
	foreign key(IdSuplier) references Suplier(Id),
	foreign key(IdKind) references KindVideo(Id),
)
go

insert into Object(DisplayName, IdKind, IdSuplier, DateInput, InputPrice, OutputPrice, Length, Vieww, Status)
values(N'ABC', 1,1,N'07/07/2019', 200000, 300000, N'11:11', 3, 1)

create table UserRole
(
	Id int primary key,
	DisplayName nvarchar(max)
)
go

create table Userr
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(max),
	Email nvarchar(100),
	Password nvarchar(max),	
	IdRole int not null

	foreign key(IdRole) references UserRole(Id),
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
	foreign key (IdUser) references Userr(Id)
)
go

insert into PayHistory(IdObject, IdUser, Total, Status) values (2,2,200000,N'1')

create table MyPlayList 
(
	Id int identity(1,1) primary key,
	IdObject int not null,	
	IdUser int not null,
	DisplayNameObject nvarchar(max),

	foreign key (IdObject) references Object(Id),
	foreign key (IdUser) references Userr(Id)
)
go

create table FavorList 
(
	Id int identity(1,1) primary key,
	IdUser int not null,
	DisplayNameObject nvarchar(max),

	foreign key (IdUser) references Userr(Id)
)
go

create table ViewList 
(
	Id int identity(1,1) primary key,
	IdKind int not null,

	foreign key (IdKind) references KindVideo(Id)
)
go


insert into UserRole(Id, DisplayName) values(1, N'Quản lý')
go
insert into UserRole(Id,DisplayName) values(2, N'Nhân viên')
go
insert into UserRole(Id,DisplayName) values(3, N'Khách hàng')
go

insert into Userr(DisplayName, Email, Password,IdRole) values(N'Trân', N'tran@gmail.com', N'db69fc039dcbd2962cb4d28f5891aae1', 1)
go

--db69fc039dcbd2962cb4d28f5891aae1=admin
--978aae9bb6bee8fb75de3e4830a1be46=staff

insert into Userr(DisplayName, Email, Password, IdRole) values(N'Trâm', N'tram@gmail.com', N'978aae9bb6bee8fb75de3e4830a1be46', 2) 
go

