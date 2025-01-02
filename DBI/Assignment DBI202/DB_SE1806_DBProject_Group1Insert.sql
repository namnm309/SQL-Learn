CREATE database DB_SE1809_DBProject_Group1

use DB_SE1809_DBProject_Group1


-- Tạo bảng KhuVuc
CREATE TABLE KhuVuc (
    MaKV INT PRIMARY KEY, 
    TenKV NVARCHAR(255),
    MoTaKV NVARCHAR(255)
)



-- Tạo bảng TacGia
CREATE TABLE TacGia (
    MaTG INT PRIMARY KEY,
    TenTG NVARCHAR(255),
    Email NVARCHAR(255),
    SoDienThoai NVARCHAR(20),
    NgaySinh DATE,
    DiaChi NVARCHAR(255),
    MaKV INT,        
    FOREIGN KEY (MaKV) REFERENCES KhuVuc(MaKV)
)


--Tạo bảng Danh Mục
CREATE TABLE DanhMuc (
    MaDM INT PRIMARY KEY, 
    TenDM NVARCHAR(255),
    MaDMcha INT,     
    FOREIGN KEY (MaDMcha) REFERENCES DanhMuc(MaDM)
)



-- Tạo bảng BaiViet
CREATE TABLE BaiViet (
    MaTT INT PRIMARY KEY,
    TieuDe NVARCHAR(255),
    NoiDung TEXT,
    ThoiGianDang DATETIME,
    LuotXem INT,
    BinhLuan INT,
    MaTG INT,            
    MaDM INT,             
    MaKV INT,              
    FOREIGN KEY (MaTG) REFERENCES TacGia(MaTG),
    FOREIGN KEY (MaDM) REFERENCES DanhMuc(MaDM),
    FOREIGN KEY (MaKV) REFERENCES KhuVuc(MaKV)
)



-- Tạo bảng NguoiDung
CREATE TABLE NguoiDung (
    UserID INT PRIMARY KEY,
    Username NVARCHAR(255),
    MatKhau NVARCHAR(255),
    Email NVARCHAR(255),
    HoTen NVARCHAR(255),
    NgaySinh DATE,
    DiaChi NVARCHAR(255),
    SoDienThoai NVARCHAR(20)
)



-- Tạo bảng BinhLuan
CREATE TABLE BinhLuan (
    MaBL INT PRIMARY KEY,   
    MaTT INT,              
    UserID INT,            
    NoiDungBL TEXT,
    NgayBL DATETIME,
    FOREIGN KEY (MaTT) REFERENCES BaiViet(MaTT),
    FOREIGN KEY (UserID) REFERENCES NguoiDung(UserID)
)



-- Tạo bảng QuangCao
CREATE TABLE QuangCao (
    MaQC INT PRIMARY KEY,  
    TieuDeQC NVARCHAR(255),
    NoiDungQC TEXT,
    HinhAnhQC NVARCHAR(255),
    ThoiGianBatDau DATETIME,
    ThoiGianKetThuc DATETIME,
    MaKV INT,                
    FOREIGN KEY (MaKV) REFERENCES KhuVuc(MaKV)
)



-- Tạo bảng LienHe
CREATE TABLE LienHe (
    MaLH INT PRIMARY KEY,  
    TenNguoiLH NVARCHAR(255),
    EmailLH NVARCHAR(255),
    SoDienThoaiLH NVARCHAR(20),
    NoiDungLH TEXT,
    NgayLH DATETIME
)



-- Tạo bảng RaoVat
CREATE TABLE RaoVat (
    MaRV INT PRIMARY KEY, 
    TieuDeRV NVARCHAR(255),
    ThoiGianDangRV DATETIME,
    LienHeRV NVARCHAR(255),
    GiaTienRV DECIMAL(18, 2),
    MaKV INT,             
    FOREIGN KEY (MaKV) REFERENCES KhuVuc(MaKV)
)


-- Tạo bảng Startup
CREATE TABLE Startup (
    MaStartup INT PRIMARY KEY,
    TenStartup NVARCHAR(255),
    MoTaStartup TEXT,
    NgayThanhLap DATE,
    LienHeStartup NVARCHAR(255),
    MaKV INT,                
    FOREIGN KEY (MaKV) REFERENCES KhuVuc(MaKV)
)


--Tạo bảng HopDong
CREATE TABLE HopDong (
    MaHD INT PRIMARY KEY,  
    NgayKy DATE,
    ChiTietHopDong TEXT,
    NgayHetHan DATE,
    MaLH INT,               
    MaQC INT,                
    MaRV INT,               
    FOREIGN KEY (MaLH) REFERENCES LienHe(MaLH),
    FOREIGN KEY (MaQC) REFERENCES QuangCao(MaQC),
    FOREIGN KEY (MaRV) REFERENCES RaoVat(MaRV)
)

