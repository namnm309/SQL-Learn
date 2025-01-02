SELECT ST.name
FROM Events EV,workFor WF,Staffs ST,Locations LO
WHERE EV.eventID=WF.eventID AND WF.staffID=ST.staffID AND LO.locationID=EV.locationID
AND LO.Name='Convention Center'
