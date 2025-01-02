--Slot 11 
--EXERCISE SQL 3
--SE182871 

USE [QL_CONGTY_SE1809]
--10) Cho biết những nơi làm việc của phòng ban có tên : Phòng Nghiên cứu và phát triển. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, tên nơi làm việc.
	
	SELECT PB.MAPHG, PB.TENPHG, DD.TENDD
	FROM PHONGBAN PB, PHANCONGDD PCDD, DIADIEM DD
	WHERE PB.MAPHG = PCDD.MAPHG
	AND PCDD.MADD = DD.MADD
	AND PB.TENPHG = N'Phòng Nghiên cứu và phát triển';

--11) Cho biết các dự án làm việc tại Tp. HCM. 
--Thông tin yêu cầu: mã dự án, tên dự án, tên phòng ban chịu trách nhiệm dự án.

	SELECT DA.MADA,DA.TENDA,PB.TENPHG
	FROM DUAN DA,PHONGBAN PB,DIADIEM DD
	WHERE DD.TENDD=N'TP Hồ Chí Minh' AND DD.MADD=DA.MADD AND DA.MAPHG=PB.MAPHG
	
--12) Cho biết những người phụ thuộc là nữ giới, của nhân viên thuộc phòng ban có tên: Phòng Nghiên cứu và phát triển . 
--Thông tin yêu cầu: tên nhân viên, tên người phụ thuộc, mối liên hệ giữa người phụ thuộc với nhân viên

	SELECT NV.TENNV,NPT.TENNPT,NPT.TENMQH
	FROM NHANVIEN NV,NGUOIPHUTHUOC NPT,PHONGBAN PB
	WHERE NPT.GIOITINH ='F' AND PB.TENPHG=N'Phòng Nghiên cứu và phát triển' AND PB.MAPHG=NV.MAPHG AND NV.MANV=NPT.MANV

--13) Cho biết những người phụ thuộc trên 18 tuổi, của nhân viên thuộc phòng ban có tên: Phòng Nghiên cứu và phát triển. 
--Thông tin yêu cầu: tên nhân viên, tên người phụ thuộc, mối liên hệ giữa người phụ thuộc với nhân viên	

	SELECT  NV.TENNV,NPT.TENNPT,NPT.TENMQH
	FROM NHANVIEN NV,NGUOIPHUTHUOC NPT,PHONGBAN PB
	WHERE NV.MANV=NPT.MANV AND (YEAR(GETDATE())-YEAR(NPT.NGAYSINH))>18  
	AND PB.MAPHG=NV.MAPHG AND PB.TENPHG=N'Phòng Nghiên cứu và phát triển'

--14) Cho biết số lượng người phụ thuộc theo giới tính. Thông tin yêu cầu: giới tính, số lượng người phụ thuộc

	SELECT NPT.GIOITINH,COUNT(NPT.TENNPT)N'SỐ LƯỢNG NGƯỜI PHỤ THUỘC'
	FROM NGUOIPHUTHUOC NPT
	GROUP BY NPT.GIOITINH
	
--15) Cho biết số lượng người phụ thuộc theo mối liên hệ với nhân viên. Thông tin yêu cầu: mối liên hệ, số lượng người phụ thuộc

	SELECT NPT.TENMQH,COUNT(NPT.MANV) N'SỐ LƯỢNG NGƯỜI PHỤ THUỘC DỰA VÀO MỐI LIÊN HỆ'
	FROM NHANVIEN NV,NGUOIPHUTHUOC NPT
	WHERE NV.MANV=NPT.MANV 
	GROUP BY NPT.TENMQH

--16) Cho biết số lượng người phụ thuộc theo mỗi phòng ban. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc

	SELECT PB.MAPHG,PB.TENPHG,COUNT(NV.MANV) N'SỐ LƯỢNG NGƯỜI PHỤ THUỘC'
	FROM PHONGBAN PB,NHANVIEN NV,NGUOIPHUTHUOC NPT
	WHERE NV.MAPHG=PB.MAPHG AND NV.MANV=NPT.MANV
	GROUP BY PB.MAPHG,PB.TENPHG 	

