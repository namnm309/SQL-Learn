--Excercise 4 - SQL 11/10/2024 
--SE182871 

--41) Cho biết phòng ban nào không có người phụ thuộc. Thông tin yêu cầu: mã số phòng ban, tên phòng ban

	SELECT MAPHG, TENPHG
	FROM PHONGBAN
	WHERE MAPHG NOT IN (
		SELECT DISTINCT NV.MAPHG
		FROM NHANVIEN NV
		JOIN NGUOIPHUTHUOC NPT ON NV.MANV = NPT.MANV
	)

--42) Cho biết những nhân viên nào chưa hề tham gia vào bất kỳ dự án nào. 
--Thông tin yêu cầu: mã số, tên nhân viên, tên phòng ban của nhân viên

	SELECT NV.MANV, NV.TENNV, PB.TENPHG
	FROM NHANVIEN NV,PHONGBAN PB
	WHERE NV.MAPHG=PB.MAPHG AND NV.MANV NOT IN (
																	SELECT PC.MANV
																	FROM PHANCONG PC
																	
	)

--43) Cho biết phòng ban không có nhân viên nào tham gia (bất kỳ) dự án. Thông tin yêu cầu: mã số phòng ban, tên phòng ban

	SELECT MAPHG, TENPHG
	FROM PHONGBAN
	WHERE MAPHG NOT IN (
		SELECT NV.MAPHG
		FROM NHANVIEN NV
		WHERE NV.MANV IN (
			SELECT PC.MANV
			FROM PHANCONG PC
		)
	)


--44) Cho biết phòng ban không có nhân viên nào tham gia vào dự án có tên là ProjectA. 
--Thông tin yêu cầu: mã số phòng ban, tên phòng ban

	SELECT MAPHG, TENPHG
	FROM PHONGBAN
	WHERE MAPHG NOT IN (
		SELECT NV.MAPHG
		FROM NHANVIEN NV
		WHERE NV.MANV IN (
			SELECT PC.MANV
			FROM PHANCONG PC
			WHERE PC.MADA IN (
				SELECT DA.MADA
				FROM DUAN DA
				WHERE DA.TENDA = 'ProjectA'
			)
		)
	)


--45) Cho biết số lượng dự án được quản lý theo mỗi phòng ban. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng dự án

	SELECT PB.MAPHG, PB.TENPHG, COUNT(DA.MADA) N'Số lượng dự án'
	FROM PHONGBAN PB, DUAN DA
	WHERE PB.MAPHG = DA.MAPHG
	GROUP BY PB.MAPHG, PB.TENPHG;

--46) Cho biết phòng ban nào quản lý it dự án nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng dự án

	SELECT PB.MAPHG, PB.TENPHG, COUNT(DA.MADA) N'Số lượng dự án'
	FROM PHONGBAN PB, DUAN DA
	WHERE PB.MAPHG = DA.MAPHG
	GROUP BY PB.MAPHG, PB.TENPHG
	HAVING COUNT(DA.MADA) <= ALL (
		SELECT COUNT(DADA.MADA)
		FROM PHONGBAN P, DUAN DADA
		WHERE P.MAPHG = DADA.MAPHG
		GROUP BY P.MAPHG
	)
	
--47) Cho biết phòng ban nào quản lý nhiều dự án nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng dự án

	SELECT PB.MAPHG, PB.TENPHG, COUNT(D.MADA)  N'Số lượng dự án'
	FROM PHONGBAN PB, DUAN D
	WHERE PB.MAPHG = D.MAPHG
	GROUP BY PB.MAPHG, PB.TENPHG
	HAVING COUNT(D.MADA) >= ALL (
		SELECT COUNT(DADA.MADA)
		FROM PHONGBAN P, DUAN DADA
		WHERE P.MAPHG = DADA.MAPHG
		GROUP BY P.MAPHG
	)

--48) Cho biết những phòng ban nào có nhiểu hơn 5 nhân viên đang quản lý dự án gì. 
--Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng nhân viên của phòng ban, tên dự án quản lý

	SELECT PB.MAPHG, PB.TENPHG, COUNT(NV.MANV) N'Số lượng nhân viên', DA.TENDA
	FROM PHONGBAN PB, NHANVIEN NV, DUAN DA
	WHERE NV.MAPHG = PB.MAPHG AND DA.MAPHG = PB.MAPHG
	GROUP BY PB.MAPHG, PB.TENPHG, DA.TENDA
	HAVING COUNT(NV.MANV) >= 5


--49) Cho biết những nhân viên thuộc phòng có tên là Phòng nghiên cứu, và không có người phụ thuộc. 
--Thông tin yêu cầu: mã nhân viên,họ tên nhân viên

	SELECT NV.MANV, NV.TENNV
	FROM NHANVIEN NV
	WHERE NV.MAPHG = (SELECT MAPHG 
						FROM PHONGBAN 
						WHERE TENPHG = N'Phòng Nghiên cứu và phát triển')
	AND NV.MANV NOT IN (
		SELECT MANV FROM NGUOIPHUTHUOC
	)

--50) Cho biết tổng số giờ làm của các nhân viên, mà các nhân viên này không có người phụ thuộc. 
--Thông tin yêu cầu: mã nhân viên,họ tên nhân viên, tổng số giờ làm

	SELECT NV.MANV, NV.TENNV, SUM(PC.SOGIO) N'Tổng số giờ làm'
	FROM NHANVIEN NV, PHANCONG PC
	WHERE NV.MANV = PC.MANV 
	AND NV.MANV NOT IN (SELECT MANV FROM NGUOIPHUTHUOC)
	GROUP BY NV.MANV, NV.TENNV

--51) Cho biết tổng số giờ làm của các nhân viên, mà các nhân viên này có nhiều hơn 3 người phụ thuộc. 
--Thông tin yêu cầu: mã nhân viên,họ tên nhân viên, số lượng người phụ thuộc, tổng số giờ làm

	SELECT NV.MANV, NV.TENNV, COUNT(NPT.MANV) N'Số lượng người phụ thuộc', SUM(PC.SOGIO) N'Tổng số giờ làm'
	FROM NHANVIEN NV, NGUOIPHUTHUOC NPT, PHANCONG PC
	WHERE NV.MANV = NPT.MANV
	AND NV.MANV = PC.MANV
	GROUP BY NV.MANV, NV.TENNV
	HAVING COUNT(NPT.MANV) > 3
	
--52)Cho biết tổng số giờ làm việc của các nhân viên hiện đang dưới quyền giám sát (bị quản lý bởi) của nhân viên Mai Duy An. 
--Thông tin yêu cầu: mã nhân viên, họ tên nhân viên, tổng số giờ làm

	SELECT NV.MANV, NV.TENNV, SUM(PC.SOGIO) N'Tổng số giờ làm'
	FROM NHANVIEN NV, PHANCONG PC
	WHERE NV.MANV = PC.MANV
	AND NV.MANGS = (
					SELECT MANV 
					FROM NHANVIEN 
					WHERE TENNV = N'Mai Duy An'
					)
	GROUP BY NV.MANV, NV.TENNV
