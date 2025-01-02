SELECT ProductID, Name, SellStartDate, SellEndDate
FROM Product
WHERE YEAR(SellEndDate) = 2003;