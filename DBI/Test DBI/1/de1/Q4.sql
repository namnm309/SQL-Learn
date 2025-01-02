SELECT 
    p.ProductID,
    p.Name AS ProductName,
    p.Color,
    p.Cost,
    p.Price,
    pi.LocationID,
    l.Name AS LocationName,
    pi.Shelf,
    pi.Bin,
    pi.Quantity
FROM 
    Product p
LEFT JOIN 
    ProductInventory pi ON p.ProductID = pi.ProductID
LEFT JOIN 
    Location l ON pi.LocationID = l.LocationID
WHERE 
    p.Color = 'Yellow'
    AND p.Cost < 400
ORDER BY 
    p.ProductID, pi.LocationID;