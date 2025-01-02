with MaxQuantityLocation as (
	select l.LocationID, l.Name as LocationName, MAX(Quantity) as Quanity
	from ProductInventory pi
	join Location l on pi.LocationID = l.LocationID
	group by l.LocationID, l.Name
)

select mql.LocationID, mql.LocationName, p.ProductID, p.Name as ProductName, mql.Quanity
from ProductInventory pi
join MaxQuantityLocation mql on pi.LocationID = mql.LocationID and pi.Quantity = mql.Quanity
join Product p on pi.ProductID = p.ProductID
order by mql.LocationName asc, p.Name desc