select o.CustomerID, c.CustomerName, COUNT(*) as NumberOfOrders
from Customer c 
join Orders o on c.ID = o.CustomerID
group by o.CustomerID, c.CustomerName
having COUNT(*) >= all (
	select COUNT(*)
	from Orders
	group by CustomerID
)
