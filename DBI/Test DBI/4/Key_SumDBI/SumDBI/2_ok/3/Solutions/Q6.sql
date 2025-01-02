select top 1 with ties p.ProductID, p.Name, SUM(pi.Quantity) as TotalQuantity
from Product p
join ProductInventory pi on p.ProductID = pi.ProductID
group by p.ProductID, p.Name
order by TotalQuantity desc
