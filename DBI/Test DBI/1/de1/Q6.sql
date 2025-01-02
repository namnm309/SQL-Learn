WITH ProductTotalQuantity AS (
    SELECT 
        p.ProductID,
        p.Name,
        SUM(pi.Quantity) AS TotalQuantity
    FROM 
        Product p
    LEFT JOIN 
        ProductInventory pi ON p.ProductID = pi.ProductID
    GROUP BY 
        p.ProductID, p.Name
),
MaxQuantity AS (
    SELECT MAX(TotalQuantity) AS MaxTotalQuantity
    FROM ProductTotalQuantity
)
SELECT 
    ptq.ProductID,
    ptq.Name,
    ptq.TotalQuantity
FROM 
    ProductTotalQuantity ptq
JOIN 
    MaxQuantity mq ON ptq.TotalQuantity = mq.MaxTotalQuantity
ORDER BY 
    ptq.ProductID;