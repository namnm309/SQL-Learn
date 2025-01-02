select od.ProductID, p.ProductName, COUNT(*) as NumberOfOrders
from OrderDetails od
join Product p on od.ProductID = p.ID
group by od.ProductID, p.ProductName
having COUNT(*) <= ALL (
	select COUNT(*)
	from OrderDetails 
	group by ProductID
)