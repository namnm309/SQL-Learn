with HighestOrder as (
	select top 1 pol.ProductID, COUNT(pol.PurchaseOrderID) as NumberOfPurchaseOrders
	from PurchaseOrderLines pol
	group by pol.ProductID
	order by NumberOfPurchaseOrders desc
)

select p.ProductID, p.ProductName, ho.NumberOfPurchaseOrders
from Products p 
join HighestOrder ho on p.ProductID = ho.ProductID
