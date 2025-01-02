DELETE FROM productInventory
WHERE locationID IN (
    SELECT locationID
    FROM dbo.Location
    WHERE Name = 'Tool Crib'
);