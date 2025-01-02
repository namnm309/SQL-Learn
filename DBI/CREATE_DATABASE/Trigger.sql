--===================================TRIGGER=================================================
/*
 - TRIGGER LÀ 1 DẠNG RANG BUỘC XỬ LÍ NÂNG CAO 
 - TRIGGER LÀ THỂ CHỦ ĐỘNG , khi chúng ta tạo 1 trigger 
 - Cho 1 table nào đó , bắt 1 sự kiện nào đó 
 - Thì khi đụng vào sự kiện của table đó trigger sẽ tự động chạy để kiểm tra 
 - Trigger được viết cho 3 sự kiện 
	+Insert  
	+Update
	+Delete
 - Khi viết trigger cho sự kiện Insert và Update 
	=> Trigger sẽ tạo ra 1 bảng ảo Inseted
 - Khi viết trigger cho sự kiện delete 
	=> Trigger sẽ tạo 1 bảng gọi là deleted 
 => Như vậy để thực hiện thao tác thành công 
	thì tương ứng với sự kiện nào dữ liệu sẽ được chứa vào bảng tạm tương ứng đó . 
 - Sau khi trigger kiểm tra thỏa điều kiện của triiger , thì dữ liệu mới được thao tác vào table thật trong database 
 - Có 2 trạng thái của 1 transaction : 
	+ Commit : thành công 
	+ Rollback : thất bại 
 */

--VD1 : Viết trigger cho sự kiện insert , kiểm tra 
--nhân viên phải có giới tính là F hoặc M
	--XÓA
	IF OBJECT_ID ('VD1','TR') IS NOT NULL 
	DROP TRIGGER VD1
	GO
--===========================================================
CREATE TRIGGER VD1 --Tạo 1 trigger 
ON NHANVIEN -- Trigger tạo cho table nào ? 
FOR INSERT -- Trigger viết cho sự kiện nào ?  
AS 
	BEGIN 
		DECLARE @KT CHAR(5)
		SET @KT = (SELECT INS.GIOITINH FROM inserted INS) --inserted là 1 bảng tạm 
		IF (@KT NOT IN ('F','M'))
			BEGIN
				PRINT N'GIỚI TÍNH PHẢI LÀ F HOẶC M'
				ROLLBACK --THẤT BẠI
			END
	END
GO
--TEST TRIGGER 
	INSERT INTO NHANVIEN(MANV ,TENNV,GIOITINH) VALUES (22222,N'TEST TRIGGER','ABC')--FAIL
	INSERT INTO NHANVIEN(MANV ,TENNV,GIOITINH) VALUES (22222,N'TEST TRIGGER','F')--SUCCESS
	SELECT * FROM NHANVIEN
GO
--VD2: Viết trigger kiểm tra tuổi của nhân viên cho sự kiện insert , update tuổi phải lớn hơn 18 
CREATE TRIGGER TRIG_VD2 
ON NHANVIEN
FOR INSERT,UPDATE
AS
	BEGIN
		DECLARE @KTTUOI INT
		SET @KTTUOI = (SELECT YEAR(GETDATE())-YEAR(INS.NGAYSINH) 
						FROM inserted INS,NHANVIEN NV -- Vì có update nên phải thêm bảng nhanvien để phụ check
						WHERE INS.MANV=NV.MANV
						)
		IF @KTTUOI <=18 
			BEGIN
				PRINT N'TUỔI PHẢI LỚN HƠN 18 !!!'
				ROLLBACK
			END
	END
GO

--TEST TRIGGER
INSERT INTO NHANVIEN (MANV,TENNV,GIOITINH,NGAYSINH)--NẾU KO CÓ GIOITINH SẼ KO NHẬP ĐC VÌ ĐỤNG TRIGGER Ở VD1
VALUES (666666,'Minh Nam 2','F','20040309')--Commit,năm/tháng/ngày

SELECT * FROM NHANVIEN

INSERT INTO NHANVIEN (MANV,TENNV,GIOITINH,NGAYSINH)--Rollback
VALUES (888888,'Minh Nam','F','20240309')

UPDATE NHANVIEN SET NGAYSINH ='20240309' WHERE MANV=666666

ALTER TABLE NHANVIEN DISABLE TRIGGER TRIG_VD2 -- Lệnh Disable trigger or vào trong triger click phải để modify 
GO
--VD5: Thêm vào bảng phân công cột tổng lương 
--Viết trigger tính tổng lương theo nhân viên trong đó tổng lương = lương * số giờ nhân viên đó thực hiện dự án 
	--Thêm cột tổng lương 
	ALTER TABLE PHANCONG ADD TONGLUONG MONEY
	SELECT * FROM PHANCONG
	GO
	--VIẾT TRIGGER TÍNH TỔNG LƯƠNG 
	CREATE TRIGGER TRIG_VD5
ON PHANCONG
FOR INSERT,UPDATE 
AS
	BEGIN
		--Tính tổng lương 
		UPDATE PHANCONG SET  PC.TONGLUONG=PC.SOGIO * NV.LUONG
		FROM NHANVIEN NV,PHANCONG PC,inserted INS 
		WHERE NV.MANV=PC.MANV
		AND PC.MADA=INS.MADA
		AND PC.MANV=INS.MANV

	END
GO

SELECT * FROM PHANCONG
SELECT * FROM NHANVIEN
UPDATE PHANCONG SET SOGIO=8 WHERE MANV=30121050004 -- UPDATE ĐỂ CẬP NHẬT DỮ LIỆU BÀO BẢNG LƯƠNG 

SELECT NV.TENNV,PC.TONGLUONG 
FROM NHANVIEN NV,PHANCONG PC 
WHERE  NV.MANV=PC.MANV AND NV.MANV=30121050004 

SELECT * 
FROM PHANCONG

--ĐỂ UPDATE FULL DÙNG CONSERT 













