select s.SupplierID, s.SupplierName, COUNT(distinct po.PurchaseOrderID) as NumberOfPurchaseOrders, COUNT(distinct st.SupplierTransactionID) as NumberOfTransactions, COUNT(distinct pol.ProductID) as NumberOfProducts
from Suppliers s 
left join PurchaseOrders po on s.SupplierID = po.SupplierID and MONTH(po.OrderDate) = 1 and YEAR(po.OrderDate) = 2013
left join SupplierTransactions st on s.SupplierID = st.SupplierID and MONTH(st.TransactionDate) = 1  and YEAR(st.TransactionDate) = 2013
left join PurchaseOrderLines pol on po.PurchaseOrderID = pol.PurchaseOrderLineID and MONTH(po.OrderDate) = 1 and YEAR(po.OrderDate) = 2013
group by s.SupplierID, s.SupplierName
order by NumberOfPurchaseOrders desc,s.SupplierName asc
