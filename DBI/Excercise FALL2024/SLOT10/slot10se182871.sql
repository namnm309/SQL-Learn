--SE182871
--Câu 1 : Cho biết ai đang quản lý phòng ban có tên: Phòng Nghiên cứu và phát triển. 
--Thông tin yêu cầu: mã số,họ tên nhân viên, mã số phòng ban, tên phòng ban

	SELECT NV.MANV,NV.TENNV,PB.MAPHG,PB.TENPHG
	FROM NHANVIEN NV,PHONGBAN PB
	WHERE PB.MAPHG=5 AND PB.MATRUONGPHG=NV.MANV
	
--Câu 2 : Cho phòng ban có tên: Phòng Nghiên cứu và phát triển hiện đang quản lý dự án nào. 
--Thông tin yêu cầu: mã số dụ án, tên dự án, tên phòng ban quản lý

	SELECT DA.MADA,DA.TENDA,PB.TENPHG
	FROM PHONGBAN PB,DUAN DA
	WHERE DA.MAPHG=5 

--Câu 3 : Cho biết dự án có tên ProjectB hiện đang được quản lý bởi phòng ban nào. 
--Thông tin yêu cầu: mã số dụ án, tên dự án, tên phòng ban quản lý

	SELECT DA.MADA,DA.TENDA,PB.TENPHG
	FROM DUAN DA,PHONGBAN PB
	WHERE DA.TENDA='ProjectB' AND DA.MAPHG=PB.MAPHG

--Câu 4 : Cho biết những nhân viên nào đang bị giám sát bởi nhân viên có tên Mai Duy An. 
--Thông tin yêu cầu: mã số nhân viên, họ tên nhân viên
	SELECT NV.MANV,NV.TENNV
	FROM NHANVIEN NV
	WHERE NV.MANGS = 
	(
	SELECT NV.MANV 
	FROM NHANVIEN NV
	WHERE NV.TENNV=N'MAI DUY AN'
	)

--Câu 5 : Cho biết ai hiện đang giám sát những nhân viên có tên Mai Duy An. 
--Thông tin yêu cầu: mã số nhân viên, họ tên nhân viên giám sát

	SELECT NV.MANV,NV.TENNV
	FROM NHANVIEN NV
	WHERE NV.MANV=
	(
	SELECT NV.MANGS
	FROM NHANVIEN NV
	WHERE NV.TENNV=N'MAI DUY AN'
	)

--Câu 6 : Cho biết dự án có tên ProjectA hiện đang làm việc ở đâu. Thông tin yêu cầu: mã số, tên vị trí làm việc.

	SELECT DA.MADD,DD.TENDD
	FROM DUAN DA,DIADIEM DD
	WHERE DA.TENDA='ProjectA' AND DA.MADD=DD.MADD

--Câu 7 : Cho biết vị trí làm việc có tên Tp. HCM hiện đang là chỗ làm việc của những dự án nào. 
--Thông tin yêu cầu: mã số, tên dự án

	SELECT DISTINCT DA.MADA,DA.TENDA
	FROM DIADIEM DD,DUAN DA
	WHERE DA.MADD=
	(
	SELECT DD.MADD 
	FROM DIADIEM DD
	WHERE DD.TENDD=N'TP Hồ Chí Minh'
	)

--Câu 8 : Cho biết những người phụ thuộc trên 18 tuổi .
--Thông tin yêu cầu: tên, ngày tháng năm sinh của người phụ thuộc, tên nhân viên phụ thuộc vào.
	
	SELECT NPT.TENNPT,NPT.NGAYSINH,NV.TENNV
	FROM NGUOIPHUTHUOC NPT,NHANVIEN NV
	WHERE NPT.MANV=NV.MANV AND  ((YEAR(GETDATE())-YEAR(NPT.NGAYSINH)))>18 

--Câu 9 : Cho biết những người phụ thuộc là nam giới. 
--Thông tin yêu cầu: tên, ngày tháng năm sinh của người phụ thuộc, tên nhân viên phụ thuộc vào
	
	SELECT NPT.TENNPT,NPT.NGAYSINH,NV.TENNV
	FROM NGUOIPHUTHUOC NPT,NHANVIEN NV
	WHERE NPT.GIOITINH='M' AND NPT.MANV=NV.MANV

--Câu 10 : Cho biết những nơi làm việc của phòng ban có tên : Phòng Nghiên cứu và phát triển. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, tên nơi làm việc

	SELECT PB.MAPHG,PB.TENPHG,DD.TENDD
	FROM PHONGBAN PB,DIADIEM DD,DUAN DA
	WHERE DD.MADD=DA.MADD AND DA.MAPHG= 
	(
	SELECT PB.MAPHG
	FROM PHONGBAN PB
	WHERE PB.TENPHG=N'Phòng Nghiên cứu và phát triển'
	)
	

