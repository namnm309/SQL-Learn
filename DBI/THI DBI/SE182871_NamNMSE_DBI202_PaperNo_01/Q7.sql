SELECT LO.Name 
FROM Locations LO,Events EV
WHERE LO.locationID=EV.locationID
GROUP BY LO.Name
HAVING COUNT(EV.locationID) >=ALL (SELECT COUNT(EV.locationID) 
									FROM Locations LO,Events EV
									WHERE LO.locationID=EV.locationID
									GROUP BY LO.locationID
									)