-- Tạo bảng QuanLyBaiViet
CREATE TABLE QuanLyBaiViet (
    UserID INT,            
    MaTT INT,               
    PRIMARY KEY (UserID, MaTT),
    FOREIGN KEY (UserID) REFERENCES NguoiDung(UserID),
    FOREIGN KEY (MaTT) REFERENCES BaiViet(MaTT)
)

-- Thêm mới bản ghi vào bảng QuanLyBaiViet
CREATE PROCEDURE ThemQuanLyBaiViet
    @MaTT INT,
    @MaND INT,
    @NgayCapNhat DATE,
    @TrangThai NVARCHAR(250),
    @GhiChu NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO QuanLyBaiViet (MaTT, MaND, NgayCapNhat, TrangThai, GhiChu)
    VALUES (@MaTT, @MaND, @NgayCapNhat, @TrangThai, @GhiChu)
END
-- Sửa thông tin trong bảng QuanLyBaiViet
CREATE PROCEDURE SuaQuanLyBaiViet
    @MaQLBV INT,
    @MaTT INT,
    @MaND INT,
    @NgayCapNhat DATE,
    @TrangThai NVARCHAR(250),
    @GhiChu NVARCHAR(MAX)
AS
BEGIN
    UPDATE QuanLyBaiViet
    SET MaTT = @MaTT, MaND = @MaND, NgayCapNhat = @NgayCapNhat, TrangThai = @TrangThai, GhiChu = @GhiChu
    WHERE MaQLBV = @MaQLBV;
END
-- Xóa bản ghi trong bảng QuanLyBaiViet
CREATE PROCEDURE XoaQuanLyBaiViet
    @MaQLBV INT
AS
BEGIN
    DELETE FROM QuanLyBaiViet WHERE MaQLBV = @MaQLBV;
END

-- Thêm mới hợp đồng
CREATE PROCEDURE ThemHopDong
    @NgayKy DATE,
    @NgayHetHan DATE,
    @ChiTietHopDong NVARCHAR(MAX),
    @MaKV INT,
    @MaQC INT
AS
BEGIN
    INSERT INTO HopDong (NgayKy, NgayHetHan, ChiTietHopDong, MaKV, MaQC)
    VALUES (@NgayKy, @NgayHetHan, @ChiTietHopDong, @MaKV, @MaQC)
END
-- Xóa hợp đồng
CREATE PROCEDURE XoaHopDong
    @MaHD INT
AS
BEGIN
    DELETE FROM HopDong WHERE MaHD = @MaHD
END
-- Thêm mới bài viết
CREATE PROCEDURE ThemBaiViet
    @TieuDe NVARCHAR(255),
    @NoiDung NVARCHAR(MAX),
    @ThoiGianDang DATETIME,
    @MaTG INT,
    @MaCM INT,
    @LuotXem INT,
    @BinhLuan INT,
    @MaKV INT
AS
BEGIN
    INSERT INTO BaiViet (TieuDe, NoiDung, ThoiGianDang, MaTG, MaCM, LuotXem, BinhLuan, MaKV)
    VALUES (@TieuDe, @NoiDung, @ThoiGianDang, @MaTG, @MaCM, @LuotXem, @BinhLuan, @MaKV)
END


-- Sửa bài viết
CREATE PROCEDURE SuaBaiViet
    @MaTT INT,
    @TieuDe NVARCHAR(255),
    @NoiDung NVARCHAR(MAX),
    @ThoiGianDang DATETIME,
    @MaTG INT,
    @MaCM INT,
    @LuotXem INT,
    @BinhLuan INT,
    @MaKV INT
AS
BEGIN
    UPDATE BaiViet
    SET TieuDe = @TieuDe, NoiDung = @NoiDung, ThoiGianDang = @ThoiGianDang, MaTG = @MaTG, MaCM = @MaCM, LuotXem = @LuotXem, BinhLuan = @BinhLuan, MaKV = @MaKV
    WHERE MaTT = @MaTT
END


-- Xóa bài viết
CREATE PROCEDURE XoaBaiViet
    @MaTT INT
AS
BEGIN
    DELETE FROM BaiViet WHERE MaTT = @MaTT
END


-- Trigger tự động cập nhật lượt xem bài viết
CREATE TRIGGER CapNhatLuotXem
ON BaiViet
AFTER INSERT
AS
BEGIN
    DECLARE @MaTT INT;
    SELECT @MaTT = INSERTED.MaTT FROM INSERTED;
    UPDATE BaiViet
    SET LuotXem = LuotXem + 1
    WHERE MaTT = @MaTT;
END
-- Tạo bảng QuanLyBinhLuan
CREATE TABLE QuanLyBinhLuan (
    UserID INT,            
    MaBL INT,              
    PRIMARY KEY (UserID, MaBL),
    FOREIGN KEY (UserID) REFERENCES NguoiDung(UserID),
    FOREIGN KEY (MaBL) REFERENCES BinhLuan(MaBL)
)

