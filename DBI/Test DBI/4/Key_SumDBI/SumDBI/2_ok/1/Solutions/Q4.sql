select p.ProductID, p.Name as ProductName, p.Color, ps.Name as SubCategoryName, ps.Category, pch.StartDate, pch.EndDate, pch.Cost as HistoryCost
from Product p 
left join ProductCostHistory pch on p.ProductID = pch.ProductID
left join ProductSubcategory ps on ps.SubcategoryID = p.SubcategoryID
where p.Color = 'Black' and SUBSTRING(p.Name, 1, 2) = 'HL'