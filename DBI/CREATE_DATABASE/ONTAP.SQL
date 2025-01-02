--ÔN TẬP
USE [QL_CONGTY_SE1809]
--QUERY STATEMENT 
--BT1) LẤY RA NHỮNG NHÂN VIÊN CÓ LƯƠNG > 50000
	SELECT *
	FROM NHANVIEN 
	WHERE LUONG>50000

--BT2) Lấy ra TENNV, LUONGNV của những nhân viên có lương > 50000
	SELECT TENNV,LUONG
	FROM NHANVIEN
	WHERE LUONG > 50000
	
--BT3) Lấy ra TENNV 'TÊN NHÂN VIÊN', LUONG 'LƯƠNG NHÂN VIÊN'của những nhân viên có lương > 80000
	SELECT NV.TENNV N'TÊN NHÂN VIÊN',NV.LUONG N'LƯƠNG NHÂN VIÊN'
	FROM NHANVIEN NV
	WHERE NV.LUONG>80000

--BT4) Lấy ra MANV,TENNV,TUOI,GIOITINH của những nhân viên có tuổi lớn hơn 40 và nữ và nhưng nhân viên tuổi > 50 và giới tính nam
	SELECT MANV,TENNV,YEAR(GETDATE())-YEAR(NGAYSINH) N'TUỔI',GIOITINH
	FROM NHANVIEN 
	WHERE GIOITINH ='F' AND YEAR(GETDATE())-YEAR(NGAYSINH)>40 
	OR GIOITINH='M' AND YEAR(GETDATE())-YEAR(NGAYSINH)>50

--BT5)  Lấy ra MANV,TENNV,MAPHG,LUONG của nhân viên có giới tính là nữ SẮP XẾP MAPHG TĂNG,LUONG GIẢM 
	SELECT NV.MANV,NV.TENNV,PB.MAPHG,NV.LUONG
	FROM NHANVIEN NV,PHONGBAN PB
	WHERE NV.GIOITINH='F'
	ORDER BY NV.GIOITINH ASC,NV.LUONG DESC

--BT6) Lấy ra MANV ,TENNV ,GIOITINH,DIACHI của những nhân viên có tên là : MAI DUY An
	SELECT NV.MANV,NV.TENNV,NV.GIOITINH,NV.DIACHI 
	FROM NHANVIEN NV
	WHERE NV.TENNV = N'MAI DUY AN'

--BT7) Lấy ra MANV ,TENNV ,GIOITINH,DIACHI của những nhân viên có chứa chữ 'THỊ'
	SELECT NV.MANV,NV.TENNV,NV.GIOITINH,NV.DIACHI
	FROM NHANVIEN NV
	WHERE NV.TENNV LIKE N'%THỊ%'

--BT8)  Lấy ra những nhân viên làm việc tại phòng phần mềm trong nước 
	SELECT NV.*
	FROM NHANVIEN NV,PHONGBAN PB
	WHERE PB.TENPHG = N'Phòng Phần mềm trong nước' and NV.MAPHG=PB.MAPHG

--BT9) CHo biết những địa chỉ quê quán nào mà nhân viên đang thường trú 
	SELECT  DISTINCT(NV.DIACHI)
	FROM NHANVIEN NV

--BT10) Lấy ra MANV,TENNV,GIOITINH,LUONG của những nhân viên có tên bắt đầu bằng kí tự H HOẶC LƯƠNG >80K
	SELECT NV.MANV,NV.TENNV,NV.GIOITINH,NV.LUONG
	FROM NHANVIEN NV
	WHERE NV.TENNV LIKE N'H%' OR NV.LUONG > 80000

	--CÁCH 2 : 
	SELECT NV.MANV,NV.TENNV,NV.GIOITINH,NV.LUONG FROM NHANVIEN NV WHERE NV.TENNV LIKE 'H%'
	UNION 
	SELECT NV.MANV,NV.TENNV,NV.GIOITINH,NV.LUONG FROM NHANVIEN NV WHERE NV.LUONG>80000