-- Thêm mới bản ghi vào bảng QuanLyBinhLuan
CREATE PROCEDURE ThemQuanLyBinhLuan
    @UserID INT,
    @MaBL INT,
    @NgayCapNhat DATE,
    @TrangThai NVARCHAR(250),
    @GhiChu NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO QuanLyBinhLuan (UserID, MaBL, NgayCapNhat, TrangThai, GhiChu)
    VALUES (@UserID, @MaBL, @NgayCapNhat, @TrangThai, @GhiChu);
END
-- Sửa thông tin trong bảng QuanLyBinhLuan
CREATE PROCEDURE SuaQuanLyBinhLuan
    @MaQLBL INT,
    @UserID INT,
    @MaBL INT,
    @NgayCapNhat DATE,
    @TrangThai NVARCHAR(250),
    @GhiChu NVARCHAR(MAX)
AS
BEGIN
    UPDATE QuanLyBinhLuan
    SET UserID = @UserID, MaBL = @MaBL, NgayCapNhat = @NgayCapNhat, TrangThai = @TrangThai, GhiChu = @GhiChu
    WHERE MaQLBL = @MaQLBL;
END
-- Xóa bản ghi trong bảng QuanLyBinhLuan
CREATE PROCEDURE XoaQuanLyBinhLuan
    @MaQLBL INT
AS
BEGIN
    DELETE FROM QuanLyBinhLuan WHERE MaQLBL = @MaQLBL;
END
-- Nhập dữ liệu mẫu cho bảng QuanLyBinhLuan
INSERT INTO QuanLyBinhLuan (MaQLBL, UserID, MaBL, NgayCapNhat, TrangThai, GhiChu) VALUES
(1, 1, 1, '2024-06-22', N'Đã duyệt', N'Bình luận đã được chấp nhận'),
(2, 2, 2, '2024-06-23', N'Chờ duyệt', N'Bình luận đang chờ xét duyệt'),
(3, 3, 3, '2024-06-24', N'Bị từ chối', N'Bình luận bị từ chối vì nội dung không phù hợp'),
(4, 4, 4, '2024-06-25', N'Đã duyệt', N'Bình luận đã được duyệt')


-- Nhập dữ liệu mẫu cho bảng QuanLyBaiViet
INSERT INTO QuanLyBaiViet (MaQLBV, MaTT, MaND, NgayCapNhat, TrangThai, GhiChu) VALUES
(1, 1, 1, '2024-06-22', N'Đã đăng', N'Bài viết đã hoàn tất'),
(2, 2, 2, '2024-06-23', N'Chờ duyệt', N'Đang trong quá trình duyệt'),
(3, 3, 3, '2024-06-24', N'Bị từ chối', N'Bài viết bị từ chối vì vi phạm nội dung'),
(4, 4, 4, '2024-06-25', N'Đã đăng', N'Bài viết đã hoàn tất');

--Nhập dữ liệu mẫu cho HopDong
INSERT INTO HopDong (MaHD, NgayKy, NgayHetHan, ChiTietHopDong, MaKV, MaQC) VALUES
(1, '2024-01-01', '2025-01-01', N'Hợp đồng quảng cáo Khu Vực 1 cho Quảng Cáo 1', 1, 1),
(2, '2024-02-01', '2025-02-01', N'Hợp đồng quảng cáo Khu Vực 2 cho Quảng Cáo 2', 2, 2),
(3, '2024-03-01', '2025-03-01', N'Hợp đồng quảng cáo Khu Vực 3 cho Quảng Cáo 3', 3, 3)

-- Nhập dữ liệu mẫu cho Author
INSERT INTO TacGia(MaTG, TenTG, Email, SoDienThoai, NgaySinh, DiaChi) VALUES
(1, N'Nguyễn Văn Sinh', 'nguyenvancao@gmail.com', '0123456789', '1980-01-01', N'Hà Nội'),
(2, N'Trần Thị Bản', 'tranthiban@outlook.com', '0987654321', '1985-02-02', N'Hồ Chí Minh'),
(3, N'Lê Văn Cao', 'levanccao@yahoo.com', '0912345678', '1990-03-03', N'Đà Nẵng'),
(4, N'Phạm Thị Diễm Nhu', 'phamthidiemnhu@icloud.com', '0945678912', '1982-04-04', N'Cần Thơ')

