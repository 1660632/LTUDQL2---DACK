

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

insert into Suplier(DisplayName) values (N'A. Film, Einstein Film, Nordisk Film Production')
insert into Suplier(DisplayName) values (N'Dark Army Studio, Tmoment')
insert into Suplier(DisplayName) values (N'CBS Films, Wayfarer Entertainment')
insert into Suplier(DisplayName) values (N'30West, Automatik')
insert into Suplier(DisplayName) values (N'LWH Entertainment, Umedia, The Kraken Films')
insert into Suplier(DisplayName) values (N'Perfect Village Entertainment, LeVision Pictures, Shanghai Tencent Pictures Cult')
insert into Suplier(DisplayName) values (N'Chưa rõ')
insert into Suplier(DisplayName) values (N'DreamWorks Animation, Mad Hatter Entertainment')
insert into Suplier(DisplayName) values (N'Tohokushinsha Film Corporation (TFC)')
insert into Suplier(DisplayName) values (N'Universal Pictures, Alphaville Films')
insert into Suplier(DisplayName) values (N'Netflix')
insert into Suplier(DisplayName) values (N'Atresmedia Cine, Colosé Producciones, Mirage Studio')
insert into Suplier(DisplayName) values (N'Priority Pictures, A-Line Pictures, Depth of Field')
insert into Suplier(DisplayName) values (N'Opus Film, Apocalypso Pictures, MK2 Productions')
insert into Suplier(DisplayName) values (N'Walt Disney Pictures, Marvel Studios, Animal Logic')
insert into Suplier(DisplayName) values (N'Atomic Monster, New Line Cinema')
insert into Suplier(DisplayName) values (N'Soapbox Films, Divide/Conquer, Mind Hive Films')
insert into Suplier(DisplayName) values (N'BlackOps Studios Asia, Psyops8, Viva Films')
insert into Suplier(DisplayName) values (N'40 Acres & A Mule Filmworks')
insert into Suplier(DisplayName) values (N'StudioCanal, Mas Films, Paradox Films')
insert into Suplier(DisplayName) values (N'Powder Hound Pictures, Artina Films, Destro Films')
insert into Suplier(DisplayName) values (N'Studio Colorido Co.')
insert into Suplier(DisplayName) values (N'Licri, Nikkatsu, Toho Company')
insert into Suplier(DisplayName) values (N'Warner Bros')
insert into Suplier(DisplayName) values (N'Universal Pictures, Alphaville Films, Imhotep Productions')
insert into Suplier(DisplayName) values (N'Aniplex, Dentsu, Dwango')
insert into Suplier(DisplayName) values (N'Qualia Animation')
insert into Suplier(DisplayName) values (N'King Records, Kôdansha, Netflix')
insert into Suplier(DisplayName) values (N'Aniplex, Brains Base')
insert into Suplier(DisplayName) values (N'Shinchosha Company, Studio Ghibli')
insert into Suplier(DisplayName) values (N'Exclusive Film Distribution, Vertigo ')
insert into Suplier(DisplayName) values (N'A-1 Pictures')
insert into Suplier(DisplayName) values (N'10th Street Entertainment, Hurwitz Creative, LBI Entertainment')
insert into Suplier(DisplayName) values (N'Warner Bros. Pictures, Live Nation Productions, Metro-Goldwyn-Mayer (MGM)')
insert into Suplier(DisplayName) values (N'Number 9 Films, Killer Films, Bold Films')

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
	Link nvarchar(max),	
	IdKind int not null,
	IdSuplier int not null,
	DateInput date,
	InputPrice float default 0,
	OutputPrice float default 0,	
	Describe nvarchar(max),

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

--insert into PayHistory(IdObject, IdUser, Total, Status) values (1,2,200000,N'1')

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



