select p.ProductID, pi.LocationID, pi.Quantity
from Product p 
join ProductInventory pi
on p.ProductID = pi.ProductID
where pi.LocationID = 7 and pi.Quantity > 250
order by pi.Quantity desc