-- Nhập dữ liệu mẫu cho Category
INSERT INTO DanhMuc (MaCM, TenCM, MoTa) VALUES
(1, N'Thể thao', N'Các bài viết về thể thao'),
(2, N'Giải trí', N'Các bài viết về giải trí'),
(3, N'Kinh tế', N'Các bài viết về kinh tế và tài chính'),
(4, N'Chính trị', N'Các bài viết về chính trị trong và ngoài nước'),
(5, N'Khoa học', N'Các bài viết về khoa học và công nghệ'),
(6, N'Giáo dục', N'Các bài viết về giáo dục và đào tạo'),
(7, N'Sức khỏe', N'Các bài viết về y tế và sức khỏe'),
(8, N'Văn hóa', N'Các bài viết về văn hóa và xã hội'),
(9, N'Du lịch', N'Các bài viết về du lịch và khám phá'),
(10, N'Pháp luật', N'Các bài viết về pháp luật và quy định'),
(11, N'Ẩm thực', N'Các bài viết về ẩm thực và nấu ăn'),
(12, N'Môi trường', N'Các bài viết về môi trường và bảo vệ thiên nhiên'),
(13, N'Công nghệ', N'Các bài viết về công nghệ thông tin và viễn thông'),
(14, N'Nông nghiệp', N'Các bài viết về nông nghiệp và phát triển nông thôn')


-- Nhập dữ liệu mẫu cho Article
INSERT INTO BaiViet (MaTT, TieuDe, NoiDung, ThoiGianDang, MaTG, MaCM, LuotXem, BinhLuan) VALUES
(1, N'Bài viết thể thao 1', N'Nội dung bài viết thể thao 1', '2024-06-22', 1, 1, 100, 5),
(2, N'Bài viết giải trí 1', N'Nội dung bài viết giải trí 1', '2024-06-22', 2, 2, 200, 10),
(3, N'Bài viết kinh tế 1', N'Nội dung bài viết kinh tế 1', '2024-06-23', 3, 3, 150, 8),
(4, N'Bài viết chính trị 1', N'Nội dung bài viết chính trị 1', '2024-06-23', 4, 4, 180, 12),
(5, N'Bài viết khoa học 1', N'Nội dung bài viết khoa học 1', '2024-06-24', 1, 5, 220, 7),
(6, N'Bài viết giáo dục 1', N'Nội dung bài viết giáo dục 1', '2024-06-24', 2, 6, 190, 9),
(7, N'Bài viết sức khỏe 1', N'Nội dung bài viết sức khỏe 1', '2024-06-25', 3, 7, 210, 15),
(8, N'Bài viết văn hóa 1', N'Nội dung bài viết văn hóa 1', '2024-06-25', 4, 8, 230, 20),
(9, N'Bài viết du lịch 1', N'Nội dung bài viết du lịch 1', '2024-06-26', 1, 9, 170, 6),
(10, N'Bài viết pháp luật 1', N'Nội dung bài viết pháp luật 1', '2024-06-26', 2, 10, 250, 14),
(11, N'Bài viết ẩm thực 1', N'Nội dung bài viết ẩm thực 1', '2024-06-27', 3, 11, 300, 18),
(12, N'Bài viết môi trường 1', N'Nội dung bài viết môi trường 1', '2024-06-27', 4, 12, 130, 11),
(13, N'Bài viết công nghệ 1', N'Nội dung bài viết công nghệ 1', '2024-06-28', 1, 13, 200, 13),
(14, N'Bài viết nông nghiệp 1', N'Nội dung bài viết nông nghiệp 1', '2024-06-28', 2, 14, 240, 16),
(15, N'Bài viết thể thao 2', N'Nội dung bài viết thể thao 2', '2024-06-29', 3, 1, 100, 5),
(16, N'Bài viết giải trí 2', N'Nội dung bài viết giải trí 2', '2024-06-29', 4, 2, 200, 10),
(17, N'Bài viết kinh tế 2', N'Nội dung bài viết kinh tế 2', '2024-06-30', 1, 3, 150, 8),
(18, N'Bài viết chính trị 2', N'Nội dung bài viết chính trị 2', '2024-06-30', 2, 4, 180, 12),
(19, N'Bài viết khoa học 2', N'Nội dung bài viết khoa học 2', '2024-07-01', 3, 5, 220, 7),
(20, N'Bài viết giáo dục 2', N'Nội dung bài viết giáo dục 2', '2024-07-01', 4, 6, 190, 9),
(21, N'Bài viết sức khỏe 2', N'Nội dung bài viết sức khỏe 2', '2024-07-02', 1, 7, 210, 15),
(22, N'Bài viết văn hóa 2', N'Nội dung bài viết văn hóa 2', '2024-07-02', 2, 8, 230, 20),
(23, N'Bài viết du lịch 2', N'Nội dung bài viết du lịch 2', '2024-07-03', 3, 9, 170, 6),
(24, N'Bài viết pháp luật 2', N'Nội dung bài viết pháp luật 2', '2024-07-03', 4, 10, 250, 14),
(25, N'Bài viết ẩm thực 2', N'Nội dung bài viết ẩm thực 2', '2024-07-04', 1, 11, 300, 18),
(26, N'Bài viết môi trường 2', N'Nội dung bài viết môi trường 2', '2024-07-04', 2, 12, 130, 11),
(27, N'Bài viết công nghệ 2', N'Nội dung bài viết công nghệ 2', '2024-07-05', 3, 13, 200, 13),
(28, N'Bài viết nông nghiệp 2', N'Nội dung bài viết nông nghiệp 2', '2024-07-05', 4, 14, 240, 16),
(29, N'Bài viết thể thao 3', N'Nội dung bài viết thể thao 3', '2024-07-06', 1, 1, 100, 5),
(30, N'Bài viết giải trí 3', N'Nội dung bài viết giải trí 3', '2024-07-06', 2, 2, 200, 10),
(31, N'Bài viết kinh tế 3', N'Nội dung bài viết kinh tế 3', '2024-07-07', 3, 3, 150, 8),
(32, N'Bài viết chính trị 3', N'Nội dung bài viết chính trị 3', '2024-07-07', 4, 4, 180, 12),
(33, N'Bài viết khoa học 3', N'Nội dung bài viết khoa học 3', '2024-07-08', 1, 5, 220, 7),
(34, N'Bài viết giáo dục 3', N'Nội dung bài viết giáo dục 3', '2024-07-08', 2, 6, 190, 9),
(35, N'Bài viết sức khỏe 3', N'Nội dung bài viết sức khỏe 3', '2024-07-09', 3, 7, 210, 15),
(36, N'Bài viết văn hóa 3', N'Nội dung bài viết văn hóa 3', '2024-07-09', 4, 8, 230, 20),
(37, N'Bài viết du lịch 3', N'Nội dung bài viết du lịch 3', '2024-07-10', 1, 9, 170, 6),
(38, N'Bài viết pháp luật 3', N'Nội dung bài viết pháp luật 3', '2024-07-10', 2, 10, 250, 14),
(39, N'Bài viết ẩm thực 3', N'Nội dung bài viết ẩm thực 3', '2024-07-11', 3, 11, 300, 18),
(40, N'Bài viết môi trường 3', N'Nội dung bài viết môi trường 3', '2024-07-11', 4, 12, 130, 11)