--VD11: Lấy ra tên những nhân viên ko phải người giám sát 
	SELECT NV.MANV,NV.TENNV
	FROM NHANVIEN NV
	WHERE NV.MANV IN (
	SELECT MANV FROM NHANVIEN   
	EXCEPT
	SELECT MANGS FROM NHANVIEN 

	)

--VD12: Lấy ra những nhân viên đang làm việc tại phòng có tên là Phòng Phần mềm trong nước 

	SELECT NV.*
	FROM NHANVIEN NV,PHONGBAN PB
	WHERE PB.TENPHG=N'Phòng Phần mềm trong nước' AND NV.MAPHG=PB.MAPHG

	--CÁCH 2: 
	SELECT NV.* FROM NHANVIEN NV WHERE NV.MAPHG=
	(
	SELECT PB.MAPHG FROM PHONGBAN PB WHERE PB.TENPHG=N'Phòng Phần mềm trong nước' 
	)

--bt13)  Lấy ra thông tin những dự án được triển khai tại địa điểm có tên là : "HN"
--CÁCH 1 
	SELECT DA.*
	FROM DUAN DA,DIADIEM DD
	WHERE DD.TENDD =N'TP Hà Nội'
	AND DA.MADD=DD.MADD
--CÁCH 2 : 
	SELECT * 
	FROM DUAN 
	WHERE MADD = ( 
					SELECT MADD
					FROM DIADIEM
					WHERE TENDD=N'TP Hà Nội'
	)

--===========================================================================================================================
--SUBQUERY 

--BT14: Lấy ra MANGS,TENNGS của nhân viên có tên là Vũ Thị Hồng Anh --LÀM LẠI (1) 
	SELECT NV.MANV,NV.TENNV
	FROM NHANVIEN NV,(SELECT MANGS FROM NHANVIEN WHERE TENNV=N'Vũ Thuỵ Hồng Anh')A
	WHERE NV.MANV=A.MANGS

--BT15:Lấy ra MANGS,TENNGS của những nhân viên có tuổi > 40  
	SELECT DISTINCT NV.MANV N'MÃ NGƯỜI GIÁM SÁT',NV.TENNV N'TÊN NGƯỜI GIÁM SÁT' 
	FROM NHANVIEN NV,(SELECT MANGS FROM NHANVIEN WHERE YEAR(GETDATE())-YEAR(NGAYSINH)>40 )A
	WHERE NV.MANV=A.MANGS

--Sử dụng JOIN,LEFT JOIN,RIGHT JOIN,FULL JOIN...
--VD16: Lấy ra MANV,TENNV,TENPH của những nhân viên làm việc tại phòng phần mềm trong nước 
	SELECT NV.MANV,NV.TENNV,PB.TENPHG 
	FROM NHANVIEN NV,PHONGBAN PB
	WHERE PB.TENPHG=N'Phòng Phần mềm trong nước' AND NV.MAPHG=PB.MAPHG

	--CÁCH 2: 
	SELECT NV.MANV,NV.TENNV,PB.TENPHG
	FROM NHANVIEN NV JOIN PHONGBAN PB 
	ON NV.MAPHG=PB.MAPHG AND PB.TENPHG=N'Phòng Phần mềm trong nước'
	
--VD17 : Lấy ra MANV,TENNV, tổng số giờ mà nhân viên đó đã tham gia tất cả dự án
	SELECT NV.MANV,NV.TENNV,SUM(PC.SOGIO) N'TỔNG SỐ GIỜ THAM GIA'
	FROM NHANVIEN NV,PHANCONG PC
	WHERE NV.MANV=PC.MANV
	GROUP BY NV.MANV,NV.TENNV

