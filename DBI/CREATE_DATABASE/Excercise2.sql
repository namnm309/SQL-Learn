
--EXCERCISE 2 - SE182871
use [QL_CONGTY_SE1809]

--CÂU 1 : Cho biết số lượng thành viên của mỗi dự án. Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên

	SELECT DA.MADA,DA.TENDA,COUNT(PC.MANV) N'SỐ LƯỢNG THANH VIÊN'
	FROM DUAN DA,PHANCONG PC
	WHERE PC.MADA=DA.MADA
	GROUP BY DA.MADA,DA.TENDA

--CÂU 2 : Cho biết tổng số giờ làm của mỗi dự án. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm

	SELECT DA.MADA,DA.TENDA, SUM(PC.SOGIO) N'TỔNG SỐ GIỜ LÀM'
	FROM DUAN DA,PHANCONG PC
	WHERE DA.MADA=PC.MADA
	GROUP BY DA.MADA,DA.TENDA

--CÂU 3 :  Cho biết dự án nào có số lượng thành viên là ít nhất. Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên

	SELECT DA.MADA, DA.TENDA, COUNT(PC.MANV) N'SỐ LƯỢNG THANH VIÊN'
	FROM DUAN DA, PHANCONG PC
	WHERE PC.MADA = DA.MADA
	GROUP BY DA.MADA, DA.TENDA
	HAVING COUNT(PC.MANV) <= ALL (
									SELECT COUNT(PC.MANV)
									FROM PHANCONG PC
									GROUP BY PC.MADA
	)


--CÂU 4 : Cho biết dự án nào có số lượng thành viên là nhiều nhất. Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên

	SELECT DA.MADA,DA.TENDA, COUNT(PC.MANV) N'SỐ LƯỢNG THÀNH VIÊN'
	FROM DUAN DA,PHANCONG PC
	WHERE PC.MADA=DA.MADA
	GROUP BY DA.MADA,DA.TENDA
	HAVING COUNT(PC.MANV) >= ALL(
								SELECT COUNT (PC.MADA)
								FROM PHANCONG PC
								GROUP BY PC.MADA
		)

--CÂU 5 : Cho biết dự án nào có tổng số giờ làm là ít nhất. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm

	SELECT DA.MADA,DA.TENDA, SUM(PC.SOGIO) N'TỔNG SỐ GIỜ LÀM'
	FROM DUAN DA,PHANCONG PC
	WHERE DA.MADA=PC.MADA
	GROUP BY DA.MADA,DA.TENDA
	HAVING SUM(PC.SOGIO) <= ALL (
								SELECT SUM(PC.SOGIO)
								FROM PHANCONG PC
								GROUP BY PC.MADA
		)

--CÂU 6 : Cho biết dự án nào có tổng số giờ làm là nhiều nhất. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm

	SELECT DA.MADA,DA.TENDA, SUM(PC.SOGIO) N'TỔNG SỐ GIỜ LÀM'
	FROM DUAN DA,PHANCONG PC
	WHERE DA.MADA=PC.MADA
	GROUP BY DA.MADA,DA.TENDA
	HAVING SUM(PC.SOGIO) >= ALL (
								SELECT SUM(PC.SOGIO)
								FROM PHANCONG PC
								GROUP BY PC.MADA
	)