-- Nhập dữ liệu mẫu cho Comment
INSERT INTO BinhLuan (MaBL, MaTT, TenNguoiBL, EmailNguoiBL, NoiDungBL, NgayBL) VALUES
(1, 1, N'user1', 'phamvanc@gmail.com', N'Bình luận 1 cho bài viết thể thao 1', '2024-06-22'),
(2, 2, N'user2', 'lethid@outlook.com', N'Bình luận 1 cho bài viết giải trí 1', '2024-06-22'),
(3, 3, N'user3', 'nguyenvane@yahoo.com', N'Bình luận 1 cho bài viết kinh tế 1', '2024-06-23'),
(4, 4, N'user4', 'tranthif@icloud.com', N'Bình luận 1 cho bài viết chính trị 1', '2024-06-23'),
(5, 5, N'user5', 'levang@yandex.com', N'Bình luận 1 cho bài viết khoa học 1', '2024-06-24'),
(6, 6, N'user6', 'phamthih@gmail.com', N'Bình luận 1 cho bài viết giáo dục 1', '2024-06-24'),
(7, 7, N'user7', 'hoangvani@outlook.com', N'Bình luận 1 cho bài viết sức khỏe 1', '2024-06-25'),
(8, 8, N'user8', 'dangthij@yahoo.com', N'Bình luận 1 cho bài viết văn hóa 1', '2024-06-25'),
(9, 9, N'user9', 'truongvank@icloud.com', N'Bình luận 1 cho bài viết du lịch 1', '2024-06-26'),
(10, 10, N'user10', 'ngothil@yandex.com', N'Bình luận 1 cho bài viết pháp luật 1', '2024-06-26'),
(11, 11, N'user1', 'buivanm@gmail.com', N'Bình luận 1 cho bài viết ẩm thực 1', '2024-06-27'),
(12, 12, N'user2', 'dothin@outlook.com', N'Bình luận 1 cho bài viết môi trường 1', '2024-06-27'),
(13, 13, N'user3', 'nguyenvano@yahoo.com', N'Bình luận 1 cho bài viết công nghệ 1', '2024-06-28'),
(14, 14, N'user4', 'lythip@icloud.com', N'Bình luận 1 cho bài viết nông nghiệp 1', '2024-06-28'),
(15, 1, N'user5', 'phamvanq@gmail.com', N'Bình luận 2 cho bài viết thể thao 1', '2024-06-29'),
(16, 2, N'user6', 'lethir@outlook.com', N'Bình luận 2 cho bài viết giải trí 1', '2024-06-29'),
(17, 3, N'user7', 'nguyenvans@yahoo.com', N'Bình luận 2 cho bài viết kinh tế 1', '2024-06-30'),
(18, 4, N'user8', 'tranthit@icloud.com', N'Bình luận 2 cho bài viết chính trị 1', '2024-06-30'),
(19, 5, N'user9', 'levanu@yandex.com', N'Bình luận 2 cho bài viết khoa học 1', '2024-07-01'),
(20, 6, N'user10', 'phamthiv@gmail.com', N'Bình luận 2 cho bài viết giáo dục 1', '2024-07-01'),
(21, 7, N'user1', 'hoangvanw@outlook.com', N'Bình luận 2 cho bài viết sức khỏe 1', '2024-07-02'),
(22, 8, N'user2', 'dangthix@yahoo.com', N'Bình luận 2 cho bài viết văn hóa 1', '2024-07-02'),
(23, 9, N'user3', 'truongvany@icloud.com', N'Bình luận 2 cho bài viết du lịch 1', '2024-07-03'),
(24, 10, N'user4', 'ngothiz@yandex.com', N'Bình luận 2 cho bài viết pháp luật 1', '2024-07-03'),
(25, 11, N'user5', 'buivanaa@gmail.com', N'Bình luận 2 cho bài viết ẩm thực 1', '2024-07-04'),
(26, 12, N'user6', 'dothiab@outlook.com', N'Bình luận 2 cho bài viết môi trường 1', '2024-07-04'),
(27, 13, N'user7', 'nguyenvanac@yahoo.com', N'Bình luận 2 cho bài viết công nghệ 1', '2024-07-05'),
(28, 14, N'user8', 'lythiad@icloud.com', N'Bình luận 2 cho bài viết nông nghiệp 1', '2024-07-05'),
(29, 1, N'user9', 'phamvanae@gmail.com', N'Bình luận 3 cho bài viết thể thao 1', '2024-07-06'),
(30, 2, N'user10', 'lethiaf@outlook.com', N'Bình luận 3 cho bài viết giải trí 1', '2024-07-06'),
(31, 3, N'user1', 'nguyenvanag@yahoo.com', N'Bình luận 3 cho bài viết kinh tế 1', '2024-07-07'),
(32, 4, N'user2', 'tranthiah@icloud.com', N'Bình luận 3 cho bài viết chính trị 1', '2024-07-07'),
(33, 5, N'user3', 'levanai@yandex.com', N'Bình luận 3 cho bài viết khoa học 1', '2024-07-08'),
(34, 6, N'user4', 'phamthiaj@gmail.com', N'Bình luận 3 cho bài viết giáo dục 1', '2024-07-08'),
(35, 7, N'user5', 'hoangvanak@outlook.com', N'Bình luận 3 cho bài viết sức khỏe 1', '2024-07-09'),
(36, 8, N'user6', 'dangthial@yahoo.com', N'Bình luận 3 cho bài viết văn hóa 1', '2024-07-09'),
(37, 9, N'user7', 'truongvanam@icloud.com', N'Bình luận 3 cho bài viết du lịch 1', '2024-07-10'),
(38, 10, N'user8', 'ngothian@yandex.com', N'Bình luận 3 cho bài viết pháp luật 1', '2024-07-10'),
(39, 11, N'user9', 'buivanao@gmail.com', N'Bình luận 3 cho bài viết ẩm thực 1', '2024-07-11'),
(40, 12, N'user10', 'dothiap@outlook.com', N'Bình luận 3 cho bài viết môi trường 1', '2024-07-11'),
(41, 13, N'user1', 'nguyenvanaq@yahoo.com', N'Bình luận 3 cho bài viết công nghệ 1', '2024-07-12'),
(42, 14, N'user2', 'lythiar@icloud.com', N'Bình luận 3 cho bài viết nông nghiệp 1', '2024-07-12'),
(43, 1, N'user3', 'phamvanas@gmail.com', N'Bình luận 4 cho bài viết thể thao 1', '2024-07-13'),
(44, 2, N'user4', 'lethiat@outlook.com', N'Bình luận 4 cho bài viết giải trí 1', '2024-07-13'),
(45, 3, N'user5', 'nguyenvanau@yahoo.com', N'Bình luận 4 cho bài viết kinh tế 1', '2024-07-14'),
(46, 4, N'user6', 'tranthiav@icloud.com', N'Bình luận 4 cho bài viết chính trị 1', '2024-07-14'),
(47, 5, N'user7', 'levanaw@yandex.com', N'Bình luận 4 cho bài viết khoa học 1', '2024-07-15'),
(48, 6, N'user8', 'phamthiax@gmail.com', N'Bình luận 4 cho bài viết giáo dục 1', '2024-07-15'),
(49, 7, N'user9', 'hoangvanay@outlook.com', N'Bình luận 4 cho bài viết sức khỏe 1', '2024-07-16'),
(50, 8, N'user10', 'dangthiaz@yahoo.com', N'Bình luận 4 cho bài viết văn hóa 1', '2024-07-16'),
(51, 9, N'user1', 'truongvanba@icloud.com', N'Bình luận 4 cho bài viết du lịch 1', '2024-07-17'),
(52, 10, N'user2', 'ngothibb@yandex.com', N'Bình luận 4 cho bài viết pháp luật 1', '2024-07-17'),
(53, 11, N'user3', 'buivanbc@gmail.com', N'Bình luận 4 cho bài viết ẩm thực 1', '2024-07-18'),
(54, 12, N'user4', 'dothibd@outlook.com', N'Bình luận 4 cho bài viết môi trường 1', '2024-07-18'),
(55, 13, N'user5', 'nguyenvanbe@yahoo.com', N'Bình luận 4 cho bài viết công nghệ 1', '2024-07-19'),
(56, 14, N'user6', 'lythibf@icloud.com', N'Bình luận 4 cho bài viết nông nghiệp 1', '2024-07-19'),
(57, 1, N'user7', 'phamvanbg@gmail.com', N'Bình luận 5 cho bài viết thể thao 1', '2024-07-20'),
(58, 2, N'user8', 'lethibh@outlook.com', N'Bình luận 5 cho bài viết giải trí 1', '2024-07-20'),
(59, 3, N'user9', 'nguyenvanbi@yahoo.com', N'Bình luận 5 cho bài viết kinh tế 1', '2024-07-21'),
(60, 4, N'user10', 'tranthibj@icloud.com', N'Bình luận 5 cho bài viết chính trị 1', '2024-07-21')


