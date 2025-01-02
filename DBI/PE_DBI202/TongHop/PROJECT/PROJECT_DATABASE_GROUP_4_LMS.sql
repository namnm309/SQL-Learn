﻿--create database Project
drop database LIBRARY_MANAGEMENT_SYSTEM
create database LIBRARY_MANAGEMENT_SYSTEM

-- create table KindOfBook
create table KindOfBook(
BookCode char(50) NOT NULL PRIMARY KEY, 
Category nvarchar(200) NOT NULL)
------------------INSERT------------------------------------------
insert into KindOfBook(BookCode, Category) values ('TL',N'Tâm Lý – Kỹ Năng Sống')
insert into KindOfBook(BookCode, Category) values ('YHSK',N'Y Học – Sức Khỏe')
insert into KindOfBook(BookCode, Category) values ('VH-NT',N'Văn Hoá – Nghệ Thuật')
insert into KindOfBook(BookCode, Category) values ('TVPT',N'Tử Vi – Phong Thủy')
insert into KindOfBook(BookCode, Category) values ('PL-MH',N'Phiêu Lưu – Mạo Hiểm')
insert into KindOfBook(BookCode, Category) values ('TH',N'Triết Học')
insert into KindOfBook(BookCode, Category) values ('KT-XD',N'Kiến Trúc – Xây Dựng')
insert into KindOfBook(BookCode, Category) values ('HT',N'Tài Liệu Học Tập – Giáo Trình')
insert into KindOfBook(BookCode, Category) values ('KT-QL',N'Kinh Tế – Quản Lý')
insert into KindOfBook(BookCode, Category) values ('NN',N'Học Ngoại Ngữ')
insert into KindOfBook(BookCode, Category) values ('TT-HS',N'Trinh Thám – Hình Sự')
insert into KindOfBook(BookCode, Category) values ('LS',N'Lịch Sử')
insert into KindOfBook(BookCode, Category) values ('AT-NA',N'Ẩm Thực – Nấu Ăn')
insert into KindOfBook(BookCode, Category) values ('MKT',N'Marketing – Bán Hàng')
insert into KindOfBook(BookCode, Category) values ('KH-KT',N'Khoa Học – Kỹ Thuật')
insert into KindOfBook(BookCode, Category) values ('CNTT',N'Công Nghệ Thông Tin')
insert into KindOfBook(BookCode, Category) values ('TC-CK',N'Tài Chính – Chứng Khoán')
insert into KindOfBook(BookCode, Category) values ('GT',N'Giải Trí')
------------------DONE------------------------------------------

-- create table Publisher
create table Publisher(
PublisherID char(50) NOT NULL PRIMARY KEY,
Name nvarchar(200) NOT NULL,
Address nvarchar(200) NOT NULL,
Website char(100),
Other nvarchar(200)
)
------------------INSERT------------------------------------------
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('UTSRP',N'Bách Khoa Hà Nội',N'Số 1 Đường Đại Cồ Việt, Hai Bà Trưng , Hà Nội','BachKhoaNXB.vn',N'Nhiều loại sách cả trong và ngoài nước')
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('VJTYN',N'Chính trị Quốc gia Sự thật',N'6/86 Duy Tân, Cầu Giấy, Hà Nội',NULL,N'Chuyên về chính trị tư tưởng cách mạng')
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('TYRES',N'Công Thương',N'Tầng 4, Tòa nhà Bộ Công Thương, số 655 Phạm Văn Đồng, quận Bắc Từ Liêm, Hà Nội',NULL,NULL)
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('YVWTZ',N'Công an nhân dân',N'92 Nguyễn Du, quận Hai Bà Trưng, TP. Hà Nội','Congannhandanexpress.vn',NULL)
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('DZXDT',N'Dân trí',N'Số 9, ngõ 26, phố Hoàng Cầu, quận Đống Đa, thành phố Hà Nội',NULL,N'Nhà xuất bản nổi tiếng và uy tín,phổ biến rỗng rãi toàn dân')
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('ELBAJ',N'Giao thông vận tải',N'80B Trần Hưng Đạo, Quận Hoàn Kiếm, Thành phố Hà Nội',NULL,NULL)
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('LQJAG',N'Giáo dục Việt Nam',N'81 Trần Hưng Đạo - Q. Hoàn KIếm - Hà Nội','NXBGiaoDuc.vn',N'Chuyên về các đầu sách phục vụ cho ngành giáo dục')
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('OZITJ',N'Hàng hải',N'484 Lạch Tray, Ngô Quyền, Hải Phòng',NULL,N'Chuyên về các đầu sách phục vụ cho ngành giáo dục')
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('GGKTH',N'Hồng Đức',N'65 Tràng Thi, Hà Nội',NULL,NULL)
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('XDCRG',N'Hội Nhà văn',N'Số 65 Nguyễn Du, Hà Nội',NULL,N'Các đầu sách hay về văn học Việt Nam qua các thời kì')
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('UOIDA',N'Kim Đồng',N'55 Quang Trung, Hà Nội, Việt Nam','KimDongNXB.vn',N'Nhà xuất bản nổi tiếng về các ấn phẩm cho thiếu nhi')
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('QLPHK',N'Lao động',N'75 Giảng Võ, Đống Đa, Hà Nội',NULL,NULL)
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('AZCWE',N'Lao động - Xã hội',N'Số 36, Ngõ hoà bình 4 - Minh khai - Hai Bà Trưng - Hà Nội',NULL,NULL)
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('AEEBD',N'Phụ nữ',N'39 Hàng Chuối, Hà Nội','PhuNu.vn',N'Chuyên về các đầu sách của phái đẹp')
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('MAUMX',N'Quân đội nhân dân',N'23 Lý Nam Đế, Hà Nội','Quandoinhandan.vn',NULL)
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('AEPHB',N'Thanh niên',N'Số 64 Bà Triệu - Hoàn Kiếm - Hà Nội','NXBThanhNien.vn',NULL)
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('YWDLZ',N'Thông tin và Truyền thông',N'Tầng 6 Tòa nhà 115 Trần Duy Hưng, Cầu Giấy, Hà Nội',NULL,NULL)
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('GNLMR',N'Văn học',N'18 Nguyễn Trường Tộ, P.Trúc Bạch, Ba Đình, Hà Nội',NULL,NULL)
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('AJZZB',N'Y học',N'352 Đội Cấn, Ba Đình, Hà Nội','Yhoc.vn',N'Chuyên về các đầu sách phục vụ ngành y')
insert into Publisher(PublisherID, Name, Address, Website, Other) values ('BVROO',N'Âm nhạc',N'61 Lý Thái Tổ - Hoàn Kiếm - Hà Nội',NULL,N'Các loại sách âm nhạc giải trí')
------------------DONE------------------------------------------