---------THÊM OBJECT----------------
insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, InputPrice, OutputPrice, Describe, Status)
values (N'Cuộc phiêu lưu của quả lê khổng lồ', N'http://www.phimmoi.net/phim/tinh-ha-sup-do-8684/', 3, 1, N'06/03/2019', 30000, 45000, N'Bắt đầu từ thời đại thực dân các vì sao,  cuối cùng loài người cũng phân bổ giá trị  quan chủ yếu của nền văn minh ra khắp tinh  hà rộng lớn. Đại bác chiến hạm vỡ nát trở thành mồi lửa châm nguồn năng lượng cho vũ trụ tối tăm lạnh lẽo, trong tầm ngắm của đại bác, chân lý có ở mọi nơi, từ đây câu chuyện mạo hiểm ly kỳ bắt đầu.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, InputPrice, OutputPrice, Describe, Status)
values (N'Hồ bơi tử thần', N'http://www.phimmoi.net/phim/ho-boi-tu-than-8716/', 1, 2, N'06/03/2019', 30000, 45000, N'Một tình huống trớ trêu khiến đôi nam nữ rơi vào cuộc chiến giành giật sự sống từ tay tử thần. Một chuỗi những điều tuyệt vọng liên tiếp xảy ra: không thức ăn, không lối thoát, cạn nước uống, và thậm chí là dã thú ăn thịt. Mắc kẹt dưới hồ sâu 6 mét, liệu cặp đôi sẽ xoay sở để sống sót trở về?', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, InputPrice, OutputPrice, Describe, Status)
values (N'Năm bước để yêu', N'http://www.phimmoi.net/phim/nam-buoc-de-yeu-8498/', 2, 3, N'06/03/2019', 30000, 45000, N'Năm Bước Để Yêu nói về câu chuyện tình của Will và Stella khi cả hai đều mang căn bệnh u xơ nang. Với những người mắc căn bệnh này, họ không thể đến gần nhau và khoảng cách 6 bước chân là quy tắc bất khả kháng để cả hai không bị lây nhiễm vi khuẩn của nhau.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, InputPrice, OutputPrice, Describe, Status)
values (N'Kẻ phá hủy', N'http://www.phimmoi.net/phim/ke-pha-huy-8768/', 3, 4, N'06/03/2019', 30000, 45000, N'Erin Bell (Nicole Kidman) cựu điệp viên từng hoạt động ngầm trong một băng đảng mafia. Nhiều năm sau khi vụ án kết thúc trong thảm kịch, kẻ cầm đầu băng nhóm trở lại giang hồ, Erin một lần nữa phải đối mặt với những nguy hiểm và chính quá khứ muốn chôn vùi của mình.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, InputPrice, OutputPrice, Describe, Status)
values (N'Khu nghỉ dưỡng xác sống', N'http://www.phimmoi.net/phim/khu-nghi-duong-xac-song-8731/', 9, 5, N'06/03/2019', 30000, 45000, N'Sau vụ bộc phát zombie kinh hoàng khiến nhiều người vô cùng hoảng sợ, cuối cùng chính quyền đã có thể kiểm soát được. Nếu một zombie thỉnh thoảng tìm thấy lối vào cuộc sống hàng ngày của con người, nó sẽ bị nhanh chóng xử lý bởi các cơ quan có thẩm quyền bảo vệ người dân. Trong thời đại của phim, vì đã quá quen với vấn nạn Zoombie, mọi người biết cách để xử lý một con zombie là như thế nào.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, InputPrice, OutputPrice, Describe, Status)
values (N'Vô ảnh', N'http://www.phimmoi.net/phim/vo-anh-i1-7931/', 7, 6, N'06/03/2019', 30000, 45000, N'Shadow (Vô Ảnh) lấy bối cảnh dưới thời kỳ Tam Quốc. Đại Đô Đốc Phái quốc Tử Ngu (Đặng Siêu) trong một lần chiến đấu đã bị thương nặng và phải ẩn thân trong bóng tối. Để tiếp tục nhiệm vụ của mình, hắn ta giao phó cho sát thủ có tên Cảnh Châu, biệt hiệu “Ảnh tử” – cũng chính là cái bóng của mình.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, InputPrice, OutputPrice, Describe, Status)
values (N'Hãy để anh yêu em', N'http://www.phimmoi.net/phim/hay-de-em-yeu-anh-8398/', 1, 7, N'06/03/2019', 30000, 45000, N'LALA: HÃY ĐỂ EM YÊU ANH kể về những người trẻ theo đuổi đam mê, cùng nhau chia sẻ tình bạn, tình yêu, những tổn thương trong cuộc sống. Nhân vật Hà Mi (Chi Pu) là một nhạc sĩ trẻ đam mê sáng tác. Còn G-Feel (San E) là nhạc sĩ thiên tài của Hàn Quốc nhưng đang phải đối mặt với áp lực từ sự nổi tiếng.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, InputPrice, OutputPrice, Describe, Status)
values (N'Bí kiếp luyện rồng 3', N'http://www.phimmoi.net/phim/bi-kip-luyen-rong-3-vung-dat-bi-an-7724/', 8, 8, N'06/03/2019', 30000, 45000, N'Sau khi Hiccup tạo ra một thế giới hòa bình cho loài rồng, Răng Sún phát hiện ra một người bạn mới đầy bí hiểm. Lúc này Hiccup đã trở thành người lãnh đạo của cả làng gánh trên vai trọng trách gìn giữ sự an nguy cho mọi người. Vì vậy, cậu không thể mãi bị cuốn theo những cuộc phiêu lưu bất tận với Răng Sún. Và khi nguy hiểm ập đến ngôi làng, cả Hiccup và Răng Sún đều đã đứng lên, anh dũng bảo vệ giống loài của mình.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, InputPrice, OutputPrice, Describe, Status)
values (N'GARO: Cầu hồn', N'http://www.phimmoi.net/phim/garo-cau-hon-8584/', 12, 9, N'06/03/2019', 30000, 45000, N'Sức mạnh, quyền lực, danh tiếng,... từ thời xưa, con người bị ám ảnh và trở nên lầm lỗi bởi những tham vọng của họ. Cũng từ đó Horrors xuất hiện, chúng xâm nhập vào con người từ mặt tối của họ để nuốt lấy linh hồn, chiếm lấy thể xác họ. Âm thầm chiến đấu tiêu diệt Horrors, những Ma giới kỵ sĩ tạo cho nhân loại một tia hi vọng..Một hiệp sĩ trong bộ đồ của trận đánh giáp vàng với một con quái vật huyền diệu ra để tiêu diệt thế giới.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, InputPrice, OutputPrice, Describe, Status)
values (N'Tế công hàng yêu', N'http://www.phimmoi.net/phim/te-cong-ha-ng-yeu-7261/', 6, 10, N'06/03/2019', 30000, 45000, N'Yêu quái đại bàng từ địa ngục lên trần gian cùng đồng bọn tác oai tác quái. Nhằm ngăn chặn tai họa, Tế Công xin với Ngọc Đế phái thêm 5 vị tiên nữa cùng ông hàng yêu phục ma. Nào ngờ, Ngọc Đế lại bất cẩm khiến họ rơi vào tính huống dở khóc dở cười vì xuống trần mà mất đi pháp thuật và ký ức thần tiên.', 1)