-- Nhập dữ liệu mẫu cho User
INSERT INTO NguoiDung (UserID, Username, MatKhau, Email, MaTT, HoTen, NgaySinh, DiaChi, SoDienThoai) VALUES
(1, 'user1', 'password1', 'user1@example.com', 1, N'Nguyễn Văn A', '1980-01-01', N'Hà Nội', N'0123456789'),
(2, 'user2', 'password2', 'user2@example.com', 2, N'Trần Thị B', '1985-02-02', N'Hồ Chí Minh', N'0987654321'),
(3, 'user3', 'password3', 'user3@example.com', 3, N'Lê Văn C', '1990-03-03', N'Đà Nẵng', N'0912345678'),
(4, 'user4', 'password4', 'user4@example.com', 4, N'Phạm Thị D', '1982-04-04', N'Cần Thơ', N'0945678912'),
(5, 'user5', 'password5', 'user5@example.com', 5, N'Hoàng Văn E', '1975-05-05', N'Hải Phòng', N'0971234567'),
(6, 'user6', 'password6', 'user6@example.com', 6, N'Đặng Thị F', '1988-06-06', N'Nha Trang', N'0909876543'),
(7, 'user7', 'password7', 'user7@example.com', 7, N'Trương Văn G', '1983-07-07', N'Vũng Tàu', N'0923456789'),
(8, 'user8', 'password8', 'user8@example.com', 8, N'Ngô Thị H', '1992-08-08', N'Quảng Ninh', N'0935678912'),
(9, 'user9', 'password9', 'user9@example.com', 9, N'Bùi Văn I', '1978-09-09', N'Huế', N'0967891234'),
(10, 'user10', 'password10', 'user10@example.com', 10, N'Đỗ Thị J', '1986-10-10', N'Bình Dương', N'0989123456')


