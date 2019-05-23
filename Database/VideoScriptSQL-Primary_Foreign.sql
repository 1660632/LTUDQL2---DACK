

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
insert into Userr(DisplayName, Email, Password, IdRole) values(N'Trâm', N'tram@gmail.com', N'db69fc039dcbd2962cb4d28f5891aae1', 2)
go

create proc ThietLap @id int
as 
begin
	delete Users where IdRole = @id
end
-------------------
create proc Xoa_UserRole @id int
as
begin
	exec ThietLap @id
	delete UserRole where Id = @id
end

exec Xoa_UserRole 6
