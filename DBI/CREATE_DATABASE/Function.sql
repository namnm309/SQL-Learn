--=============================VIẾT HÀM - FUNCION==================================
--FUNCTION CÓ 3 DẠNG CƠ BẢN 
--DẠNG 1 : SCALAR VALUE FUNCTION 
--Sử dụng OBJECT_ID là : FN 
--Return ra 1 kiểu dữ liệu cụ thể 
--VD1: Viết function với tham số vào là TENPB, tính tổng số nhân viên đang làm việc tại phòng ban đó 
	--Xóa 
	IF OBJECT_ID ('VD01','FN') IS NOT NULL
		DROP FUNCTION VD01
	GO
	--==========================================
	CREATE FUNCTION VD01 (@TENPB NVARCHAR(200))
	RETURNS INT -- DẠNG 1) Return ra 1 kiểu dữ liệu chứa giá trị đầu ra , returns có 's' 
AS
	BEGIN
		DECLARE @TONGNV INT
		SET @TONGNV=(
						SELECT COUNT(NV.MANV)
						FROM NHANVIEN NV,PHONGBAN PB 
						WHERE NV.MAPHG=PB.MAPHG
						AND PB.TENPHG=@TENPB
						
		)
		RETURN @TONGNV --Tại đây không có 's'
	END
GO

--THỰC THI 
DECLARE @T INT 
SET @T=DBO.VD01 (N'PHÒNG PHẦN MỀM TRONG NƯỚC') --từ khóa dbo có nghĩa là 'database owner '
PRINT N'SỐ LƯỢNG NHÂN VIÊN CỦA PHÒNG LÀ : ' + CONVERT(CHAR(5),@T)
GO
--VD2: Viết function với tham số vào là TENDD, tính tổng số dự án triển khai tại địa điểm đó 

	CREATE FUNCTION VD2 (@TENDD NVARCHAR(200))
	RETURNS INT
AS
	BEGIN
		DECLARE @TONGDA INT 
		SET @TONGDA=(
			SELECT COUNT(DA.MADA) 
			FROM DIADIEM DD,DUAN DA
			WHERE DD.MADD=DA.MADD
			AND DD.TENDD=@TENDD
		
		)
		RETURN @TONGDA
	END
GO

--THỰC THI 
	DECLARE @A INT 
	SET @A=DBO.VD2 (N'TP Hà Nội')
	PRINT N'Tổng số dự án là : '+CONVERT(CHAR(5),@A)
GO
--DẠNG 2 : Return 1 table có sẵn dưới DATABASE 
--Table Valued Function 
--Sử dụng Object_ID là IF 
--VD3: Viết function với tham số vào là GIOITINH , lấy ra thông tin của những nhân viên thuộc giới tính đó 
	--XÓA
	IF OBJECT_ID ('VI3','IF') IS NOT NULL
		DROP FUNCTION VI3
	GO

CREATE FUNCTION VD3 (@GIOITINH CHAR(5))

RETURNS TABLE -- Dạng 2 trả về 1 table có sẵn dưới database , return có 's'
AS
	--VÌ CHỈ CÓ 1 CÂU LỆNH NÊN CÓ THỂ BỎ BEGIN VÀ END
		RETURN (SELECT * FROM NHANVIEN WHERE GIOITINH=@GIOITINH)		
GO

--THỰC THI : Thao tác như bảng 
SELECT * FROM DBO.VD3 ('F')
GO

--VD4: Viết function với tham số vào là tuổi , lấy ra thông tin những người phụ thuộc vào độ tuổi đó
	CREATE FUNCTION VD4 (@TUOI CHAR(5))

	RETURNS TABLE 
AS 
	RETURN (SELECT * FROM NHANVIEN WHERE YEAR(GETDATE())-YEAR(NGAYSINH)=@TUOI )	
GO

--THỰC THI 
SELECT * FROM DBO.VD4 ('54')
GO
--DẠNG 3: (KHÓ NHẤT) Returns 1 table hoàn toàn chưa có sẵn dưới database 
--Table Valued Function 
--Sử dụng Object_ID là TF 
--VD5: Viết function với tham số vào là MANV,lấy ra thông tin gồm tên nv 
	--, tên pb mà nhân viên đó làm vc , tổng số dự án nv đó đã tham gia 

IF OBJECT_ID ('VD5','TF') IS NOT NULL
	DROP FUNCTION VD5 
GO
	
	CREATE FUNCTION VD5 (@MANV DECIMAL (18,0))
	RETURNS @THONGKE TABLE 
	(
		TENNV NVARCHAR(200),
		TENPB NVARCHAR(200),
		TONGDA INT	
	)
AS
	BEGIN
		INSERT @THONGKE --TENNV | TENPB | TONGDA 
		SELECT NV.TENNV,PB.TENPHG,COUNT(PC.MADA)
		FROM NHANVIEN NV,PHONGBAN PB,PHANCONG PC
		WHERE NV.MAPHG=PB.MAPHG 
			AND PC.MANV=NV.MANV
			AND NV.MANV=@MANV
		GROUP BY NV.TENNV,PB.TENPHG
			RETURN --PHẢI CÓ RETURN KO SẼ BÁO LỖI 
	END
GO
--THỰC THI 
SELECT * FROM DBO.VD5 (30121050015)
GO
--VD6: Viết function với tham số vào là TENNV , lấy ra thông tin gồm MANV 
	--, TONGSODUAN mà nv đó đã tham gia , tổng giờ nv tham gia dự án 
	CREATE FUNCTION VD6 (@TENNV NVARCHAR(200))
	RETURNS @THONGKE2 TABLE 
	(
		MANV INT,
		TONGDA INT,
		TONGGIO INT 	
	)
AS
	BEGIN
	INSERT @THONGKE2
		SELECT NV.MANV ,COUNT(DA.MADA) ,SUM(PC.SOGIO)
		FROM NHANVIEN NV,PHANCONG PC,DUAN DA
		WHERE NV.MANV=PC.MANV 
		AND DA.MADA=PC.MADA
		AND NV.TENNV=@TENNV
		GROUP BY NV.MANV
		RETURN
	END 
GO

--THỰC THI 
SELECT * FROM DBO.VD6 ('MAI DUY AN')



