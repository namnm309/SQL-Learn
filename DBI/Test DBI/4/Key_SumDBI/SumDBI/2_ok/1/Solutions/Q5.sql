select p.ProductID, p.Name, SUM(Quantity) as TotalQuantity
from ProductInventory pi
join Product p on p.ProductID = pi.ProductID
group by p.ProductID, p.Name
having SUM(Quantity) > 1700
order by TotalQuantity desc
