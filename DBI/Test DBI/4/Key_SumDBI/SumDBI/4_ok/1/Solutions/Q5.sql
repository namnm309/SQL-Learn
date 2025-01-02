select sc.SupplierCategoryID, sc.SupplierCategoryName, COUNT(distinct s.SupplierID) as NumberOfSuppliers, COUNT(distinct st.PurchaseOrderID) as NumberOfPurchaseOrders
from SupplierCategories sc 
left join Suppliers s on sc.SupplierCategoryID = s.SupplierCategoryID
left join SupplierTransactions st on s.SupplierID = st.SupplierID
group by sc.SupplierCategoryID, sc.SupplierCategoryName
order by NumberOfPurchaseOrders desc, sc.SupplierCategoryName asc
