

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
	IdUser int not null,
	Total int,	
	Status nvarchar(max)

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

--db69fc039dcbd2962cb4d28f5891aae1=admin
--978aae9bb6bee8fb75de3e4830a1be46=staff

insert into Userr(DisplayName, Email, Password, IdRole) values(N'Trâm', N'tram@gmail.com', N'978aae9bb6bee8fb75de3e4830a1be46', 2) 
go
insert into Userr(DisplayName, Email, Password, IdRole) values(N'Bảo Bảo', N'bao@gmail.com', N'e6aa5c57dbdd3ead261b5b57365fefa7', 3) --baobao
go
insert into Userr(DisplayName, Email, Password, IdRole) values(N'Thanh An', N'an@gmail.com', N'fcfb313c130e9f074da857609ab6f98d', 3) --anan
go
insert into Userr(DisplayName, Email, Password, IdRole) values(N'Minh Trường', N'truong@gmail.com', N'53bdd3b16c6ae9c642239be5720410e7', 3) --minhtruong
go



---------THÊM OBJECT----------------
insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Cuộc phiêu lưu của quả lê khổng lồ', N'http://www.phimmoi.net/phim/tinh-ha-sup-do-8684/', 3, 1, N'06/03/2019', N'Bắt đầu từ thời đại thực dân các vì sao,  cuối cùng loài người cũng phân bổ giá trị  quan chủ yếu của nền văn minh ra khắp tinh  hà rộng lớn. Đại bác chiến hạm vỡ nát trở thành mồi lửa châm nguồn năng lượng cho vũ trụ tối tăm lạnh lẽo, trong tầm ngắm của đại bác, chân lý có ở mọi nơi, từ đây câu chuyện mạo hiểm ly kỳ bắt đầu.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Hồ bơi tử thần', N'http://www.phimmoi.net/phim/ho-boi-tu-than-8716/', 1, 2, N'06/03/2019', N'Một tình huống trớ trêu khiến đôi nam nữ rơi vào cuộc chiến giành giật sự sống từ tay tử thần. Một chuỗi những điều tuyệt vọng liên tiếp xảy ra: không thức ăn, không lối thoát, cạn nước uống, và thậm chí là dã thú ăn thịt. Mắc kẹt dưới hồ sâu 6 mét, liệu cặp đôi sẽ xoay sở để sống sót trở về?', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Năm bước để yêu', N'http://www.phimmoi.net/phim/nam-buoc-de-yeu-8498/', 2, 3, N'06/03/2019', N'Năm Bước Để Yêu nói về câu chuyện tình của Will và Stella khi cả hai đều mang căn bệnh u xơ nang. Với những người mắc căn bệnh này, họ không thể đến gần nhau và khoảng cách 6 bước chân là quy tắc bất khả kháng để cả hai không bị lây nhiễm vi khuẩn của nhau.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Kẻ phá hủy', N'http://www.phimmoi.net/phim/ke-pha-huy-8768/', 3, 4, N'06/03/2019', N'Erin Bell (Nicole Kidman) cựu điệp viên từng hoạt động ngầm trong một băng đảng mafia. Nhiều năm sau khi vụ án kết thúc trong thảm kịch, kẻ cầm đầu băng nhóm trở lại giang hồ, Erin một lần nữa phải đối mặt với những nguy hiểm và chính quá khứ muốn chôn vùi của mình.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Khu nghỉ dưỡng xác sống', N'http://www.phimmoi.net/phim/khu-nghi-duong-xac-song-8731/', 9, 5, N'06/03/2019', N'Sau vụ bộc phát zombie kinh hoàng khiến nhiều người vô cùng hoảng sợ, cuối cùng chính quyền đã có thể kiểm soát được. Nếu một zombie thỉnh thoảng tìm thấy lối vào cuộc sống hàng ngày của con người, nó sẽ bị nhanh chóng xử lý bởi các cơ quan có thẩm quyền bảo vệ người dân. Trong thời đại của phim, vì đã quá quen với vấn nạn Zoombie, mọi người biết cách để xử lý một con zombie là như thế nào.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Vô ảnh', N'http://www.phimmoi.net/phim/vo-anh-i1-7931/', 7, 6, N'06/03/2019', N'Shadow (Vô Ảnh) lấy bối cảnh dưới thời kỳ Tam Quốc. Đại Đô Đốc Phái quốc Tử Ngu (Đặng Siêu) trong một lần chiến đấu đã bị thương nặng và phải ẩn thân trong bóng tối. Để tiếp tục nhiệm vụ của mình, hắn ta giao phó cho sát thủ có tên Cảnh Châu, biệt hiệu “Ảnh tử” – cũng chính là cái bóng của mình.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Hãy để anh yêu em', N'http://www.phimmoi.net/phim/hay-de-em-yeu-anh-8398/', 1, 7, N'06/03/2019',  N'LALA: HÃY ĐỂ EM YÊU ANH kể về những người trẻ theo đuổi đam mê, cùng nhau chia sẻ tình bạn, tình yêu, những tổn thương trong cuộc sống. Nhân vật Hà Mi (Chi Pu) là một nhạc sĩ trẻ đam mê sáng tác. Còn G-Feel (San E) là nhạc sĩ thiên tài của Hàn Quốc nhưng đang phải đối mặt với áp lực từ sự nổi tiếng.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Bí kiếp luyện rồng 3', N'http://www.phimmoi.net/phim/bi-kip-luyen-rong-3-vung-dat-bi-an-7724/', 8, 8, N'06/03/2019', N'Sau khi Hiccup tạo ra một thế giới hòa bình cho loài rồng, Răng Sún phát hiện ra một người bạn mới đầy bí hiểm. Lúc này Hiccup đã trở thành người lãnh đạo của cả làng gánh trên vai trọng trách gìn giữ sự an nguy cho mọi người. Vì vậy, cậu không thể mãi bị cuốn theo những cuộc phiêu lưu bất tận với Răng Sún. Và khi nguy hiểm ập đến ngôi làng, cả Hiccup và Răng Sún đều đã đứng lên, anh dũng bảo vệ giống loài của mình.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'GARO: Cầu hồn', N'http://www.phimmoi.net/phim/garo-cau-hon-8584/', 12, 9, N'06/03/2019', N'Sức mạnh, quyền lực, danh tiếng,... từ thời xưa, con người bị ám ảnh và trở nên lầm lỗi bởi những tham vọng của họ. Cũng từ đó Horrors xuất hiện, chúng xâm nhập vào con người từ mặt tối của họ để nuốt lấy linh hồn, chiếm lấy thể xác họ. Âm thầm chiến đấu tiêu diệt Horrors, những Ma giới kỵ sĩ tạo cho nhân loại một tia hi vọng..Một hiệp sĩ trong bộ đồ của trận đánh giáp vàng với một con quái vật huyền diệu ra để tiêu diệt thế giới.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Tế công hàng yêu', N'http://www.phimmoi.net/phim/te-cong-ha-ng-yeu-7261/', 6, 7, N'06/03/2019',  N'Yêu quái đại bàng từ địa ngục lên trần gian cùng đồng bọn tác oai tác quái. Nhằm ngăn chặn tai họa, Tế Công xin với Ngọc Đế phái thêm 5 vị tiên nữa cùng ông hàng yêu phục ma. Nào ngờ, Ngọc Đế lại bất cẩm khiến họ rơi vào tính huống dở khóc dở cười vì xuống trần mà mất đi pháp thuật và ký ức thần tiên.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Tế công hàng yêu 2', N'http://www.phimmoi.net/phim/te-cong-ha-ng-yeu-2-than-long-tai-xuat-7262/', 6, 7, N'06/03/2019', N'Tế Công phẫn nộ, oán hận ông trời vì sao lại chia cách uyên ương? Lẽ trời ở đâu? Giận dữ biến thành rồng thần, thề phải thay đổi vận mệnh, đi ngượi thiên ý, trực tiếp đi xuống địa phủ, chiến đầu chống lại các linh hồn tà ác, cướp lại nguyên thần của Phượng Nghi', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Xác ướp Ai Cập', N'http://www.phimmoi.net/phim/garo-cau-hon-8584/', 9, 10, N'06/03/2019', N'"Sức mạnh, quyền lực, danh tiếng,... từ thời xưa, con người bị ám ảnh và trở nên lầm lỗi bởi những tham vọng của họ. Cũng từ đó Horrors xuất hiện, chúng xâm nhập vào con người từ mặt tối của họ để nuốt lấy linh hồn, chiếm lấy thể xác họ. Âm thầm chiến đấu tiêu diệt Horrors, những Ma giới kỵ sĩ tạo cho nhân loại một tia hi vọng..Một hiệp sĩ trong bộ đồ của trận đánh giáp vàng với một con quái vật huyền diệu ra để tiêu diệt thế giới.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Luôn luôn có thể', N'http://www.phimmoi.net/phim/luon-luon-co-the-8754/', 1, 11, N'06/03/2019', N'Tuy gặp lại cô bạn thời niên thiếu của mình, Marcus sẽ phải đụng độ với một tình địch không ai ngờ tới là tài tử Keanu Reeves, làm cho nhân vật Marcus cảm thấy mình thua kém nhiều thứ. Liệu rồi chuyện của họ sẽ thế nào?', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Ảo ảnh', N'http://www.phimmoi.net/phim/ao-anh-8504/', 2, 12, N'06/03/2019', N'Mirage (Ảo Ảnh) bắt đầu với những hình ảnh của năm 1989, xoay quanh cậu bé 12 tuổi Nico Lasarte thích đàn hát và thường thu âm lại chúng bằng đầu băng VHS. Hai mươi lăm năm sau, ngôi nhà của Nico đã trở thành tổ ấm mới của đôi vợ chồng Vera Roy (Adriana Urgate) và David Ortiz (Alvaro Morte), cùng cô con gái nhỏ Gloria.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Con tin', N'http://www.phimmoi.net/phim/con-tin-8460/', 5, 13, N'06/03/2019', N'Chuyển thể từ cuốn truyện nổi tiếng cùng tên của nhà văn AnnPatchett, Bel Canto nói về một ca sĩ soprano (Julianne Moore) đi đến một đất nước độc tài ở Nam Mỹ để hát cho một kỹ nghệ gia Nhật Bản (Ken Watanabe).', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Chiến tranh lạnh', N'http://www.phimmoi.net/phim/chien-tranh-lanh-7791/', 7, 14, N'06/03/2019', N'Nội dung phim Cold War (Chiến Tranh Lạnh) lấy bối cảnh Ba Lan sau Thế chiến thứ hai, kể về chuyện tình của Zula (Joanna Kulig) - một ca sĩ trẻ trong đoàn hát của chính phủ - và Wiktor (Tomasz Kot) - một đạo diễn âm nhạc. Mọi chuyện trở nên phức tạp khi họ có chuyến lưu diễn ở Đông Berlin (Đông Đức) và có cơ hội đào ngũ.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Đại úy MARVEL', N'http://www.phimmoi.net/phim/dai-uy-marvel-i2-7399/', 3, 15, N'06/03/2019', N'Lấy bối cảnh những năm 90s, Captain Marvel là một cuộc phiêu lưu hoàn toàn mới đến với một thời kỳ chưa từng xuất hiện trong vũ trụ điện ảnh Marvel. Bộ phim kể về con đường trở thành siêu anh hùng mạnh mẽ nhất vũ trụ của Carol Danvers. Bên cạnh đó, trận chiến ảnh hưởng đến toàn vũ trụ giữa tộc Kree và tộc Skrull đã lan đến Trái Đất, liệu Danvers và các đồng minh có thể ngăn chặn binh đoàn Skrull cũng như các thảm họa tương lai?', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Mẹ ma than khóc', N'http://www.phimmoi.net/phim/me-ma-than-khoc-la-llorona-8370/', 9, 16, N'06/03/2019', N'Càng ngày, cô càng nhận ra sự trùng hợp ghê rợn giữa vụ việc của bà mẹ kia và những hiện tượng siêu nhiên xảy ra với chính gia đình mình, mà đứng đằng sau không ai khác chính là ác ma than khóc trong truyền thuyết La Llorona. Trước mối hiểm họa có thể ập đến hai người con của mình bất kỳ lúc nào, Anna buộc phải nhờ đến sự giúp đỡ của một thầy cúng địa phương để tống khứ bà mẹ ác quỷ về nơi mụ thuộc về.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Hoang Vu', N'http://www.phimmoi.net/phim/hoang-vu-8669/', 9, 17, N'06/03/2019', N'Phim kinh dị siêu nhiên The Wind lấy bối cảnh ở biên giới phía Tây cuối những năm 1800, Lizzy Macklin (Caitlin Gerard) - một phụ nữ bị điên loạn bởi sự khắc nghiệt và cô lập của vùng đất hoang vắng.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Tử nhân báo thù', N'http://www.phimmoi.net/phim/tu-nhan-bao-thu-8772/', 6, 7, N'06/03/2019', N'Khi được thả tạm thời khỏi nhà tù, một tên tội phạm đã trốn khỏi những người trông giữ hắn và quay trở lại vùng đất cũ để trả thù những người đã biến hắn trở thành một kẻ giết người máu lạnh. Đó là một trận chiến đẫm máu để tìm lại linh hồn đã đánh mất nhiều năm trước trên những con phố của một thành phố không tàn nhẫn...', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Bông hồng sát thủ', N'http://www.phimmoi.net/phim/bong-hong-sat-thu-8706/', 1, 18, N'06/03/2019', N'Lily là nữ sát thủ của tổ chức Bông Hồng Đen (BlackRose), cô phản bội lại tổ chức để chọn cuộc sống bình thường như bao người. 7 năm sau khi biết cô còn sống tổ chức sát thủ đã cho thành viên của mình xử lý cô và cả gia đình. Cuộc săn tử thần bắt đầu...', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Cỗ máy thời gian', N'http://www.phimmoi.net/phim/co-may-thoi-gian-8681/', 7, 19, N'06/03/2019', N'CJ (do Eden Duncan-Smith thủ vai) là một thần đồng khoa học và là người đã phát minh ra cỗ máy thời gian với mong muốn sử dụng cỗ máy này để quay ngược thời gian và cứu anh trai mình khỏi bị cảnh sát giết chết.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Báo thù', N'http://www.phimmoi.net/phim/bao-thu-8283/', 1, 20, N'06/03/2019', N'Báo Thù xoay quanh Nels Coxman một người đàn ông đang sống hạnh phúc với gia đình, thế nhưng tai hoạ đã ập đến khi cậu con trai chết một cách bí ẩn. Để tìm lại công lý cho cái chết của con mình, Nels đã truy lùng tay buôn ba tuý khét tiếng là Viking, người mà Nels tin là đã có dính dáng đến sự việc ấy.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Đại ca hóa soái ca', N'http://www.phimmoi.net/phim/dai-ca-hoa-soai-ca-8159/', 11, 7, N'06/03/2019', N'Đại Ca Hóa Soái Ca là câu chuyện hoán đổi linh hồn giữa cậu học sinh trung học Dong-hyun và tay xã hội đen máu mặt Pan-soo. Sau một tai nạn bất ngờ, linh hồn của ông chú trung niên Pan-soo tỉnh lại trong thân hình của Dong-hyun. Với thân phận mới, Pan-soo đã quyết định tìm hiểu nguyên nhân của vụ tráo đổi kỳ lạ này, bắt đầu từ vụ tai nạn khiến Dong-hyun rơi từ trên tầng cao xuống.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Kế hoạch tàn nhẫn', N'http://www.phimmoi.net/phim/ke-hoach-tan-nhan-8430/', 9, 21, N'06/03/2019', N'Lizzie là một phụ nữ chưa lập gia đình ở tuổi 32. Cô là người bị ruồng bỏ trong gia đình khi người cha là một quý tộc lấy thêm vợ lẽ. Cuộc đời của Lizzie đã trở nên tươi mới đầy sức sống khi Bridget Sullivan - một cô hầu gái trẻ nghèo khó đến sống với gia đình. Lizzie tìm thấy sự đồng cảm của cô hầu gái hiền lành, xinh đẹp. Và mối tình đồng giới của hai cô gái đã nảy nở nhưng đồng thời đi kèm với một kế hoạch độc ác được gây dựng.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Bão NORDA', N'http://www.phimmoi.net/phim/bao-norda-8497/', 8, 22, N'06/03/2019', N'Nội dung phim kể về Higashi, một nam sinh trung học sống trên một hòn đảo xa xôi, tách biệt với đất liền. Cậu thích chơi bóng rổ từ bé. Vì lý do khách quan, Higashi quyết định từ bỏ bộ môn thể thao yêu thích nhất của mình. Khi biết tin Higashi bỏ bóng rổ, người bạn thân của cậu tên Saijo đến gây sự và hai bên đã đánh nhau. Rồi một cô gái bí ẩn tên Noruda xuất hiện, tiết lộ những điều khó hiểu về một cơn bão sắp quét qua hòn đảo.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Đại chiến titan 2', N'http://www.phimmoi.net/phim/dai-chien-titan-tan-the-live-action-phan-2-2638/', 6, 23, N'06/03/2019', N'Bộ phim điện ảnh Attack on Titan gồm 2 phần Live-action được chuyển thể từ manga và anime cùng tên. Phần đầu phát hành ngày 1/8/2015 mang tên gốc Shingeki no Kyojin/Attack on Titan, và phần 2 phát hành vào 19/9/2015 mang tên Shingeki no Kyojin/Attack on Titan End of the World.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Sự phẫn nộ của các vị thần', N'http://www.phimmoi.net/phim/su-phan-no-cua-cac-vi-than-122/', 12, 24, N'06/03/2019', N'Wrath of Titans (Sự Phẫn Nộ Của Các Vị Thần) nói về Perseus-con trai thần Zeus đang trải qua cuộc sống êm đềm bên làng chai cùng cậu con trai 10 tuổi tên là Helius, nhưng cuộc tranh chấp giữa các vị thần đã phá vỡ khung cảnh yên ả ấy sự trỗi dậy của các Titan và Zeus bị giam cầm đã buộc Perseus phải tham gia vào nhiệm vụ đầy hiểm nguy mới', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Xác ướp trở lại', N'http://www.phimmoi.net/phim/xac-uop-2-xac-uop-tro-lai-1949/', 9, 25, N'06/03/2019', N'Đã 8 năm trôi qua kể từ khi Rick và Evelyn lần đầu tiên gặp nhau. Trong phần hai của loạt phim về xác ướp Ai Cập, họ đã kết hôn và có một câu con trai kháu khỉnh 8 tuổi Alex. Lần trở lại này, cả Evelyn và Alex đều gặp nguy hiểm khi cậu bé nghịch ngợm đeo vào tay chiếc vòng của Vua Bọ Cạp còn Evelyn thì phát hiện ra mình là một công chúa Ai Cập trong thế giới cổ xưa...', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'The last dark', N'http://www.phimmoi.net/phim/blood-c-the-last-dark-8347/', 6, 26, N'06/03/2019', N'Sự báo thù của Saya', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Tôi chờ đợi giây phút em yêu tôi', N'http://www.phimmoi.net/phim/toi-cho-doi-giay-phut-em-yeu-toi-8251/', 5, 27, N'06/03/2019', N'Tôi Chờ Đợi Giây Phút Em Yêu Tôi là bộ phim thứ hai lấy cảm hứng từ series bài hát HoneyWorks, sau Em đã Yêu Anh Từ Rất Lâu. Bộ phim xoay quanh nhóm nhạc Honey Works và bài hát Ima Suki ni Naru và Sankaku Ghen. Album mới nhất của nhóm nhạc, nó đã được phát hành vào tháng 7 năm 2015', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Blame: Thành phố cổ', N'http://www.phimmoi.net/phim/blame-thanh-pho-co-7949/', 7, 28, N'06/03/2019', N'Trong tương lai công nghệ cao, nền văn minh nhân loại gắn liền với Internet - bước tiến tối thượng của con người. Trong quá khứ, một loại ""bệnh truyền nhiễm"" đã lây lan làm sập các hệ thống tự động, dẫn đến việc xuất hiện cấu trúc thành phố đa-tầng liên tục nhân bản vô hạn. Giờ đây, nhân loại đã mất kết nối với bộ phận điều khiển thành phố, và con người hiện đang bị hệ thống phòng ngự (gọi là Bộ Phận Bảo An) săn đuổi và tiêu diệt.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Lạc vào khu rừng đon đóm', N'http://www.phimmoi.net/phim/lac-vao-khu-rung-dom-dom-2665/', 4, 29, N'06/03/2019', N'Được chuyển thể từ manga cùng tên, Hotarubi no Mori e kể về Hotaru, trong một lần cô bé đi lạc vào rừng thì gặp được Gin, một chàng trai trẻ kì lạ mà khi bị con người chạm vào thì cậu ta sẽ biến mất, Gin dẫn Hotaru rời khỏi khu rừng và câu chuyện bắt đầu từ đó...', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Mộ đom đóm', N'http://www.phimmoi.net/phim/mo-dom-dom-2573/', 8, 30, N'06/03/2019', N'Grave Of The Fireflies là bộ anime được dựa theo cuốn tiểu thuyết cùng tên của Nosaka Akiyuki. Bộ phim đặt trong bối cảnh giai đoạn cuối của Chiến tranh thế giới 2 ở Nhật Bản, kể lại câu chuyện chua xót nhưng cảm động về tình anh em của hai đứa trẻ mồ côi Seita và em gái Setsuko.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Ngôi nhà giữa rừng', N'http://www.phimmoi.net/phim/hansel-and-gretel-5307/', 12, 7, N'06/03/2019', N'Ngày nào Eun Soo cũng rời khỏi nhà, đi vào rừng để tìm đường về nhà, nhưng cuối cùng vẫn phải quay lại căn nhà đó. Có điều gì bất thường nơi đây?', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Khu rừng chết chóc', N'http://www.phimmoi.net/phim/khu-rung-chet-choc-1799/', 9, 31, N'06/03/2019', N'Bộ phim kể về Gia đình nhà Patrick, một bác sỹ thú y có cô con gái chết bởi vết cắn của một con chó hoang. Gia đình Patrick đã được trao một cơ hội để có thể đoàn tụ với cô con gái trong vòng 3 ngày. Và chuyện gì sẽ xảy ra sau đó...', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Tháng tư là lời nói dối của em', N'http://www.phimmoi.net/phim/thang-tu-la-loi-noi-doi-cua-em-live-action-4150/', 5, 32, N'06/03/2019', N'Tháng tư là lời nói dối của em kể về thần đồng piano Amira Kosei, người được mệnh danh là máy đánh nhịp sống với từng nốt nhạc chuẩn y hệt từ trong sheet nhạc bước ra. Tuy nhiên từ sau cái chết của mẹ, câu không còn nghe được Piano nữa và sự nghiệp nhạc công cũng bắt đầu chìm vào quên lãng.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Ban nhạc tai tiếng', N'http://www.phimmoi.net/phim/ban-nhac-tai-tieng-8670/', 5, 33, N'06/03/2019', N'The Dirt là bộ phim Hollywood do Netflix sản xuất, dựa trên cuốn tự truyện The Dirt: Confessions of the World’s Most Notorious Rock Band (tạm dịch: Dơ bẩn: Tự thú của ban nhạc rock tai tiếng nhất thế giới) về ban nhạc rock Mötley Crüe. Douglas Booth, Iwan Rheon, Machine Gun Kelly và Daniel Webber sẽ diễn vai các thành viên của ban nhạc “hoang dã” gây nhiều tranh cãi này.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'A star is born', N'http://www.phimmoi.net/phim/vi-sao-vut-sang-i10-7246/', 2, 34, N'06/03/2019', N'A Star Is Born là bộ phim điện ảnh đầu tiên mà nữ ca sĩ nổi tiếng Lady Gaga đảm nhiệm vai chính. Và đây cũng là lần đầu nam diễn viên Bradley Copper thử sức ở vai trò đạo diễn.', 1)

insert into Object(DisplayName, Link, IdKind, IdSuplier, DateInput, Describe, Status)
values (N'Tiểu thuyết gia', N'http://www.phimmoi.net/phim/tieu-thuyet-gia-8439/', 11, 35, N'06/03/2019', N'Bộ phim tiểu sử về cuộc đời của nữ tiểu thuyết gia nổi tiếng người Pháp Colette, được đạo diễn ấp ủ 15 năm để hoàn thành. Kiều nữ Keira Knightley đóng vai chính trong phim với cuộc đời đầy thăng trầm của Colette. Phim nhấn mạnh sự dằng xé của nữ nhà văn trong công việc viết lách, cùng với những mâu thuẫn trong giới tính và đời sống tình dục đa dạng.', 1)

------------------insert PayHistory
insert into PayHistory(IdUser, Total, Status) values (3,90000,N'1')
insert into PayHistory(IdUser, Total, Status) values (4,180000,N'1')
insert into PayHistory(IdUser, Total, Status) values (5,360000,N'1')