--VD18: Lấy ra MADD,TENDD,TENPB,TỔNG SỐ DỰ ÁN triển khai tại địa điểm đó do phòng ban phụ trách 
	SELECT  DD.MADD,DD.TENDD,PB.TENPHG,COUNT(DA.MADA) N'TỔNG SỐ DỰ ÁN'
	FROM DIADIEM DD,DUAN DA,PHONGBAN PB
	WHERE DD.MADD=DA.MADD AND PB.MAPHG=DA.MAPHG
	GROUP BY DD.MADD,DD.TENDD,PB.TENPHG

--VD19: Lấy ra MANV,TENNV, Tổng số lượng người phụ thuộc của nhân viên đó
	SELECT NV.MANV,NV.TENNV,COUNT(NPT.TENNPT) N'TỔNG SỐ LƯỢNG NGƯỜI PHỤ THUỘC'
	FROM NHANVIEN NV,NGUOIPHUTHUOC NPT
	WHERE NV.MANV=NPT.MANV
	GROUP BY NV.MANV,NV.TENNV

--VD20: Lấy ra MANV,TENPB,Tổng số lượng nhân viên làm việc tại phòng ban đó --HAVING : ĐK LỌC NÂNG CAO
--Lấy ra thông tin của phòng ban có số lượng nhân viên nhiều nhất
	SELECT PB.MAPHG,PB.TENPHG, COUNT(NV.MANV) N'TỔNG SỐ LƯỢNG NHÂN VIÊN'
	FROM NHANVIEN NV,PHONGBAN PB
	WHERE NV.MAPHG=PB.MAPHG
	GROUP BY PB.MAPHG,PB.TENPHG
	HAVING COUNT(NV.MANV) >=ALL (
								SELECT COUNT(NV.MANV) 
								FROM NHANVIEN NV
								GROUP BY NV.MAPHG
	
	)

--VD21: Lấy ra MADD,TENDD,tổng số lượng dự án tại địa điểm triển khai ít nhất 
	SELECT DD.MADD,DD.TENDD,COUNT(DA.MADA) N'SỐ LƯỢNG DỰ ÁN'
	FROM DIADIEM DD,DUAN DA 
	WHERE DD.MADD=DA.MADD
	GROUP BY DD.MADD,DD.TENDD
	HAVING COUNT(DA.MADA)<=ALL(
								SELECT COUNT(DA.MADA)
								FROM DUAN DA
								GROUP BY DA.MADA
	)

--==========================================================================================================================
--T-SQL 
--CÓ 3 STEP : 
--STEP 1 : khai báo biến 
--STEP 2 : gán giá trị cho biến 
	--có 3 cách 
	--cách 1: 
		--từ khóa set gán biến bằng 1 giá trị cụ thể .VD : 
		--SET @SOA = 1000 --SET BIẾN = VALUE 
		--SET @HOTEN = N'NGUYỄN VĂN A'
	--cách 2: 
		--dùng từ khóa set gán biến = kết quả trả về của 1 câu truy vấn 
		--VD: VIẾT T-SQL lấy ra MANV của nhân viên có tên là Mai Duy An 
	DECLARE @MANV DECIMAL (18,0) 
	SET @MANV = (SELECT NV.MANV FROM NHANVIEN NV WHERE NV.TENNV=N'Mai Duy An')
	PRINT @MANV
	--cách 3: 
	--gán trực tiếp biến vào attribute trong mệnh đề select 
	--VD: viết T-SQL lấy ra tổng số lượng dự án mà nhân viên 
	--NGUYỄN THÚY QUỲNH ANH đã tham gia 
		DECLARE @TONGDUAN INT 
		SELECT @TONGDUAN=COUNT(PC.MADA) 
		FROM NHANVIEN NV,PHANCONG PC
		WHERE NV.MANV=PC.MANV
		AND NV.TENNV=N'NGUYỄN THÚY QUỲNH ANH'
		PRINT N'Tổng số lượng dự án là :'+ CONVERT(CHAR(5),@TONGDUAN)
		-------------------------------------------------------
