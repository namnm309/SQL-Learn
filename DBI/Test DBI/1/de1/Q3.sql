SELECT 
    p.ProductID,
    p.Name,
    p.Price,
    pi.Quantity,
    pi.Shelf
FROM 
    Product p
INNER JOIN 
    ProductInventory pi ON p.ProductID = pi.ProductID
WHERE 
    pi.Shelf LIKE 'A%'
ORDER BY 
    pi.Quantity DESC;