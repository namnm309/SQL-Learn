with ProQuanMay13 as (
	select pol.ProductID, SUM(pol.OrderedQuantity) as TotalOrderedQuantity, COUNT(distinct pol.PurchaseOrderID) as NumberOfPurchaserOrders
	from PurchaseOrderLines pol
	join PurchaseOrders po on pol.PurchaseOrderID = po.PurchaseOrderID
	where MONTH(po.OrderDate) = 5 and YEAR(po.OrderDate) = 2013
	group by ProductID
)

select p.ProductID, p.ProductName, p.UnitPrice, p.Color, pqm.TotalOrderedQuantity, pqm.NumberOfPurchaserOrders
from Products p
left join ProQuanMay13 pqm on p.ProductID = pqm.ProductID
where p.UnitPrice = 18 and p.Color in ('black', 'white')
order by pqm.TotalOrderedQuantity desc, p.ProductName asc