--17) Cho biết phòng ban nào có số lượng người phụ thuộc là ít nhất. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc

	SELECT PB.MAPHG,PB.TENPHG,COUNT(NV.MANV) N'SỐ LƯỢNG NGƯỜI PHỤ THUỘC'
	FROM PHONGBAN PB,NHANVIEN NV,NGUOIPHUTHUOC NPT
	WHERE NV.MAPHG=PB.MAPHG AND NV.MANV=NPT.MANV
	GROUP BY PB.MAPHG,PB.TENPHG 
	HAVING COUNT(NPT.MANV) <= ALL (
    SELECT COUNT(NPT.MANV)
    FROM NHANVIEN NV, NGUOIPHUTHUOC NPT
    WHERE NV.MANV = NPT.MANV
    GROUP BY NV.MAPHG
)

--18)Cho biết phòng ban nào có số lượng người phụ thuộc là nhiều nhất. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc

	SELECT PB.MAPHG,PB.TENPHG,COUNT(NV.MANV) N'SỐ LƯỢNG NGƯỜI PHỤ THUỘC'
	FROM PHONGBAN PB,NHANVIEN NV,NGUOIPHUTHUOC NPT
	WHERE NV.MAPHG=PB.MAPHG AND NV.MANV=NPT.MANV
	GROUP BY PB.MAPHG,PB.TENPHG 
	HAVING COUNT(NPT.MANV) >= ALL (
    SELECT COUNT(NPT.MANV)
    FROM NHANVIEN NV, NGUOIPHUTHUOC NPT
    WHERE NV.MANV = NPT.MANV
    GROUP BY NV.MAPHG
)

--19) Cho biết tổng số giờ tham gia dự án của mỗi nhân viên. 
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên

	SELECT NV.MANV,NV.TENNV,PB.TENPHG,SUM(PC.SOGIO) N'TỔNG SỐ GIỜ THAM GIA DỰ ÁN'
	FROM NHANVIEN NV,PHONGBAN PB,PHANCONG PC,DUAN DA
	WHERE NV.MAPHG=PB.MAPHG AND NV.MANV=PC.MANV  
	GROUP BY NV.MANV,NV.TENNV,PB.TENPHG

--20) Cho biết tổng số giờ làm dự án của mỗi phòng ban. Thông tin yêu cầu: mã phòng ban, tên phòng ban, tổng số giờ

	SELECT PB.MAPHG, PB.TENPHG, SUM(PC.SOGIO)  N'TỔNG SỐ GIỜ'
	FROM PHONGBAN PB, NHANVIEN NV, PHANCONG PC
	WHERE NV.MAPHG = PB.MAPHG AND NV.MANV = PC.MANV
	GROUP BY PB.MAPHG, PB.TENPHG

--21) Cho biết nhân viên nào có số giờ tham gia dự án là ít nhất. 
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tổng số giờ tham gia dự án

	SELECT NV.MANV, NV.TENNV, SUM(PC.SOGIO)  N'Tổng số giờ tham gia dự án'
	FROM NHANVIEN NV, PHANCONG PC
	WHERE NV.MANV = PC.MANV
	GROUP BY NV.MANV, NV.TENNV
	HAVING SUM(PC.SOGIO) <= ALL (
		SELECT SUM(PC.SOGIO)
		FROM NHANVIEN NV, PHANCONG PC
		WHERE NV.MANV = PC.MANV
		GROUP BY NV.MANV
	)

--22) Cho biết nhân viên nào có số giờ tham gia dự án là nhiều nhất. 
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tổng số giờ tham gia dự án

	SELECT NV.MANV, NV.TENNV, SUM(PC.SOGIO) N'Tổng số giờ tham gia dự án'
	FROM NHANVIEN NV, PHANCONG PC
	WHERE NV.MANV = PC.MANV
	GROUP BY NV.MANV, NV.TENNV
	HAVING SUM(PC.SOGIO) >= ALL (
		SELECT SUM(PC.SOGIO)
		FROM NHANVIEN NV, PHANCONG PC
		WHERE NV.MANV = PC.MANV
		GROUP BY NV.MANV
	)

--23) Cho biết những nhân viên nào lần đầu tiên tham gia dụ án. 
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên
	
	SELECT NV.MANV,NV.TENNV,PB.TENPHG 
	FROM NHANVIEN NV,PHONGBAN PB,PHANCONG PC
	
--24) Cho biết những nhân viên nào lần thứ hai tham gia dụ án. 
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên

	SELECT NV.MANV, NV.TENNV, COUNT(PC.MADA) N'Số lần tham gia'
	FROM NHANVIEN NV, PHANCONG PC
	WHERE NV.MANV=PC.MANV
	GROUP BY NV.MANV, NV.TENNV
	HAVING COUNT(PC.MADA) = 2


