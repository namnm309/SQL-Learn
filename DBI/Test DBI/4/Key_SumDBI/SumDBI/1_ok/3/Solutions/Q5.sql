select o.*
from Orders o
where o.OrderDate >= all (
	select OrderDate
	from Orders 
)