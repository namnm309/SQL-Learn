--VIẾT THỦ TỤC - STORE PROCEDURE 
USE [QL_CONGTY_SE1809]
GO --Ngăn cách store procedure phía dưới , nếu ko có go thì sẽ báo lỗi dưới 
--------------------------------

--DẠNG 1 : Có tham số truyền vào 
--VD1: Viết strore procedure với tham số vào là TENPB,lấy ra thông tin 
--Những nhân viên đang làm việc tại phòng ban đó 
CREATE PROCEDURE PR_01_VD01 (@TENPB NVARCHAR(200))
AS 
	
		SELECT NV.*
		FROM NHANVIEN NV,PHONGBAN PB
		WHERE NV.MAPHG=PB.MAPHG
		AND PB.TENPHG=@TENPB
	
GO
--THỰC THI LỆNH 
--CÓ THỂ VIẾT EXEC/EXECUTE 
EXECUTE PR_01_VD01 @TENPB=N'Phòng Phần mềm trong nước'
GO

--VD2: Viết store procedure voi81 tham số vào là TENDD,lấy ra thông tin những dự án triển khai tại địa điểm đó 
IF OBJECT_ID ('PR_02_VD02','P') IS NOT NULL --Câu lệnh kiểm tra nếu procedure đã tồn tại thì cập nhật lại  
	DROP PROCEDURE PR_02_VD02
GO

CREATE PROCEDURE PR_02_VD02 (@TENDD NVARCHAR(200))
AS 
	BEGIN
	SELECT DA.*
	FROM DIADIEM DD,DUAN DA
	WHERE DD.MADD=DA.MADA
	--AND DD.TENDD=@TENDD
	AND DD.TENDD LIKE '%' + @TENDD + '%'
	END
GO
--THỰC THI 
EXEC PR_02_VD02 @TENDD=N'HÀ NỘI' -- KO THỂ LIKE Ở THỰC THI 
GO
--DẠNG 2 : CÓ THAM SỐ VÀO VÀ THAM SỐ RA 
--VD3: Viết tham số vào là TENPB,tham số ra là tổng số lượng nhân viên đang làm việc tại phòng ban đó 
CREATE PROCEDURE PR0C_S2_VD03 (@TENPB NVARCHAR(200),@TONGNV INT OUTPUT)
AS 
	BEGIN
		SET @TONGNV=(
					SELECT COUNT(NV.MANV) 
					FROM NHANVIEN NV,PHONGBAN PB
					WHERE NV.MAPHG=PB.MAPHG
					AND PB.TENPHG=@TENPB
		)
	END 
GO
--THỰC THI 
DECLARE @T INT --KHAI BÁO 1 VIẾN TRUNG GIAN 
EXECUTE PR0C_S2_VD03 @TENPB=N'Phòng Phần mềm trong nước',
															--@TONGNV OUTPUT -- KO ĐC KHAI BÁO TRỰC TIẾP OUTPUT Ở ĐÂY 
														 @TONGNV =@T OUTPUT --GÁN BIẾN OUTPUT=BIẾN TRUNG GIAN 
PRINT N'TỔNG SỐ LƯỢNG NHÂN VIÊN LÀ '+CONVERT(CHAR(5),@T) --@T,IN BIẾN TRUNG GIAN 
GO

--VD4: VIẾT STORE PROCEDURE VỚI THAM SỐ LÀ TENDD,THAM SỐ RA LÀ TỔNG 
--SỐ DỰ ÁN TRIỂN KHAI TẠI ĐỊA ĐIỂM ĐÓ 
IF OBJECT_ID ('PROC_S2_VD04','P') IS NOT NULL --Câu lệnh kiểm tra nếu procedure đã tồn tại thì cập nhật lại  
	DROP PROCEDURE PROC_S2_VD04
GO
CREATE PROCEDURE PROC_S2_VD04 (@TENDD NVARCHAR(200),@TONGDA INT OUTPUT)
AS
	BEGIN 
		SET @TONGDA=(
					SELECT COUNT(DA.TENDA)
					FROM DIADIEM DD,DUAN DA
					WHERE DD.MADD=DA.MADD
					--AND DD.TENDD=@TENDD
					AND DD.TENDD LIKE '%' +@TENDD + '%'
					)
	END 
GO
--THỰC THI 

DECLARE @T INT --KHAI BÁO 1 VIẾN TRUNG GIAN 
EXECUTE PROC_S2_VD04 @TENDD=N'TP Hà Nội',
															--@TONGNV OUTPUT -- KO ĐC KHAI BÁO TRỰC TIẾP OUTPUT Ở ĐÂY 
														 @TONGDA =@T OUTPUT --GÁN BIẾN OUTPUT=BIẾN TRUNG GIAN 
PRINT N'TỔNG SỐ LƯỢNG DỰ ÁN LÀ '+CONVERT(CHAR(5),@T) --@T,IN BIẾN TRUNG GIAN 
GO

--DẠNG 3 : RETURN RA 1 GIÁ TRỊ CỤ THỂ 
--VD5: Viết Store Procedure với tham số vào là TENPB,tính tổng số lượng 
--nhân ra đang làm việc tại phòng ban đó 
CREATE PROCEDURE PROC_D3_VD05 (@TENPB NVARCHAR(200))
AS 
	BEGIN 
		DECLARE @TONG INT
		SET @TONG =(
			SELECT COUNT(NV.MANV)
			FROM NHANVIEN NV,PHONGBAN PB
			WHERE NV.MAPHG=PB.MAPHG
			AND PB.TENPHG=@TENPB
		)
		RETURN @TONG -- RETURN RA 1 GIÁ TRỊ CỤ THỂ 
	END 
GO
--THỰC THI 
DECLARE @T INT 
EXECUTE @T = PROC_D3_VD05 @TENPB=N'Phòng Phần mềm trong nước'
PRINT N'TỔNG SỐ LƯỢNG NHÂN VIÊN LÀ ' + CAST(@T AS CHAR(5))
GO
--VD6 : Viết store procedure với tham số vào là tuổi , tính tổng số lượng nhân viên thuộc độ tuổi đó 
CREATE PROCEDURE PROC_D3_VD06 (@TUOI INT )
AS 
	BEGIN 
		DECLARE @TONGNV INT 
		SET @TONGNV = (
						SELECT COUNT(MANV)
						FROM NHANVIEN 
						WHERE (YEAR(GETDATE())-YEAR(NGAYSINH)) = @TUOI
		)
		RETURN @TONGNV
	END
GO
--THỰC THI 
DECLARE @TONG INT 
EXECUTE @TONG = PROC_D3_VD06 @TUOI=50
PRINT N'TỔNG NV CÓ ĐỘ TUỔI ĐÓ LÀ '+CONVERT(CHAR(1),@TONG) + N' NGƯỜI!'
GO