--VD: VIẾT T-SQL lấy ra MANV của nhân viên có tên là Mai Duy An
--CÁCH 2:
	DECLARE @MANV1 DECIMAL(18,0)
	SET @MANV1=(
				SELECT MANV
				FROM NHANVIEN
				WHERE TENNV=N'MAI DUY AN'
	)
	PRINT N'MÃ NHÂN VIÊN CỦA MAI DUY AN LÀ '+CONVERT(CHAR(20), @MANV1) 

--VD2: viết T-SQL lấy ra tổng số lượng dự án mà nhân viên 
--NGUYỄN THÚY QUỲNH ANH đã tham gia 
	DECLARE @TONGDUAN1 INT 
	
	SELECT @TONGDUAN1=COUNT(PC.MADA)
	FROM NHANVIEN NV,PHANCONG PC
	WHERE PC.MANV=NV.MANV
	AND NV.TENNV=N'Nguyễn Thúy Quỳnh Anh'
	GROUP BY NV.MANV

	PRINT N'TỔNG SỐ LƯỢNG DỰ ÁN CỦA NHÂN VIÊN NGUYỄN THÚY QUỲNH ANH THAM GIA LÀ : '+CONVERT(CHAR(5),@TONGDUAN1)
--VD3: Viết T-SQL tính tổng số giờ mà nhân viên có tên là TỐNG THỊ LAN ANH đã tham gia tất cả dự án 
--CÁCH 2: 
DECLARE @TONGSOGIO1 INT 

SET @TONGSOGIO1=(
					SELECT SUM(PC.SOGIO)
					FROM NHANVIEN NV,PHANCONG PC
					WHERE PC.MANV=NV.MANV AND NV.TENNV=N'Tống Thị Lan Anh'
					GROUP BY NV.MANV
		
)

PRINT N'TỔNG SỐ GIỜ LÀM LÀ : '+CONVERT(CHAR(5),@TONGSOGIO1)
--CÁCH 3 : 
DECLARE @TONGSOGIO2 INT 

	SELECT @TONGSOGIO2=SUM(PC.SOGIO)
	FROM NHANVIEN NV,PHANCONG PC
	WHERE PC.MANV=NV.MANV AND NV.TENNV=N'Tống Thị Lan Anh'
	GROUP BY NV.MANV
PRINT N'TỔNG SỐ GIỜ LÀM LÀ : '+CONVERT(CHAR(5),@TONGSOGIO2)

--NÂNG CAO: LẤY RA THÊM THÔNG TIN TÊN PHÒNG BAN ĐÓ VÀ SỐ GIỜ CỦA PHÒNG BAN NHIỀU NHẤT 
--DÙNG CÁCH 3 : 
	DECLARE @SOGIOPB INT 
	DECLARE @TENPB1 NVARCHAR(200) 

	SELECT @TENPB1=PB.TENPHG,@SOGIOPB=SUM(PC.SOGIO)
	FROM PHONGBAN PB,PHANCONG PC,DUAN DA
	WHERE PB.MAPHG=DA.MAPHG AND PC.MADA=DA.MADA
	GROUP BY PB.TENPHG
	HAVING SUM(PC.SOGIO) >= ALL (
						SELECT SUM(PC.SOGIO)
						FROM PHANCONG PC,DUAN DA
						WHERE DA.MADA=PC.MADA
						GROUP BY DA.MAPHG
		
	)

	PRINT @TENPB1 + N' CÓ SỐ GIỜ LÀ :' + CONVERT(CHAR(5),@SOGIOPB)

--VD5: Viết T-SQL kiểm tra tuổi của nhân viên có tên là MAI DUY AN 
--Nếu tuổi lớn hơn 18 thì in ra đủ tuổi lao động ngược lại thì chưa đủ tuổi lao động 

DECLARE @CHECK INT 

SELECT @CHECK=YEAR(GETDATE())-YEAR(NV.NGAYSINH)
FROM NHANVIEN NV
WHERE NV.TENNV=N'Mai Duy An'

