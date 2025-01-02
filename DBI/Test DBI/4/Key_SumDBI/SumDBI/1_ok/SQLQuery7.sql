--Câu 2 : 
SELECT CS.*
FROM Customer CS
WHERE CS.Segment='Consumer'AND CS.City='Arlington'

--Câu 3 : vừa 
SELECT DISTINCT CS.*
FROM Customer CS,Orders OD,OrderDetails ODD
WHERE CS.ID=OD.CustomerID 
--AND ODD.OrderID=OD.ID
AND CS.CustomerName LIKE 'B%' 
AND YEAR(OD.OrderDate)=2017 
AND MONTH(OD.OrderDate)=12
ORDER BY CS.Segment DESC,CS.CustomerName ASC

--Câu 4 : 
SELECT SC.CategoryID,SC.SubCategoryName,COUNT(P.SubCategoryID) 'NumberOfProducts'
FROM SubCategory SC,Product P
WHERE SC.ID=P.SubCategoryID 
GROUP BY SC.CategoryID,SC.SubCategoryName
HAVING COUNT(P.SubCategoryID)>=100						
ORDER BY NumberOfProducts DESC

--Câu 5 : 
SELECT  ODD.ProductID,P.ProductName,ODD.Quantity
FROM  Product P,OrderDetails ODD
WHERE P.ID=ODD.ProductID AND ODD.Quantity=(
											SELECT MAX(Quantity)
											FROM OrderDetails 							
											)

--Câu 6 : 
SELECT OD.CustomerID,CS.CustomerName,COUNT(ODD.OrderID)'NumberOfOrders'
FROM Customer CS,Orders OD,OrderDetails ODD
WHERE CS.ID=OD.CustomerID
AND OD.ID=ODD.OrderID
GROUP BY OD.CustomerID,CS.CustomerName
HAVING COUNT( ODD.OrderID) >= ALL (
	SELECT  COUNT( ODD.OrderID)
	FROM OrderDetails ODD,Customer CS,Orders OD
	WHERE CS.ID=OD.CustomerID AND ODD.OrderID=OD.ID
	GROUP BY CS.ID,OD.ID
)                                      

SELECT * FROM OrderDetails 

--Câu 7 : 