-- create table Books
create table Books(
BookID char(50) NOT NULL PRIMARY KEY,
Title nvarchar(100) NOT NULL,
AuthorName nvarchar(100),
PublisherID char(50) NOT NULL,
BookCode char(50) NOT NULL,
Year int check (Year <= YEAR(getDate())),
Edition int,
Quantity int NOT NULL,
Briefly nvarchar(1000)
constraint fk_Books_KindOfBook FOREIGN KEY(BookCode) references KindOfBook(BookCode),
constraint fk_Books_Publisher FOREIGN KEY(PublisherID) references Publisher(PublisherID)
)
------------------INSERT------------------------------------------
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('QPLDS',N'Trái Tim Của Bé',N'BS. Ngô Bảo Khoa','XDCRG','YHSK',2018,5,50,N'Trái tim của bé là một tài liệu hữu ích của Bác sĩ Ngô Bảo Khoa dành cho ba mẹ và những gia đình có trẻ bị bệnh tim bẩm sinh hoặc bệnh tim thứ phát')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('PLSJD',N'Bác Sĩ Của Con',N'Shelly Vaziri Flais','QLPHK','YHSK',2019,3,30,N'Người ta thường nói rằng nuôi dạy một đứa trẻ hạnh phúc, khỏe mạnh và ngoan ngoãn là một trong những nỗ lực khó khăn và đòi hỏi nhiều cố gắng nhất của toàn nhân loại')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('AKDPS',N'Tử Vi Đẩu Số Phi Tinh',N'Trần Đoàn','AEEBD','TVPT',2020,5,40,N'Hệ thống nội dung của Tử vi đẩu số phi tinh dựa trên việc lý giải 18 phi tinh trong mối quan hệ với cát hung, họa phúc, thọ yểu, sức khỏe, bệnh tật, hôn nhân, quan hệ lục thân, đường quan lộc của đời người')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('ALSKO',N'Lập Và Giải Tử Vi Đẩu Số',N'Vũ Mê Linh','AEEBD','TVPT',2018,6,25,N'Giải Tử Vi Đẩu Số là tập hợp những quan niệm mới dựa dựa trên phương diện toán học để nêu lên những điều mà lâu nay giới Đẩu số là tuyệt mật của Tử Vi')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('QUE04',N'Tôi Tư Duy, Vậy Thì Tôi Vẽ',N'Thomas Cathcart','QLPHK','TH',2019,3,33,N'Thomas Cathcart và Daniel Klein một lần nữa dẫn dắt bạn đọc bước vào ngôi đền triết học linh thiêng bằng những tràng cười ngả nghiêng')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('PWOD2',N'50 Ý Tưởng Triết Học',N'Ben Dupré','XDCRG','TH',2019,5,10,N'Bàn về 50 chủ đề triết học thú vị, cuốn sách là một minh chứng cho thấy triết học không hề khô khan, sách vở')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('9RUDH',N'Trí Tuệ Dân Tộc Úc',N' Kiến Văn , Gia Khang','VJTYN','HT',2020,10,15,N'Những đặc trưng khái quát về một đất nước, một dân tộc.Dành cho giới nghiên cứu, tham khảo: rất hữu ích đối với ngành du lịch Úc')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('OWIED',N'Câu Chuyện Nghệ Thuật',N'E. H. Gombrich','VJTYN','HT',2018,3,17,N'Câu Chuyện Nghệ Thuật là một tác phẩm kể về lịch sử nghệ thuật châu Âu từ thời cổ đại đến hiện đại, được tác giả khảo sát và đánh giá trong các lĩnh vực khác nhau như hội họa, điêu khắc, kiến trúc… song hành với những chuyển biến và giao thoa của các nền văn hóa, chính trị, và tôn giáo')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('0EUWJ',N'Châu Âu Có Gì Lạ Không Em',N' Misa Gjone','YVWTZ','NN',2019,5,19,N'Cuốn sách là những ghi chép và mô tả của tác giả về hành trình du lịch của bản thân qua một số quốc gia châu Âu, từ đó chia sẻ những trải nghiệm chân thực và mới mẻ về văn hóa, lịch sử, ẩm thực và con người nơi xứ lạ')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('SUA8D',N'Tokyo Du Hí',N' Christine Mari Inzer','YVWTZ','NN',2017,5,30,N'Nhật kí du lịch Nhật Bản của Christine sẽ gợi cho bạn nhớ về những chuyến du lịch thời thanh xuân của chính mình và đưa bạn du hành cùng cô ấy trong niềm vui thích tuyệt vời với những khám phá và phiêu lưu của tuổi trẻ')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('45LPK',N'Lịch Sử Chiến Tranh',N'John Keegan','ELBAJ','LS',2018,10,22,N'Chiến tranh là văn minh hay dã man? Trả lời câu hỏi tưởng như dễ này, không dễ. Loài người ngày càng văn minh hơn, ngày càng nhiều khám phá khoa học gây sốc hơn và nhiều phát minh khó ngờ hơn, song chẳng phải vì vậy mà các cuộc chiến tranh ít đi')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('LPSOR',N'10 Đồng Tiền Thay Đổi Thế Giới',N'Thomas Hockenhull','ELBAJ','LS',2018,5,27,N'Cuốn sách 10 Đồng Tiền Thay Đổi Thế Giới nói về 10 đồng tiền có lịch sử lâu đời và sức ảnh hưởng lớn nhất. Những đồng tiền này hoạt động như những biểu tượng mạnh mẽ và đứng vững bất chấp sự thay đổi sâu sắc về hình thái xã hội, kinh tế, chính trị.')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('LFKDS',N'Rock Hà Nội, Bolero Sài Gòn',N' Nguyễn Trương Quý','OZITJ','MKT',2018,5,20,N'Rock Hà Nội, Bolero Sài Gòn - Câu chuyện tân nhạc Việt Nam hé mở những hiện tượng và cột mốc của âm nhạc dưới góc nhìn độc đáo, tỉ mỉ và mê say của một nhà nghiên cứu độc lập người Mỹ')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('94JDX',N'Huyền Thoại Nhạc Pop',N'Thông Tấn','OZITJ','MKT',2018,5,10,N'Huyền Thoại Nhạc Pop Michael Jackson')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('ASH32',N'Giải Pháp Cho Internet Vạn Vật',N'Timothy Chou','AEPHB','CNTT',2018,5,24,N'Tiến sĩ Timothy Chou đã viết ra quyển Chính Xác (Precision) để giới thiệu cho chúng ta những điều cơ bản về Internet Vạn vật (IoT) của doanh nghiệp')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('054JD',N'Vật Liệu Và Thiết Bị NANO',N' Trương Văn Tân','AEPHB','CNTT',2018,5,20,N'Hình dung và nắm bắt khá đầy đủ về một phạm trù khoa học, mà ngay nhiều nhà khoa học đang ngày đêm miệt mài trong phòng thí nghiệm cũng chưa hẳn đã có thể hiểu biết tường tận')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('94JFH',N'Giáo Trình Kỹ Thuật Audio Và Video',N' Nguyễn Tấn Phước','GNLMR','CNTT',2018,5,17,N'Mức độ lý luận có sự chọn lọc những kiến thức không quá sâu, nhằm phục vụ cho việc giảng dạy ở nhiều bậc đào tạo khác nhau, đồng thời là tài liệu tham khảo cho các đối tượng muốn tìm hiểu về kỹ thuật viên, công nhân lành nghề')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('SLKN3',N'Mô Hình Điều Khiển Từ Xa',N' Đặng Y Gô','GNLMR','CNTT',2018,5,13,N'Nhóm bay máy bay mô hình NESRC (North East Saigon Radio Control) thuộc Câu lạc bộ Hàng không phía Nam gồm gần 50 thành viên, thường sinh hoạt bay tại khu vực Đông Bắc Sài Gòn')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('842HD',N'Lê La Quà Vặt',N'Đặng Hồng Quân , Nguyễn Trương Quý','BVROO','GT',2018,5,12,N'Bài xẩm nổi tiếng về chợ Đồng Xuân dành quá nửa viết về các món quà vặt ở đầu thế kỷ trước. Vui nhộn và đầy say mê, đến nay những món quà ấy vẫn còn được thưởng thức')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('83HDY',N'Nụ Cười Việt Nam',N'Graham Stichbury','BVROO','GT',2018,5,20,N'Nụ cười luôn nở trên môi của người Việt Nam là một trong những ấn tượng khó phai trong lòng người đến sinh sống nơi đây hay khách du lịch phương xa')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('9RUFH',N'Bản chất của dối trá',N'Dan Ariely','UTSRP','TL',2010,3,50,N'Dan Ariely cho thấy tại sao một số điều dễ nói dối hơn những điều khác, làm thế nào để gặp ít vấn đề hơn chúng ta tưởng hơn khi bị lừa dối')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('WUEJF',N'Nghịch Lý Của Sự Lựa Chọn',N'Barry Schwartz','UTSRP','TL',2019,4,30,N'Schwartz lập luận rằng cách đây nhiều năm việc ra quyết định đơn giản hơn rất nhiều')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('POR0I',N'Sổ Tay Kỹ Thuật Thi Công Nhà Ở Gia Đình',N'Nguyễn Bá Đô','AZCWE','KT-XD',2011,2,100,N'Cuốn sổ tay này chủ yếu đề cập đến các yêu cầu và kỹ thuật thi công các bộ phận của nhà')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('OFHPD',N'Quản Lý Dự Án Xây Dựng',N'S. Keoki Sears Glenn A. Sears Richard H.Clough','AZCWE','KT-XD',2010,1,50,N'Hơn 50 năm qua, cuốn Quản lý Dự án Xây dựng của Clough và Sears đã được xem là cẩm nang hướng dẫn toàn diện về quá trình hoạch định lịch trình dự án theo phương pháp đường găng (CPM)')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('JF8DG',N'Hát then các dân tộc Tày, Nùng, Thái Việt Nam',N'Phùng Đình Kiên','TYRES','VH-NT',2017,4,50,N'Giới thiệu văn hóa dân tộc Tày Nùng')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('KODJK',N'Lược khảo văn học',N'Nguyễn Văn Trung','TYRES','VH-NT',2020,8,50,N'Tác giả đặt vấn đề nghiên cứu văn học như một khoa nghiên cứu, có lịch sử, hệ thống khái niệm, tác giả, tác phẩm')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('45FHD',N'Bước đi ngẫu nhiên trên phố Wall',N' Burton G.Malkiel','DZXDT','TC-CK',2018,7,10,N'Sơ lược về chứng khoán')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('HFJ3D',N'Nhà đầu tư thông minh',N'Benjamin Graham','DZXDT','TC-CK',2014,3,50,N'Đầu tư có bài bản và khoa học')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('YDGSB',N'Kĩ thuật điện',N'Lê Văn Doanh','LQJAG','KH-KT',2010,1,32,N'Kỹ thuật điện nghiên cứu những ứng dụng của các hiện tượng điện tử nhằm biến đổi năng lượng và tín hiệu')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('LPO2D',N'Điện tử công suất',N'Lê Văn Doanh','LQJAG','KH-KT',2012,4,50,N'lĩnh vực kỹ thuật hiện đại, nghiên cứu ứng dụng các linh kiện bán dẫn công suất làm việc ở chế độ chuyển mạch vào quá trình biến đổi điện năng')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('SDVSE',N'Chiếc nhẫn tình cờ',N'Conan Doyle','GGKTH','TT-HS',2016,8,32,N'Trinh thám về tử thi và hiện trường')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('MVQEX',N'Án mạng trên chiếc tàu tốc hành phương Đông',N'Agatha Christie','GGKTH','TT-HS',2016,12,30,N'án mạng xảy ra trên con tàu')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('IQK4A',N'Dế mèn phiêu lưu kí',N'Tô Hoài','UOIDA','PL-MH',2012,4,60,N'Câu chuyện về thế giới phiêu lưu của dế mèn với muôn vàn động vật,thiên nhiên sinh động')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('7EPWN',N'Đất Rừng Phương Nam',N'Đoàn Giỏi','UOIDA','PL-MH',2021,5,75,N'Thăm thú cảnh vật nới miền Tây sông nước')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('8G0SO',N'Khám Phá Ẩm Thực Truyền Thống Việt Na',N'Ngô Đức Thịnh','MAUMX','AT-NA',2015,4,30,N'Văn hóa ẩm thực Việt Nam')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('Z9LGW',N'Sài Gòn, Ồ Bỗng Ngon Ghê',N'Vũ Thịnh','MAUMX','AT-NA',2021,8,43,N'Văn hóa ẩm thức Sài Gòn')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('3EJ3S',N'Kinh điển về khởi nghiệp',N'Dan Senor ','YWDLZ','KT-QL',2012,14,30,N'Dù khởi nghiệp kinh doanh là con đường mà bạn đã hay sẽ lựa chọn, cuốn sách Kinh điển về Khởi nghiệp cũng đều sẽ là cẩm nang tuyệt vời giúp bạn xây dựng được một doanh nghiệp thực sự thành công')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('71TYE',N'Những cuộc phiêu lưu trong kinh doanh',N'Benjamin Graham','YWDLZ','KT-QL',2020,10,60,N'Dù có sản phẩm chất lượng hay kế hoạch sản xuất và truyền thông xuất sắc đến đâu chăng nữa, bạn vẫn cần những con người thích hợp để chỉ đạo và thực hiện kế hoạch đó."')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('8SF1G',N'Quốc gia khởi nghiệp',N'Dan Senor','AJZZB','KT-QL',2006,4,30,N'Quốc gia khởi nghiệp là câu chuyện viết về sự phát triển thần kỳ của nền kinh tế Israel từ lúc lập quốc cho đến khi trở thành quốc gia có nền công nghệ hàng đầu thế giới')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('S4942',N'Xây dựng để trường tồn',N'Benjamin Graham','AJZZB','KT-QL',2007,10,50,N'Dựa trên một dự án nghiên cứu kéo dài 6 năm tại trường kinh doanh thuộc Đại học Stanford, các tác giả lập ra một danh sách gồm 18 công ty vĩ đại')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('GCWWS',N'Robert Kirkman','Tony Moore, Charlie Adlard, Cliff Rathburn','UTSRP','GT',2004,5,100,NULL)
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('82ZLR',N'Fool Moon','Tony Stark','LQJAG','GT',2001,2,60,NULL)
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('4U7X8',N'Prophet','Lida Clause','UOIDA','GT',1992,4,85,NULL)
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('N0DBU',N'Abraham Lincoln: Vampire Hunter','Hari Hari','UOIDA','GT',2010,6,45,NULL)
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('2TIVX',N'Glory over Everything: Beyond The Kitchen House','Bottom Hust','UOIDA','GT',2016,5,25,NULL)
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('YDX56',N'The Orenda','Benjamin','AEEBD','PL-MH',2013,2,60,NULL)
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('OBYSD',N'Kill the Dead','Boster Potal','QLPHK','PL-MH',2010,1,45,NULL)
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('6P3Q0',N'The Woman Who Rides Like a Man','Patrix','GNLMR','PL-MH',1986,2,21,NULL)
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('L8CDU',N'The Short Stories','Waada','GNLMR','PL-MH',1920,5,60,NULL)
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('77SQ4',N'Hà Nội ngàn năm kí ức',N'Phương Chi','UOIDA','VH-NT',2021,3,100,N'Những hình ảnh biểu tượng về lịch sử hơn một nghìn năm hào hùng, bi tráng của Thăng Long - Hà Nội sẽ được tái hiện qua "Hà Nội ngàn năm kí ức". Không chỉ là cuốn sách cung cấp thông tin, đây còn là một sản phẩm sách Pop-up - sách dựng hình 3D với thiết kế đặc biệt, mang tới cho bạn đọc những trải nghiệm hình ảnh sống động nhất về 11 danh lam thắng cảnh của thủ đô Hà Nội mến yêu.')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('G2IKF',N'Cuốn Sách Về Quyền Lực - Nó Là Cái Gì, Ai Có Nó, Và Tại Sao',N'Thùy Dung','UOIDA','TL',2020,2,100,N'Trong đời sống, có ai thường bảo em phải làm việc này việc kia và em răm rắp nghe theo không? Họ là bố mẹ, thầy cô giáo hay anh chị của em? Những người này có một thứ gọi là QUYỀN LỰC. Bản thân quyền lực không tốt, cũng chẳng xấu, tất cả hoàn toàn phụ thuộc vào cách nó được sử dụng')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('XHBPC',N'Cuốn sách giúp người đọc cảm nhận về ý nghĩa của cuộc sống',N'Xuân Quang','XDCRG','TL',2020,1,50,N'Đó là những gì Kito Aya có trong hơn 20 năm cuộc đời. Với Aya, tương lai của cô là một con đường hẹp, và càng ngày nó càng trở nên hẹp hơn. Căn bệnh ngăn trở Aya khỏi tất cả những ước mơ và dự định, thậm chí việc tự mình bước ra ngoài phố để đi tới hiệu sách cũng trở thành một khao khát) cháy bỏng.')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('9P5D4',N'Rèn Luyện Tư Duy Logic',N'Việt Anh','DZXDT','YHSK',2020,4,50,N'Năm 219, Tào Tháo liên thủ với Tôn Quyền, đánh bại Quan Vũ nhà Thục Hán. Sau đó, Tôn Quyền dâng biểu lên Tào, tự xưng là thần, mong họ Tào xưng đế thay cho Hán Hiến Đế. Tào Tháo cho quần thần xem bức thư của Tôn Quyền rồi bảo, “Tôn Quyền này muốn bỏ chúng ta vào lò nướng đây.”')
insert into Books(BookID, Title, AuthorName, PublisherID, BookCode, Year, Edition, Quantity, Briefly) values ('F92XV',N'Cuộc Đời Của Pi',N'Hải Phong','GNLMR','PL-MH',2020,5,60,N'Mọi việc ở đời có bao giờ diễn ra như ta vẫn tưởng, nhưng biết làm sao. Cuộc đời đem cho ta cái gì thì ta phải nhận cái đó và chỉ còn cách làm cho chúng tốt đẹp nhất mà thôi.')
------------------DONE------------------------------------------