--25) Cho biết những nhân viên nào tham gia tối thiểu hai dụ án. 
--Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên

	SELECT NV.MANV, NV.TENNV, COUNT(PC.MADA) N'Số lần tham gia'
	FROM NHANVIEN NV, PHANCONG PC
	GROUP BY NV.MANV, NV.TENNV
	HAVING COUNT(PC.MADA) >= 2

--26) Cho biết số lượng thành viên của mỗi dự án. Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên
	
	SELECT DA.MADA, DA.TENDA, COUNT(PC.MANV) N'Số lượng thành viên'
	FROM DUAN DA, PHANCONG PC
	WHERE DA.MADA = PC.MADA
	GROUP BY DA.MADA, DA.TENDA


--27) Cho biết tổng số giờ làm của mỗi dự án. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm
	
	SELECT DA.MADA, DA.TENDA, SUM(PC.SOGIO) N'TỔNG SỐ GIỜ LÀM'
	FROM DUAN DA, PHANCONG PC
	WHERE DA.MADA = PC.MADA
	GROUP BY DA.MADA, DA.TENDA

--28) Cho biết dự án nào có số lượng thành viên là ít nhất. Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên

	SELECT DA.MADA, DA.TENDA, COUNT(PC.MANV) N'Số lượng thành viên'
	FROM DUAN DA, PHANCONG PC
	WHERE DA.MADA = PC.MADA
	GROUP BY DA.MADA, DA.TENDA
	HAVING COUNT(PC.MANV) <= ALL (SELECT COUNT(MANV)
								   FROM PHANCONG
								   GROUP BY MADA)


--29) Cho biết dự án nào có số lượng thành viên là nhiều nhất. Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên

	SELECT DA.MADA, DA.TENDA, COUNT(PC.MANV) N'Số lượng thành viên'
	FROM DUAN DA, PHANCONG PC
	WHERE DA.MADA = PC.MADA
	GROUP BY DA.MADA, DA.TENDA
	HAVING COUNT(PC.MANV) >= ALL (SELECT COUNT(MANV)
								   FROM PHANCONG
								   GROUP BY MADA)

--30) Cho biết dự án nào có tổng số giờ làm là ít nhất. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm

	SELECT DA.MADA, DA.TENDA, SUM(PC.SOGIO) N'Tổng số giờ làm'
	FROM DUAN DA, PHANCONG PC
	WHERE DA.MADA = PC.MADA
	GROUP BY DA.MADA, DA.TENDA
	HAVING SUM(PC.SOGIO) <= ALL (
		SELECT SUM(PC.SOGIO)
		FROM PHANCONG PC
		GROUP BY PC.MADA
									)

--31) Cho biết dự án nào có tổng số giờ làm là nhiều nhất. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm

	SELECT DA.MADA, DA.TENDA, SUM(PC.SOGIO) N'Tổng số giờ làm'
	FROM DUAN DA, PHANCONG PC
	WHERE DA.MADA = PC.MADA
	GROUP BY DA.MADA, DA.TENDA
	HAVING SUM(PC.SOGIO) >= ALL (
		SELECT SUM(PC.SOGIO)
		FROM PHANCONG PC
		GROUP BY PC.MADA
	)

--32) Cho biết số lượng phòng ban làm việc theo mỗi nơi làm việc. Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban

	SELECT DD.TENDD, COUNT(PCDD.MAPHG) N'Số lượng phòng ban'
	FROM DIADIEM DD, PHONGBAN PB,PHANCONGDD PCDD	
	WHERE PCDD.MAPHG=PB.MAPHG AND DD.MADD=PCDD.MADD
	GROUP BY DD.TENDD

--33) Cho biết số lượng chỗ làm việc theo mỗi phòng ban. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc

	SELECT PB.MAPHG,PB.TENPHG, COUNT(PCDD.MADD) N'Số lượng chỗ làm việc'
	FROM PHONGBAN PB,PHANCONGDD PCDD
	WHERE PCDD.MAPHG=PB.MAPHG
	GROUP BY PB.MAPHG,PB.TENPHG


