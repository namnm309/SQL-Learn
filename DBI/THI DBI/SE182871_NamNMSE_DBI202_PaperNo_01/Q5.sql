SELECT ALL EV.eventID,EV.name,count( WF.staffID) 'TotalStaff'
FROM Events EV,workFor WF
WHERE EV.eventID=WF.eventID 
GROUP BY EV.eventID,EV.name

--THIẾU 1 HÀNG IN RA GIÁ TRỊ 0 
	