-- create table Staffs
create table Staffs(
StaffID char(50) NOT NULL PRIMARY KEY CHECK (StaffID like 'FU[0-9][0-9][0-9][0-9][0-9][0-9]'), 
Name nvarchar(100) NOT NULL,
Address nvarchar(200),
Date_of_birth date NOT NULL check (Date_of_birth < getDate()),
Gender bit NOT NULL check (Gender like 0 or Gender like 1),
Phone char(50) UNIQUE CHECK (Phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Email char(100),
Date_started date NOT NULL,
Password char(50) NOT NULL
)
------------------INSERT------------------------------------------
insert into Staffs(StaffID,Name,Address,Date_of_birth,Gender,Phone,Email,Date_started,Password) values ('FU143548',N'Nguyễn Văn A',N'368, Âu Cơ, Hạ Hòa, Hạ Hòa, Phú Thọ','19800626',1,'0333204166','thudong11@gmail.com','20180721','123456789')
insert into Staffs(StaffID,Name,Address,Date_of_birth,Gender,Phone,Email,Date_started,Password) values ('FU133558',N'Trần Văn Quý',N'123, Tam Khương, Khương Thượng, Đống Đa, Hà Nội','19801024',1,'0866811237','tuankhang19@gmail.com','20170711','123456789')
insert into Staffs(StaffID,Name,Address,Date_of_birth,Gender,Phone,Email,Date_started,Password) values ('FU143685',N'Lê Văn Lâm',N'169, Tây Sơn, Quang Trung, Đống Đa, Hà Nội','19870926',1,'0342666531','tamtang20@gmail.com','20160910','123456789')
insert into Staffs(StaffID,Name,Address,Date_of_birth,Gender,Phone,Email,Date_started,Password) values ('FU111254',N'Nguyễn Vũ Hoàng',N'15, Thái Thịnh, Thịnh Quang, Đống Đa, Hà Nội','19880611',1,'0354985818','thanhtan12@gmail.com','20181121','123456789')
insert into Staffs(StaffID,Name,Address,Date_of_birth,Gender,Phone,Email,Date_started,Password) values ('FU133654',N'Đặng Mạnh Cường',N'103, đường Tam Khương, Khương Thượng, Đống Đa, Hà Nội','19800525',0,'0373243088','ngocthien65@gmail.com','20180702','123456789')
insert into Staffs(StaffID,Name,Address,Date_of_birth,Gender,Phone,Email,Date_started,Password) values ('FU142708',N'Thân Văn Lâm',N'183, Hoàng Văn Thái, Khương Mai, Thanh Xuân, Hà Nội ','19800226',1,'0348387386','nhuvan19@gmail.com','20180521','123456789')
insert into Staffs(StaffID,Name,Address,Date_of_birth,Gender,Phone,Email,Date_started,Password) values ('FU133578',N'Nguyễn Thành Đạt',N'103, Lê Trọng Tấn, Khương Trung, Thanh Xuân, Hà Nội','19800620',1,'0359757368','tonuwxa@gmail.com','20180623','123456789')
insert into Staffs(StaffID,Name,Address,Date_of_birth,Gender,Phone,Email,Date_started,Password) values ('FU153204',N'Tiết Nguyên Thành',N'184, Trường Chinh, Khương Thượng, Đống Đa, Hà Nội','19890620',1,'0335151714','trandan55@gmail.com','20170720','123456789')
insert into Staffs(StaffID,Name,Address,Date_of_birth,Gender,Phone,Email,Date_started,Password) values ('FU130487',N'Nguyễn Thế Nguyên',N'201, Thái Thịnh, Trung Liệt, Đống Đa, Hà Nội','19900625',1,'0865074574','baongoc32@gmail.com','20201111','123456789')
insert into Staffs(StaffID,Name,Address,Date_of_birth,Gender,Phone,Email,Date_started,Password) values ('FU140396',N'Đoàn Hải Phong',N'321, Pháo Đài Láng, Láng Thượng, Đống Đa, Hà Nội','19880510',0,'0367910186','tuanvu14@gmail.com','20181005','123456789')
select * from Staffs
------------------DONE------------------------------------------

-- create table Readers
create table Readers(
ReaderID char(50) NOT NULL PRIMARY KEY CHECK (ReaderID like '[A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9]'),
Name nvarchar(100) NOT NULL,
Address nvarchar(200),
Date_of_birth date NOT NULL check (Date_of_birth < getDate()),
Email char(100),
Gender bit NOT NULL check (Gender like 0 or Gender like 1),
Password char(50) NOT NULL
)
------------------INSERT------------------------------------------
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151332',N'Nguyễn Minh Vương',N'Hưng Yên','20010704','vuongnmHE151332@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151333',N'Nguyễn Đức Anh',N'Phú Thọ','20010805','anhndHE151333@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151334',N'Vũ Tiến Đạt',N'Nam Định','20011214','dattvHE151334@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151335',N'Nguyễn Duy Đạt',N'Hà Nội','20010101','datndHE151335@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151336',N'Lê Hữu Phúc',N'Hà Nội','20010302','HE151336@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151337',N'Ngô Quốc Tuấn',N'Hà Nội','20010504','tuannqHE151336@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151338',N'Phạm Xuân Hoài Nam',N'Hà Nội','20010406','nampxhHE151338@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151340',N'Nguyễn Lê Huy',N'Hà Nội','20010605','HE151340@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151341',N'Nguyễn Khắc Sơn',N'Hà Nội','20010511','HE151341@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151342',N'Đào Vũ Minh Khánh',N'Hà Nội','20010412','HE151342@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151343',N'Đinh Xuân Hoàng',N'Hà Nội','20010725','HE151343@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151344',N'Vũ Xuân Tùng',N'Hà Nội','20010714','HE151344@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151345',N'Nguyễn Thành Đạt',N'Hà Nội','20010825','HE151345@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151346',N'Trịnh Duy Tuấn Anh',N'Hà Nội','20010914','HE151346@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151347',N'Hà Trung Hiếu',N'Hà Nội','20011212','HE151347@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151348',N'Nguyễn Đình Thắng',N'Hà Nội','20011021','HE151348@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151349',N'Nguyễn Quốc Anh',N'Hà Nội','20011126','HE151349@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151350',N'Nguyễn Xuân Công',N'Hà Nội','20011212','HE151350@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151351',N'Nguyễn Đức Việt',N'Hà Nội','20010514','HE151351@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151352',N'Đào Đức Hiếu',N'Hà Nội','20010912','HE151352@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151353',N'Nguyễn Thế Anh',N'Hà Nội','20010409','HE151353@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151354',N'Nguyễn Trọng Duy',N'Hà Nội','20010625','HE151354@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151355',N'Hà Duy Bách',N'Hà Nội','20010812','HE151355@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151356',N'Nguyễn Huy Tùng',N'Hà Nội','20010924','HE151356@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151357',N'Lê Việt Tiến',N'Hà Nội','20010815','HE151357@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151358',N'Đào Minh Tuấn',N'Hà Nội','20010514','HE151358@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151359',N'Đặng Việt Anh',N'Hà Nội','20010324','HE151359@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151360',N'Nguyễn Tiến Cường',N'Hà Nội','20010102','HE151360@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151361',N'Nguyễn Sỹ Đồng',N'Hà Nội','20011025','HE151361@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151362',N'Nguyễn Vĩnh An',N'Hà Nội','20010418','HE151362@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151363',N'Nguyễn Duy Hiếu',N'Hà Nội','20011114','HE151363@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151364',N'Đoàn Hải Phong',N'Hà Nội','20011214','HE151364@fpt.edu.vn',1,'123456789')
insert into Readers(ReaderID,Name,Address,Date_of_birth,Email,Gender,Password) values ('HE151365',N'Nguyễn Tuấn Anh',N'Hà Nội','20010519','HE151365@fpt.edu.vn',1,'123456789')
------------------DONE------------------------------------------

-- create table Borrow
create table Borrow(
BorrowID char(50) NOT NULL PRIMARY KEY,
StaffID char(50) NOT NULL,
ReaderID char(50) NOT NULL,
Date_start date NOT NULL,
constraint fk_Borrow_Readers FOREIGN KEY(ReaderID) references Readers(ReaderID),
constraint fk_Borrow_Staffs FOREIGN KEY(StaffID) references Staffs(StaffID)
)
------------------INSERT------------------------------------------
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('1','FU143548','HE151332','20211024')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('2','FU133558','HE151333','20211015')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('3','FU143685','HE151334','20211014')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('4','FU111254','HE151335','20211013')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('5','FU133654','HE151336','20211012')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('6','FU142708','HE151337','20211011')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('7','FU133578','HE151338','20211010')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('8','FU153204','HE151340','20211009')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('9','FU130487','HE151341','20211008')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('10','FU140396','HE151342','20211007')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('11','FU143548','HE151343','20211006')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('12','FU133558','HE151344','20211005')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('13','FU143685','HE151345','20211004')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('14','FU111254','HE151346','20211003')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('15','FU133654','HE151347','20211002')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('16','FU142708','HE151348','20211001')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('17','FU133578','HE151349','20210930')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('18','FU153204','HE151350','20210929')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('19','FU130487','HE151351','20210928')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('20','FU140396','HE151352','20210927')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('21','FU143548','HE151353','20210926')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('22','FU133558','HE151354','20210925')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('23','FU143685','HE151355','20210924')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('24','FU111254','HE151356','20210923')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('25','FU133654','HE151357','20210922')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('26','FU142708','HE151358','20210921')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('27','FU133578','HE151359','20210920')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('28','FU153204','HE151360','20210919')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('29','FU130487','HE151361','20210918')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('30','FU140396','HE151362','20210917')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('31','FU143548','HE151363','20210916')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('32','FU133558','HE151364','20210915')
insert into Borrow(BorrowID,StaffID,ReaderID,Date_start) values ('33','FU143685','HE151365','20210914')
------------------DONE------------------------------------------


-- create table BorrowBooks_details
create table BorrowBooks_details(
BorrowID char(50) NOT NULL,
BookID char(50) NOT NULL,
Quantity int NOT NULL,
Date_end date NOT NULL,
constraint fk_BorrowBooks_details_Borrow FOREIGN KEY(BorrowID) references Borrow(BorrowID),
constraint fk_BorrowBooks_details_Books FOREIGN KEY(BookID) references Books(BookID),
primary key(BorrowID,BookID)
)
------------------INSERT------------------------------------------
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('1','QPLDS',6,'20211124')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('1','PLSJD',1,'20211124')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('1','AKDPS',1,'20211124')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('2','054JD',2,'20211115')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('2','QPLDS',3,'20211115')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('3','94JDX',1,'20211114')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('3','ALSKO',2,'20211114')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('3','IQK4A',1,'20211114')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('4','WUEJF',1,'20211113')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('4','WUEJF',2,'20211113')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('4','AKDPS',3,'20211113')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('4','KODJK',4,'20211113')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('5','S4942',2,'20211112')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('6','PLSJD',5,'20211111')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('7','LPSOR',6,'20211110')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('8','IQK4A',4,'20211109')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('9','QPLDS',2,'20211108')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('10','842HD',1,'20211107')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('10','SUA8D',2,'20211107')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('11','PWOD2',3,'20211106')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('12','LPO2D',6,'20211105')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('12','LPO2D',5,'20211105')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('12','OWIED',4,'20211105')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('12','OWIED',1,'20211105')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('13','3EJ3S',1,'20211104')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('13','9RUDH',2,'20211104')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('13','AKDPS',1,'20211104')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('14','HFJ3D',1,'20211103')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('14','94JFH',2,'20211103')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('14','KODJK',3,'20211103')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('15','94JDX',1,'20211102')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('15','8SF1G',4,'20211102')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('15','S4942',5,'20211102')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('16','HFJ3D',2,'20211101')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('17','LPSOR',1,'20211030')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('18','94JDX',1,'20211029')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('19','0EUWJ',4,'20211028')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('20','9RUFH',2,'20211027')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('21','AKDPS',5,'20211026')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('22','8SF1G',2,'20211025')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('22','WUEJF',1,'20211025')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('23','HFJ3D',2,'20211024')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('24','WUEJF',1,'20211023')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('25','QUE04',2,'20211022')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('26','POR0I',3,'20211021')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('27','SLKN3',2,'20211020')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('28','HFJ3D',1,'20211019')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('28','9RUFH',2,'20211019')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('29','8G0SO',1,'20211018')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('30','83HDY',2,'20211017')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('31','LPSOR',2,'20211016')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('32','KODJK',3,'20211015')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('33','0EUWJ',2,'20211014')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('33','KODJK',1,'20211014')
insert into BorrowBooks_details(BorrowID, BookID,Quantity,Date_end) values ('33','ASH32',4,'20211014')
----------DONE----------------------

-- create table Compensation
create table Compensation(
BorrowID char(50) NOT NULL,
Reason nvarchar(200) NOT NULL,
constraint fk_PHAT_MUONSACH FOREIGN KEY(BorrowID) references Borrow(BorrowID))
----------DONE----------------------

-- create table Books_return
create table Books_return(
BorrowID char(50) NOT NULL,
Date_return date NOT NULL,
constraint fk_Books_return_Borrow FOREIGN KEY(BorrowID) references Borrow(BorrowID)
)
----------------INSERT------------------------------
insert into Books_return(BorrowID,Date_return) values ('1','20211124')
insert into Books_return(BorrowID,Date_return) values ('2','20211113')
insert into Books_return(BorrowID,Date_return) values ('3','20211122')
insert into Books_return(BorrowID,Date_return) values ('4','20211105')
insert into Books_return(BorrowID,Date_return) values ('5','20211111')
insert into Books_return(BorrowID,Date_return) values ('6','20211121')
insert into Books_return(BorrowID,Date_return) values ('7','20211122')
insert into Books_return(BorrowID,Date_return) values ('8','20211123')
insert into Books_return(BorrowID,Date_return) values ('9','20211107')
insert into Books_return(BorrowID,Date_return) values ('10','20211106')
insert into Books_return(BorrowID,Date_return) values ('11','20211105')
insert into Books_return(BorrowID,Date_return) values ('12','20211025')
insert into Books_return(BorrowID,Date_return) values ('13','20211103')
insert into Books_return(BorrowID,Date_return) values ('14','20211023')
insert into Books_return(BorrowID,Date_return) values ('15','20211026')
insert into Books_return(BorrowID,Date_return) values ('16','20211101')
insert into Books_return(BorrowID,Date_return) values ('17','20211030')
insert into Books_return(BorrowID,Date_return) values ('18','20211029')
insert into Books_return(BorrowID,Date_return) values ('19','20211028')
insert into Books_return(BorrowID,Date_return) values ('20','20211027')
insert into Books_return(BorrowID,Date_return) values ('21','20211026')
insert into Books_return(BorrowID,Date_return) values ('22','20211025')
insert into Books_return(BorrowID,Date_return) values ('23','20211024')
insert into Books_return(BorrowID,Date_return) values ('24','20211023')
insert into Books_return(BorrowID,Date_return) values ('25','20211022')
insert into Books_return(BorrowID,Date_return) values ('26','20211021')
insert into Books_return(BorrowID,Date_return) values ('27','20211020')
insert into Books_return(BorrowID,Date_return) values ('28','20211019')
insert into Books_return(BorrowID,Date_return) values ('29','20211018')
insert into Books_return(BorrowID,Date_return) values ('30','20211017')
insert into Books_return(BorrowID,Date_return) values ('31','20211016')
insert into Books_return(BorrowID,Date_return) values ('32','20211015')
insert into Books_return(BorrowID,Date_return) values ('33','20211014')
----------DONE----------------------




/* COMMAND */
--------select all staff order by name------------------------
select * from Staffs s
order by s.Name
----------DONE----------------------

---------select book publish in 2018 and its website--------------------
SELECT * FROM Books b
inner join Publisher p
ON b.PublisherID = p.PublisherID
WHERE b.Year = 2018
----------DONE----------------------

-----------count the number of book has publisher name is Kim Đồng----------------
SELECT COUNT(B.BookID) FROM Books B, Publisher P
WHERE B.PublisherID = P.PublisherID
AND P.Name = N'Kim Đồng'
----------DONE----------------------

-----------select top 5 with the most number of books--------------------
SELECT TOP(5) * FROM Books
ORDER BY Quantity DESC
----------DONE----------------------

------------MATCHING IN THE WHERE CLAUSE------------------
SELECT *
FROM Books
WHERE Title like N'%Trí Tuệ%' and Quantity > 10
----------DONE----------------------

--------------count staffs manage more than 3 bills-------------------
SELECT S.StaffID, S.Name, COUNT(B.BorrowID) AS TOTALMANAGE FROM Staffs S, Borrow B
WHERE S.StaffID = B.StaffID
GROUP BY S.StaffID, S.Name
HAVING COUNT(B.BorrowID) > 3
----------DONE----------------------

----------find the most book borrowed by reader and get in into having clause---------------
SELECT b.BookID,
       b.Title,
       count(br.ReaderID) AS TotalBorrows
FROM Books b,
     BorrowBooks_details bd,
     Borrow br,
     Readers r
WHERE b.BookID = bd.BookID
  AND bd.BorrowID = br.BorrowID
  AND br.ReaderID = r.ReaderID
GROUP BY b.BookID,
         b.Title
HAVING count(br.BorrowID) =
  (SELECT top(1) count(br.ReaderID) AS TotalBorrows
   FROM Books b,
        BorrowBooks_details bd,
        Borrow br,
        Readers r
   WHERE b.BookID = bd.BookID
     AND bd.BorrowID = br.BorrowID
     AND r.ReaderID = br.ReaderID
   GROUP BY b.BookID,
            b.Title
   ORDER BY count(br.BorrowID) DESC)
----------DONE----------------------

----------find the reader borrowed most book and get it into having clause---------------
   SELECT r.ReaderID,
       r.Name,
       sum(bd.Quantity) AS NumberOfBorrowedBooks
FROM Readers r,
     Borrow b,
     BorrowBooks_details bd
WHERE r.ReaderID = b.ReaderID
  AND b.BorrowID = bd.BorrowID
GROUP BY r.ReaderID,
         r.Name
HAVING sum(bd.Quantity) =
  (SELECT top(1) sum(bd.Quantity) AS NumberOfBorrowedBooks
   FROM Readers r,
        Borrow b,
        BorrowBooks_details bd
   WHERE r.ReaderID = b.ReaderID
     AND b.BorrowID = bd.BorrowID
   GROUP BY r.ReaderID,
            r.Name,
            bd.BorrowID
   ORDER BY sum(bd.Quantity) DESC)
----------DONE----------------------

----------to check the quantity of books for which the book's ID is entered by the librarian or user.---------------
CREATE PROC check_Quantity @Book_ID CHAR(10), @NumberofBooks INT OUTPUT
AS
BEGIN
	SET @NumberofBooks = (SELECT Quantity
	FROM Books WHERE BookID = @Book_ID)
END

--
DECLARE @t INT
EXEC check_Quantity'054JD', @t OUTPUT 
SELECT @t AS Quantity
----------DONE----------------------

-----------------Add overdue loan slip to the table compensation------------------------
CREATE TRIGGER checkCompensation 
ON Books_return AFTER INSERT
AS
BEGIN
	DECLARE @borrowID CHAR(50);
	DECLARE @date_end INT
	SELECT @borrowID = i.BorrowID, @date_end = DATEDIFF(day,bd.Date_end,i.Date_return) FROM inserted i, 
	(SELECT DISTINCT bd.BorrowID, bd.Date_end FROM BorrowBooks_details bd) AS bd
	WHERE bd.BorrowID = i.BorrowID
	IF(@date_end >0)
	BEGIN
		INSERT INTO Compensation(BorrowID,Reason) VALUES
		(@borrowID, N'Bị nộp muộn ' + CONVERT(NVARCHAR(200),@date_end) + N' ngày')
	END
end
----------DONE----------------------

-----------Check to see if the quantity of books is enough for the borrower--------------------
CREATE TRIGGER checkRemainQuanity
ON BorrowBooks_details AFTER INSERT
AS
BEGIN
	DECLARE @quantity INT;
	SELECT @quantity = (SELECT b.Quantity - (SELECT sum(b.Quantity) FROM inserted i, BorrowBooks_details b
	WHERE i.BookID = b.BookID)
	FROM Books b, inserted i WHERE b.BookID = i.BookID)
	IF(@quantity<0)
	BEGIN
		PRINT 'Not enough quantity'
		DELETE FROM BorrowBooks_details
		where Quantity = (SELECT i.Quantity FROM inserted i) and 
		BorrowID = (SELECT i.BorrowID FROM inserted i)
		and BookID = (SELECT i.BookID FROM inserted i)
	END
END
----------DONE----------------------