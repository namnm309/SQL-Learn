select distinct od.ProductID, p.ProductName, od.Quantity
from Product p
join OrderDetails od on od.ProductID = p.ID
where od.Quantity = (
	select MAX(Quantity)
	from OrderDetails
)