--Nhập dữ liệu mẫu cho Areas
INSERT INTO KhuVuc (MaKV, TenKV) VALUES (1, N'Khu vực 1')
INSERT INTO KhuVuc (MaKV, TenKV) VALUES (2, N'Khu vực 2')



--Nhập dữ liệu mẫu cho QuangCao
INSERT INTO QuangCao (MaQC, TieuDeQC, NoiDungQC, HinhAnhQC, ThoiGianBatDau, ThoiGianKetThuc, MaKV) VALUES
(1, N'Quảng cáo 1', N'Nội dung quảng cáo 1', N'quangcao1.jpg', '2024-01-01', '2024-06-30', 1),
(2, N'Quảng cáo 2', N'Nội dung quảng cáo 2', N'quangcao2.jpg', '2024-02-01', '2024-07-30', 2),
(3, N'Quảng cáo 3', N'Nội dung quảng cáo 3', N'quangcao3.jpg', '2024-03-01', '2024-08-30', 1),
(4, N'Quảng cáo 4', N'Nội dung quảng cáo 4', N'quangcao4.jpg', '2024-04-01', '2024-09-30', 2),
(5, N'Quảng cáo 5', N'Nội dung quảng cáo 5', N'quangcao5.jpg', '2024-05-01', '2024-10-30', 1),
(6, N'Quảng cáo 6', N'Nội dung quảng cáo 6', N'quangcao6.jpg', '2024-06-01', '2024-11-30', 2),
(7, N'Quảng cáo 7', N'Nội dung quảng cáo 7', N'quangcao7.jpg', '2024-07-01', '2024-12-30', 1),
(8, N'Quảng cáo 8', N'Nội dung quảng cáo 8', N'quangcao8.jpg', '2024-08-01', '2025-01-30', 2),
(9, N'Quảng cáo 9', N'Nội dung quảng cáo 9', N'quangcao9.jpg', '2024-09-01', '2025-02-28', 1),
(10, N'Quảng cáo 10', N'Nội dung quảng cáo 10', N'quangcao10.jpg', '2024-10-01', '2025-03-30', 2)

