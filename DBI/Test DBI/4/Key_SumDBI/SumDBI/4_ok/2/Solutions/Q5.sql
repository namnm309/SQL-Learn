select s.SupplierID, s.SupplierName, COUNT(distinct pol.PurchaseOrderID) as NumberOfPurchaseOrders, SUM(pol.OrderedQuantity) as TotalOrderedQuantity
from Suppliers s
left join Products p on s.SupplierID = p.SupplierID
left join PurchaseOrderLines pol on p.ProductID = pol.ProductID
group by s.SupplierID, s.SupplierName
order by NumberOfPurchaseOrders desc, s.SupplierName asc