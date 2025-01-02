with subT as (
	select top 1 pol.ProductID, COUNT(pol.PurchaseOrderID) as NumberOfPurchaseOrders
	from PurchaseOrderLines pol
	group by pol.ProductID
	order by NumberOfPurchaseOrders desc 
)

select st.ProductID, p.ProductName, st.NumberOfPurchaseOrders
from subT st 
join Products p on st.ProductID = p.ProductID