SELECT * FROM QuangCao

-- Nhập dữ liệu mẫu cho LienHe
INSERT INTO LienHe (MaLH, TenNguoiLH, EmailLH, SoDienThoaiLH, NoiDungLH, NgayLH) VALUES
(1, N'Nguyễn Văn A', 'nguyenvana@gmail.com', '0123456789', N'Nội dung liên hệ 1', '2024-03-01'),
(2, N'Trần Thị B', 'tranthib@gmail.com', '0987654321', N'Nội dung liên hệ 2', '2024-03-02'),
(3, N'Lê Văn C', 'levanc@gmail.com', '0934567890', N'Nội dung liên hệ 3', '2024-03-03'),
(4, N'Phạm Thị D', 'phamthid@gmail.com', '0923456789', N'Nội dung liên hệ 4', '2024-03-04'),
(5, N'Hoàng Văn E', 'hoangvane@gmail.com', '0912345678', N'Nội dung liên hệ 5', '2024-03-05'),
(6, N'Ngô Thị F', 'ngothif@gmail.com', '0901234567', N'Nội dung liên hệ 6', '2024-03-06'),
(7, N'Bùi Văn G', 'buivang@gmail.com', '0890123456', N'Nội dung liên hệ 7', '2024-03-07'),
(8, N'Vũ Thị H', 'vuthih@gmail.com', '0889012345', N'Nội dung liên hệ 8', '2024-03-08'),
(9, N'Phan Văn I', 'phanvani@gmail.com', '0878901234', N'Nội dung liên hệ 9', '2024-03-09'),
(10, N'Dang Thị J', 'dangthij@gmail.com', '0867890123', N'Nội dung liên hệ 10', '2024-03-10')

--Nhập dữ liệu mẫu cho RaoVat
INSERT INTO RaoVat (MaRV, TieuDeRV, NoiDungRV, ThoiGianDangRV, LienHeRV, MaKV) VALUES
(1, N'Rao vặt 1', N'Nội dung rao vặt 1', '2024-04-01', N'Liên hệ rao vặt 1', 1),
(2, N'Rao vặt 2', N'Nội dung rao vặt 2', '2024-04-02', N'Liên hệ rao vặt 2', 2),
(3, N'Rao vặt 3', N'Nội dung rao vặt 3', '2024-04-03', N'Liên hệ rao vặt 3', 1),
(4, N'Rao vặt 4', N'Nội dung rao vặt 4', '2024-04-04', N'Liên hệ rao vặt 4', 2),
(5, N'Rao vặt 5', N'Nội dung rao vặt 5', '2024-04-05', N'Liên hệ rao vặt 5', 1),
(6, N'Rao vặt 6', N'Nội dung rao vặt 6', '2024-04-06', N'Liên hệ rao vặt 6', 2),
(7, N'Rao vặt 7', N'Nội dung rao vặt 7', '2024-04-07', N'Liên hệ rao vặt 7', 1),
(8, N'Rao vặt 8', N'Nội dung rao vặt 8', '2024-04-08', N'Liên hệ rao vặt 8', 2),
(9, N'Rao vặt 9', N'Nội dung rao vặt 9', '2024-04-09', N'Liên hệ rao vặt 9', 1),
(10, N'Rao vặt 10', N'Nội dung rao vặt 10', '2024-04-10', N'Liên hệ rao vặt 10', 2)

--Nhập dữ liệu mẫu cho Startup
INSERT INTO Startup (MaStartup, TenStartup, MoTaStartup, NgayThanhLap, LienHeStartup, MaKV) VALUES
(1, N'Startup 1', N'Mô tả startup 1', '2022-05-01', N'Liên hệ startup 1', 1),
(2, N'Startup 2', N'Mô tả startup 2', '2022-06-01', N'Liên hệ startup 2', 2),
(3, N'Startup 3', N'Mô tả startup 3', '2022-07-01', N'Liên hệ startup 3', 1),
(4, N'Startup 4', N'Mô tả startup 4', '2022-08-01', N'Liên hệ startup 4', 2),
(5, N'Startup 5', N'Mô tả startup 5', '2022-09-01', N'Liên hệ startup 5', 1),
(6, N'Startup 6', N'Mô tả startup 6', '2022-10-01', N'Liên hệ startup 6', 2),
(7, N'Startup 7', N'Mô tả startup 7', '2022-11-01', N'Liên hệ startup 7', 1),
(8, N'Startup 8', N'Mô tả startup 8', '2022-12-01', N'Liên hệ startup 8', 2),
(9, N'Startup 9', N'Mô tả startup 9', '2023-01-01', N'Liên hệ startup 9', 1),
(10, N'Startup 10', N'Mô tả startup 10', '2023-02-01', N'Liên hệ startup 10', 2)

