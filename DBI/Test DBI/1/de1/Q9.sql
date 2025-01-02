CREATE TRIGGER tr_insert_Product_Subcategory
ON Product
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        i.ProductID,
        i.Name AS ProductName,
        i.SubcategoryID,
        ps.Name AS SubcategoryName,
        ps.Category
    FROM 
        inserted i
    LEFT JOIN 
        ProductSubcategory ps ON i.SubcategoryID = ps.SubcategoryID;
END