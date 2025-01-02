select o.CustomerID, c.CustomerName, COUNT(*) as NumberOfOrders
from Customer c 
join Orders o on c.ID = o.CustomerID
group by o.CustomerID, c.CustomerName 
having COUNT(*) >= ALL (
					select COUNT(*)W
					from Orders o
					group by o.CustomerID
					)