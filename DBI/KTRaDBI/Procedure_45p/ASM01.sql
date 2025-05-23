﻿/*
	ĐỀ 1==============================================
	CÂU 1: Nhập vào tháng và năm bất kỳ cho biết thông tin những mặt hàng bán trong tháng đó. 
	CÂU 2: Đầu vào Mã khách hàng. Kiểm tra khách hàng đó có tồn tại không. 
	Đầu ra, tổng số lần mua hàng và tổng trị giá trên các lần đặt hàng của khách hàng. 
*/
--SE182871 
--CÂU 1 : 
SELECT * FROM HoaDon
--=====================
GO
	CREATE PROCEDURE CAU1 (@THANG INT ,@NAM INT)
AS	
	SELECT MH.*
	FROM HoaDon HD,MatHang MH,ChiTiet_HD CTHD
	WHERE HD.MSHD=CTHD.MSHD AND CTHD.MSMH=MH.MSMH 
	AND MONTH(HD.NGAYHD)=@THANG 
	AND YEAR(HD.NGAYHD)=@NAM
GO	
--======================
--IF OBJECT_ID('CAU1') IS NOT NULL 
--DROP PROCEDURE CAU1
--GO
--======================
EXEC CAU1 @THANG=3 , @NAM=2000
--2000-03-26 00:00:00.000
--2004-03-27 00:00:00.000
--2013-03-05 00:00:00.000

--CÂU 2 :Đầu vào Mã khách hàng. Kiểm tra khách hàng đó có tồn tại không. 
--Đầu ra, tổng số lần mua hàng và tổng trị giá trên các lần đặt hàng của khách hàng.
SELECT * FROM KhachHang
SELECT* FROM HoaDon
GO
--CHECK XEM CÓ KHÁCH HÀNG KO 
CREATE PROCEDURE CAU2 (@MAKH INT) 

AS 	
		DECLARE @CHECKKH INT,@TONGSOLMH INT,@TONGGT DECIMAL(20,0)

		SET @CHECKKH=(
							SELECT COUNT(*)
							FROM KhachHang
							WHERE MSKH=@MAKH
		)
		--KTRA CÓ KH 
		IF @CHECKKH > 0
			BEGIN 
				SELECT @TONGSOLMH = COUNT(*), @TONGGT = SUM(TONGTIEN)
				FROM HoaDon
				WHERE MSKH = @MaKH

				--IN RA 
				PRINT N'Khách hàng tồn tại.'
				PRINT N'Tổng số lần mua hàng: ' + CONVERT(CHAR(5),@TONGSOLMH)
				PRINT N'Tổng trị giá đơn hàng: ' + CONVERT(CHAR(20),@TONGGT)
			END 
    ELSE
		--ko có kh
		BEGIN			
		 PRINT N'Khách hàng không tồn tại.'
		END
	
GO
--THỰC THI 
EXEC CAU2 @MaKH = 1
EXEC CAU2 @MaKH = 2
EXEC CAU2 @MaKH = 3
EXEC CAU2 @MaKH = 4
EXEC CAU2 @MaKH = 6 -- KO CÓ 
--===============================
IF OBJECT_ID ('CAU2') IS NOT NULL 
	DROP PROCEDURE CAU2
	




