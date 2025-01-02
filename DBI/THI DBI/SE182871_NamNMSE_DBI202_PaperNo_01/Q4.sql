SELECT EV.eventID,COUNT(WF.eventID)'NumberStaff'
FROM Events EV,workFor WF
WHERE EV.eventID=WF.eventID
GROUP BY EV.eventID
HAVING COUNT(WF.eventID) >=2