--34) Cho biết phòng ban nào có nhiều chỗ làm việc nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc

	SELECT PB.MAPHG,PB.TENPHG, COUNT(PCDD.MADD) N'Số lượng chỗ làm việc'
	FROM PHONGBAN PB,PHANCONGDD PCDD
	WHERE PCDD.MAPHG=PB.MAPHG
	GROUP BY PB.MAPHG,PB.TENPHG
	HAVING COUNT(PCDD.MADD) >= ALL (
									SELECT COUNT(PCDD.MADD) 
									FROM PHANCONGDD PCDD	
									GROUP BY PCDD.MAPHG
									)

--35) Cho biết phòng ban nào có it chỗ làm việc nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc

	SELECT PB.MAPHG,PB.TENPHG, COUNT(PCDD.MADD) N'Số lượng chỗ làm việc'
	FROM PHONGBAN PB,PHANCONGDD PCDD
	WHERE PCDD.MAPHG=PB.MAPHG
	GROUP BY PB.MAPHG,PB.TENPHG
	HAVING COUNT(PCDD.MADD) <= ALL (
									SELECT COUNT(PCDD.MADD) 
									FROM PHANCONGDD PCDD	
									GROUP BY PCDD.MAPHG
									)

--36) Cho biết địa điểm nào có nhiều phòng ban làm việc nhất. Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban

	SELECT DD.TENDD , COUNT(DISTINCT PCDD.MAPHG) N'Số lượng phòng ban'
	FROM DIADIEM DD,PHONGBAN PB,PHANCONGDD PCDD
	WHERE DD.MADD=PCDD.MADD
	GROUP BY DD.TENDD
	HAVING COUNT(DISTINCT PCDD.MAPHG) >= ALL (
									SELECT COUNT(DISTINCT PCDD.MAPHG) 
									FROM PHANCONGDD PCDD
									GROUP BY PCDD.MADD
									) 

--37) Cho biết địa điểm nào có ít phòng ban làm việc nhất. Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban

	SELECT DD.TENDD , COUNT(DISTINCT PCDD.MAPHG) N'Số lượng phòng ban'
	FROM DIADIEM DD,PHONGBAN PB,PHANCONGDD PCDD
	WHERE DD.MADD=PCDD.MADD
	GROUP BY DD.TENDD
	HAVING COUNT(DISTINCT PCDD.MAPHG) <= ALL (
									SELECT COUNT(DISTINCT PCDD.MAPHG) 
									FROM PHANCONGDD PCDD
									GROUP BY PCDD.MADD
									)  

--38) Cho biết nhân viên nào có nhiều người phụ thuộc nhất. Thông tin yêu cầu: mã số, họ tên nhân viên, số lượng người phụ thuộc

	SELECT NV.MANV,NV.TENNV, COUNT(NPT.TENNPT) N'Số lượng người phụ thuộc'
	FROM NHANVIEN NV,NGUOIPHUTHUOC NPT
	WHERE NV.MANV=NPT.MANV
	GROUP BY NV.MANV,NV.TENNV 
	HAVING COUNT(NPT.TENNPT) >= ALL(
								SELECT COUNT(NPT.TENNPT)
								FROM NGUOIPHUTHUOC NPT
								GROUP BY NPT.MANV
	)
	
--39) Cho biết nhân viên nào có ít người phụ thuộc nhất. Thông tin yêu cầu: mã số, họ tên nhân viên, số lượng người phụ thuộc

	SELECT NV.MANV,NV.TENNV, COUNT(NPT.TENNPT) N'Số lượng người phụ thuộc'
	FROM NHANVIEN NV,NGUOIPHUTHUOC NPT
	WHERE NV.MANV=NPT.MANV
	GROUP BY NV.MANV,NV.TENNV 
	HAVING COUNT(NPT.TENNPT) <= ALL(
								SELECT COUNT(NPT.TENNPT)
								FROM NGUOIPHUTHUOC NPT
								GROUP BY NPT.MANV
	)

--40) Cho biết nhân viên nào không có người phụ thuộc. 
--Thông tin yêu cầu: mã số nhân viên, họ tên nhân viên, tên phòng ban của nhân viên
	
	SELECT NV.MANV,NV.TENNV,PB.TENPHG
	FROM NHANVIEN NV,PHONGBAN PB
	WHERE NV.MAPHG=PB.MAPHG
    AND NV.MANV NOT IN (
						SELECT NPT.MANV
						FROM NGUOIPHUTHUOC NPT
		)








