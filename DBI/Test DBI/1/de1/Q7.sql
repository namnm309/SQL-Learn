WITH LocationProductQuantity AS (
    SELECT 
        l.LocationID,
        l.Name AS LocationName,
        p.ProductID,
        p.Name AS ProductName,
        pi.Quantity,
        DENSE_RANK() OVER (PARTITION BY l.LocationID ORDER BY pi.Quantity DESC) AS QuantityRank
    FROM 
        Location l
    JOIN 
        ProductInventory pi ON l.LocationID = pi.LocationID
    JOIN 
        Product p ON pi.ProductID = p.ProductID
)
SELECT 
    LocationID,
    LocationName,
    ProductID,
    ProductName,
    Quantity
FROM 
    LocationProductQuantity
WHERE 
    QuantityRank = 1
ORDER BY 
    LocationName ASC,
    ProductName DESC;