IF @CHECK>18
	BEGIN 
		PRINT N'ĐỦ TUỔI LAO ĐỘNG'
	END 
ELSE 
	BEGIN 
		PRINT N'CHƯA ĐỦ TUỔI LAO ĐỘNG'
	END 

--VD6: Viết T_SQL sử dụng case when then kiểm tra địa chỉ của nhân viên 
--có tên là MAI DUY AN
--Địa chỉ là TP Hồ Chí Minh thì in ra phụ cấp là 500000
--TP Hà Nội thì in ra phụ cấp là 300000 
--Ngược lại thì in ra phụ cấp là 0 

DECLARE @CHEKDC NVARCHAR(200)

SELECT @CHEKDC=
	CASE DIACHI WHEN N'TP Hồ Chí Minh' THEN '500000'
				WHEN N'TP Hà Nội' THEN '3000000'
				ELSE '0'
				END
FROM NHANVIEN 
WHERE TENNV=N'Mai Duy An'

PRINT @CHEKDC
GO
--=============================================================================================
--STORE PROCEDURE 
--CÓ 3 DẠNG : THAM SỐ TRUYỀN VÀO , THAM SỐ VÀO VÀ RA , RETURN 1 GIÁ TRỊ CỤ THỂ 
	--DẠNG 1 
	--VD1: Viết strore procedure với tham số vào là TENPB,lấy ra thông tin 
	--Những nhân viên đang làm việc tại phòng ban đó 
	CREATE PROCEDURE DANG1 (@TENPBDG1 NVARCHAR(200))
	AS 
		SELECT NV.*
		FROM NHANVIEN NV,PHONGBAN PB
		WHERE NV.MAPHG=PB.MAPHG
		AND @TENPBDG1=PB.TENPHG
	GO

	EXEC DANG1 @TENPBDG1=N'Phòng Phần mềm trong nước'

	if OBJECT_ID ('DANG1') is not null 
	drop procedure DANG1
	GO
	--DẠNG 2 : CÓ THAM SỐ VÀO VÀ THAM SỐ RA 
	--VD3: Viết tham số vào là TENPB,tham số ra là tổng số lượng nhân viên đang làm việc tại phòng ban đó
	CREATE PROCEDURE DANG2 (@TENPBDG2 NVARCHAR(200),@TONGSLNVDG2 INT OUTPUT)

	AS 
		
		SET @TONGSLNVDG2= (
							SELECT COUNT(NV.MANV)
							FROM NHANVIEN NV,PHONGBAN PB
							WHERE NV.MAPHG=PB.MAPHG
							AND PB.TENPHG=@TENPBDG2
							
		)
		
	GO

	DECLARE @A INT 
	EXEC DANG2 @TENPBDG2=N'Phòng Phần mềm trong nước',@TONGSLNVDG2=@A OUTPUT
	PRINT N'SỐ NV '+CONVERT(CHAR(5),@A)

	IF OBJECT_ID ('DANG2') IS NOT NULL
	DROP PROCEDURE DANG2
	GO
	--DẠNG 3 : RETURN RA 1 GIÁ TRỊ CỤ THỂ 
	--VD5: Viết Store Procedure với tham số vào là TENPB,tính tổng số lượng 
	--nhân ra đang làm việc tại phòng ban đó 
	CREATE PROCEDURE DANG3 (@TENPBDG3 NVARCHAR(200))

	AS 
		DECLARE @TONGSLNVDG3 INT =(
							SELECT COUNT(NV.MANV)
							FROM NHANVIEN NV,PHONGBAN PB
							WHERE PB.MAPHG=NV.MAPHG
							AND PB.TENPHG=@TENPBDG3
		
		
		)
	RETURN @TONGSLNVDG3
	GO
	DECLARE @S INT
	EXEC @S=DANG3 @TENPBDG3=N'Phòng Phần mềm trong nước'
	PRINT N'TỔNG SỐ NHÂN VIÊN LÀ : '+CONVERT(CHAR(5),@S)