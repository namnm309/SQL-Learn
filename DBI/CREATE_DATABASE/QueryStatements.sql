use [QL_CONGTY_SE1809]
--Câu truy vấn SQL 
--Nhóm lệnh DML 
	--VD1: Lấy ra những nhân viêm có lương >50000
	SELECT *
	FROM NHANVIEN
	WHERE LUONG > 50000
	
	--VD2: Lấy ra TENNV, LUONGNV của những nhân viên có lương > 50000
	SELECT TENNV,LUONG 
	FROM NHANVIEN
	WHERE LUONG>50000
		
	--ALIAS : đặt tên bí danh cột or bảng , cú pháp : AS , có thể viết hay ko như vd 3

	--VD3: Lấy ra TENNV 'TÊN NHÂN VIÊN', LUONG 'LƯƠNG NHÂN VIÊN'
	--của những nhân viên có lương > 80000
	SELECT TENNV AS N'TÊN NHÂN VIÊN',LUONG N'LƯƠNG NHÂN VIÊN'
	FROM NHANVIEN
	WHERE LUONG>80000

	--VD4: Lấy ra MANV,TENNV,TUOI,GIOITINH của những nhân viên có tuổi lớn hơn 40 và nữ 
	--và nhưng nhân viên tuổi > 50 và giới tính nam 
	SELECT MANV,TENNV,(YEAR(GETDATE())-YEAR(NGAYSINH)) N'Tuổi',GIOITINH
	FROM NHANVIEN
	WHERE ((YEAR(GETDATE())-YEAR(NGAYSINH))>40 AND GIOITINH='F')
	OR ((YEAR(GETDATE())-YEAR(NGAYSINH))>50 AND GIOITINH='M')

	--ORDER BY : sắp xếp ASC : tăng / DESC : giảm 
	--VD5: Lấy ra MANV,TENNV,MAPHG,LUONG của nhân viên có giới tính là nữ
	--SẮP XẾP MAPHG TĂNG,LUONG GIẢM 
	SELECT NV.MANV,NV.TENNV,NV.MAPHG,NV.LUONG
	FROM NHANVIEN NV
	WHERE NV.GIOITINH ='F'
	ORDER BY NV.MAPHG ASC,NV.LUONG DESC

	--VD6: Lấy ra MANV ,TENNV ,GIOITINH,DIACHI của những nhân viên có tên là : MAI DUY An
	SELECT NV.MANV,NV.TENNV,NV.GIOITINH,NV.DIACHI 
	FROM NHANVIEN NV
	WHERE NV.TENNV=N'MAI DUY AN'

	--VD7: Lấy ra MANV ,TENNV ,GIOITINH,DIACHI của những nhân viên có chứa chữ 'THỊ'
	SELECT NV.MANV,NV.TENNV,NV.GIOITINH,NV.DIACHI 
	FROM NHANVIEN NV
	WHERE NV.TENNV LIKE N'%thị%'
	--% là dấu đại diện cho phía trước và phía sau chữ thị là gì lấy hết
	--Lưu ý : đối với mệnh đề where trong so sánh kí tự,
		--Dùng - khi so sánh chính xác 1 đoạn kí tự 
		--Dùng like khi so sánh tương đối có chứa 1 vài / 1 nhóm kí tự 

	--VD8: Lấy ra những nhân viên làm việc tại phòng phần mềm trong nước 
	--Lưu ý : khi kết hợp 2 bảng thì phải kết cho nó nếu ko dữ liệu sẽ duplicate 
	SELECT NV.*
	FROM NHANVIEN NV,PHONGBAN PB
	WHERE NV.MAPHG=PB.MAPHG AND PB.TENPHG=N'Phòng Phần mềm trong nước'
	--Điều kiện kết bắt buộc khi khi from đến nhiều hơn 1 relation => ko thì thiếu 
	--Distinct : loại bỏ những dòng trùng nhau 

	--VD9: CHo biết những địa chỉ quê quán nào mà nhân viên đang thường trú 
	SELECT DISTINCT(NV.DIACHI) 
	FROM NHANVIEN NV 
	--Cách viết khác dùng unicon,intersect,excpet 

	--VD10: Lấy ra MANV,TENNV,GIOITINH,LUONG của những nhân viên có tên bắt đầu bằng kí tự H 
	--hoặc lương > 80k
	--Cách 1: 
	SELECT NV.MANV,NV.TENNV,NV.GIOITINH,NV.LUONG
	FROM NHANVIEN NV
	WHERE NV.TENNV LIKE N'H%' OR NV.LUONG > 80000
	--Cách 2 : 
	SELECT * FROM NHANVIEN NV WHERE NV.TENNV like N'H%'
	UNION
	SELECT * FROM NHANVIEN NV WHERE NV.LUONG>80000

	--VD11: Lấy ra tên những nhân viên ko phải người giám sát 
	SELECT MANV, TENNV FROM NHANVIEN WHERE MANV in
	(SELECT MANV FROM NHANVIEN
	EXCEPT 
	SELECT MANGS FROM NHANVIEN)

	--Subquery: truy vấn lồng có câu truy vấn con trong câu truy vấn lớn 
	--VD12: Lấy ra những nhân viên đang làm việc tại phòng có tên là Phòng Phần mềm trong nước 
	--Cách 1 : 
	SELECT NV.*
	FROM NHANVIEN NV, PHONGBAN PB 
	WHERE NV.MAPHG = PB.MAPHG
	AND PB.TENPHG = N'Phòng Phần mềm trong nước'
	--Cách 2 : 
	SELECT * FROM NHANVIEN WHERE MAPHG = 
	(SELECT PB.MAPHG FROM PHONGBAN PB
	WHERE PB.TENPHG = N'Phòng Phần mềm trong nước'
	)
	--Lưu ý : Nếu câu truy vấn con mà trả ra 1 list (nhiều hơn 1 giá trị) thì 
	--sử dụng điều kiện so sánh là IN/NOT IN/EXIST ...
	--Nếu truy vấn con trả ra 1 giá trị duy nhất thì sử dụng =,!=,>=,<=...

	--VD13: Lấy ra thông tin những dự án được triển khai tại địa điểm có tên là : "HN"
	--Viết bằng 2 cách 
	--Cách 1: 
	SELECT DA.*
	FROM DIADIEM DD, DUAN DA
	WHERE DA.MADD = 1
	and DA.MADA = DD.MADD
	--Cách 2
	SELECT * FROM DUAN WHERE MADD =
	(
	SELECT DD.MADD 
	FROM DIADIEM DD
	WHERE DD.MADD =1
	)