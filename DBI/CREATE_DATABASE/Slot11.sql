----SQL : DML 
USE [QL_CONGTY_SE1809]
	--SUB QUERIES IN FROM CLAUSE 
	--Bản chất là tạo ra 1 bảng ảo tại from theo yêu cầu 

--VD14:Lấy ra MANGS,TENNGS của nhân viên có tên là Vũ Thị Hồng Anh 
	SELECT NV.MANV N'MANGS',NV.TENNV N'TENNGS' 
	FROM NHANVIEN NV,
						(SELECT MANGS FROM NHANVIEN 
						WHERE TENNV =N'Vũ Thuỵ Hồng Anh')A
	WHERE NV.MANV=A.MANGS

	SELECT * FROM NHANVIEN

--VD15: Lấy ra MANGS,TENNGS của những nhân viên có tuổi > 40 
	SELECT DISTINCT NV.MANV N'MANGS',NV.TENNV N'TENNGS' 
	FROM NHANVIEN NV,
						(SELECT MANGS FROM NHANVIEN
						WHERE YEAR(GETDATE())-YEAR(NGAYSINH)>40)A
	WHERE NV.MANV=A.MANGS

--Sử dụng JOIN,LEFT JOIN,RIGHT JOIN,FULL JOIN...
--VD16: Lấy ra MANV,TENNV,TENPH của những nhân viên làm việc tại phòng phần mềm trong nước 
--Cách 1 : 
SELECT NV.MANV,NV.TENNV,PB.TENPHG
FROM NHANVIEN NV,PHONGBAN PB




--Cách 2 : 
SELECT NV.MANV,NV.TENNV,PB.TENPHG
FROM NHANVIEN NV JOIN PHONGBAN PB
ON NV.MAPHG=PB.MAPHG
WHERE PB.TENPHG = N'PHÒNG PHẦN MỀM TRONG NƯỚC'

--Hàm thống kê : MIN/MAX/COUNT/SUM/AVG
--GOM NHÓM : GROUP BY 
--VD17 : Lấy ra MANV,TENNV, tổng số giờ mà nhân viên đó đã tham gia tất cả dự án 
	SELECT NV.MANV,NV.TENNV,SUM(PC.SOGIO) N'TỔNG SỐ GIỜ'  --Thuộc tính truy xuất sogio => tạo N'TỔNG SỐ GIỜ'
	FROM NHANVIEN NV,PHANCONG PC
	WHERE NV.MANV=PC.MANV
	GROUP BY NV.MANV,NV.TENNV
--LƯU ý : khi sử dụng hàm thống kê , tại mệnh đề group by 
--phải group by hết tất cả các attribute trong mệnh đề select ngoại trừ derived attributed

--VD18: Lấy ra MADD,TENDD,TENPB,TỔNG SỐ DỰ ÁN triển khai tại địa điểm đó do phòng ban phụ trách 
	SELECT DD.MADD,DD.TENDD,PB.TENPHG,COUNT(DA.MADA)N'TỔNG SỐ DỰ ÁN'
	FROM PHONGBAN PB,DIADIEM DD,DUAN DA
	WHERE PB.MAPHG=DA.MAPHG AND DD.MADD=DA.MADD
	GROUP BY DD.MADD,DD.TENDD,PB.TENPHG

--VD19: Lấy ra MANV,TENNV, Tổng số lượng người phụ thuộc của nhân viên đó 
	SELECT NV.MANV,NV.TENNV,COUNT(NPT.MANV)N'TỔNG SỐ NGƯỜI PHỤ THUỘC'
	FROM NHANVIEN NV,NGUOIPHUTHUOC NPT
	WHERE NV.MANV=NPT.MANV
	GROUP BY NV.MANV,NV.TENNV

--VD20:Lấy ra MANV,TENPB,Tổng số lượng nhân viên làm việc tại phòng ban đó --HAVING : ĐK LỌC NÂNG CAO
--Lấy ra thông tin của phòng ban có số lượng nhân viên nhiều nhất 
	SELECT PB.MAPHG,PB.TENPHG,COUNT(NV.MANV) N'TỔNG SỐ LƯỢNG NHÂN VIÊN'
	FROM PHONGBAN PB,NHANVIEN NV
	WHERE PB.MAPHG=NV.MAPHG
	GROUP BY PB.MAPHG,PB.TENPHG
	HAVING COUNT(NV.MANV) >= ALL (
									SELECT COUNT(NV.MANV)
									FROM NHANVIEN NV
									GROUP BY NV.MAPHG
													)
--VD21: Lấy ra MADD,TENDD,tổng số lượng dự án tại địa điểm triển khai ít nhất 
	SELECT DD.MADD,DD.TENDD,COUNT(DA.TENDA) N'TỔNG SL DỰ ÁN'
	FROM DIADIEM DD,DUAN DA
	WHERE DD.MADD=DA.MADD
	GROUP BY DD.MADD,DD.TENDD
	HAVING COUNT(DA.MADA) <= ALL (
									SELECT COUNT(DA.MADA)
									FROM DUAN DA
									GROUP BY DA.MADA
	)