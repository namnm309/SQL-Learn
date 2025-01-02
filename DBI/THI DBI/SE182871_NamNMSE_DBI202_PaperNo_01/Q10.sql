CREATE PROCEDURE proc_Staffs (@StaffID int,@NewPhone varchar(15))
as
	UPDATE Staffs SET @NewPhone=(
	SELECT ST.Phone 
	FROM Staffs ST
	WHERE ST.staffID=@StaffID 
	)
	
	
	