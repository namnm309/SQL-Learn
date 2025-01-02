select distinct od.ProductID, p.ProductName, od.Quantity
from Product p 
join OrderDetails od on p.ID = od.ProductID
where od.Quantity = (
	select MAX(quantity)
	from OrderDetails
)
