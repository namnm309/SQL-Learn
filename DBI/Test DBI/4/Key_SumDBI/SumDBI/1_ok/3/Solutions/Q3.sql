select c.ID, c.CustomerName, c.City, c.State
from Customer c
join Orders o on c.ID = o.CustomerID
where (
	(DAY(o.OrderDate) between 5 and 10) and MONTH(o.OrderDate) = 12 and YEAR(o.OrderDate) = 2017
) and (
	DATEDIFF(DAY, o.OrderDate, o.ShipDate) < 3
)
order by c.State asc, c.City desc