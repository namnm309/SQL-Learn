create database ABCCompany
go
-- su dung database
use ABCCompany
go
-- tao bang
create table NhanVien
(
	MSNV char(6) not null,
	TENNV nvarchar(50),
	NGAYSINH datetime,
	PHAI nvarchar(5),
	DIACHI nvarchar(100),
	DIENTHOAI varchar(15),
	constraint pk_NhanVien_MSNV primary key (MSNV)
);
go
create table KhachHang
(
	MSKH	Int not null,
	TENKH	nvarchar(50),
	PHAI	nvarchar(5),
	DIACHI	nvarchar(100),
	DIENTHOAI	varchar(15),
	constraint pk_KhachHang_MSKH primary key (MSKH)
);
go
create table MatHang
(
	MSMH	char(6),
	TENMH	nvarchar(50),
	SL_TON	Int,
	DONGIA	Int,
	DONVITINH	nvarchar(20),
	constraint pk_MatHang_MSMH primary key (MSMH)
);
go
create table HoaDon
(
	MSHD	Int not null,
	MSNV	char(6),
	MSKH	Int,
	NGAYHD	datetime,
	TONGTIEN	Money,
	constraint pk_HoaDon_MSHD primary key (MSHD),
	constraint fk_HoaDon_MSNV foreign key (MSNV) references NhanVien(MSNV),
	constraint fk_HoaDon_MSKH foreign key (MSKH) references KhachHang(MSKH),
);
go
create table ChiTiet_HD
(
	MSHD	Int not null,
	MSMH	char(6) not null,
	SOLUONG	Int,
	THANHTIEN	Money,
	constraint pk_CT_HoaDon_MSHD primary key (MSHD,MSMH),
	constraint fk_ChiTiet_HD_MSHD foreign key (MSHD) references HoaDon(MSHD),
	constraint fk_ChiTiet_HD_MSMH foreign key (MSMH) references MatHang(MSMH)
);
go
--- Them du lieu
Insert into KhachHang values(1,N' Nguyễn Thái Hòa',N'Nam',N'305 Đại lộ 3',null);
Insert into KhachHang values(2,N' Nguyễn Kiên Viễn',N'Nam',N'30 vườn chuối',null);
Insert into KhachHang values(3,N' Phạm Ngọc Lan',N'Nữ',N'11 Bùi Thị Xuân','0933124456');
Insert into KhachHang values(4,N' Nguyễn Ngọc Anh Thư',N'Nữ',N'HCM',null);
Insert into KhachHang values(5,N' Nguyễn Văn A',N'Nam',N'215 Điện Biên Phủ','0918.123.123');
-- Them Bang Nhan Vien
set dateformat dmy;
Insert into NhanVien values('NV001',N'Nguyễn Văn Bi','15/07/1979',N'Nam',N'16/11 Trần Hưng Đạo','0918299583');
Insert into NhanVien values('NV002',N'Nguyễn Thị Na','22/09/1980',N'Nữ',N'250 Tô hiệu','0903923370');
Insert into NhanVien values('NV003',N'Nguyễn Văn Bin','12/06/1979',N'Nam',N'16 Tô hiến Thành','');
Insert into NhanVien values('NV004',N'Trần Văn Anh','12/06/1980',N'Nam',N'161 Gò xoài','');
Insert into NhanVien values('NV005',N'Trần Thúy Trinh','02/06/1981',N'Nữ',N'Tây Ninh','');
Insert into NhanVien values('NV006',N'Nguyễn Thị Kim Chi','22/06/1980',N'Nữ',N'Tiền Giang','');
--- Them bang Mat Hang
Insert into MatHang values('C0001',N'CPU i5 4x2.5GHz',49,2000000,N'Chiếc');
Insert into MatHang values('C0002',N'CPU i3 4x2.0GHz',49,1500000,N'Chiếc');
Insert into MatHang values('C0003',N'CPU i7 8x1.8GHz',49,2000000,N'Chiếc');
Insert into MatHang values('K0001',N'Keyboard P/s 2',99,80000,N'Chiếc');
Insert into MatHang values('L0001',N'Nguồn 400KW',10,300000,N'Chiếc');
Insert into MatHang values('M0001',N'Mouse HP P/s 2',0,56000,N'Chiếc');
Insert into MatHang values('M0002',N'Mouse HP USP',99,120000,N'Chiếc');
-- Them bang Hoa Don
insert into HoaDon values(1,N'NV001',2,'26/03/2000',2150000);
insert into HoaDon values(2,N'NV003',3,'27/03/2004',2150000);
insert into HoaDon values(3,N'NV002',4,'05/03/2013',8430000);
-- Them bang CHITiet_HD
insert into ChiTiet_HD values(1,N'C0001',1,2000000);
insert into ChiTiet_HD values(1,N'K0001',1,80000);
insert into ChiTiet_HD values(1,N'M0001',1,70000);
insert into ChiTiet_HD values(2,N'C0003',1,2000000);
insert into ChiTiet_HD values(2,N'M0002',1,150000);
insert into ChiTiet_HD values(3,N'C0002',1,1500000);
insert into ChiTiet_HD values(3,N'M0001',99,6930000);





