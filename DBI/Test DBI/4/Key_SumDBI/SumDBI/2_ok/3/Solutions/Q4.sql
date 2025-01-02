select p.ProductID, p.Name as ProductName, p.Color, p.Cost, p.Price, pi.LocationID, l.Name as LocationName, pi.Shelf, pi.Bin, pi.Quantity
from Product p 
left join ProductInventory pi on p.ProductID = pi.ProductID
left join Location l on pi.LocationID = l.LocationID
where p.Color = 'Yellow' and p.Cost < 400