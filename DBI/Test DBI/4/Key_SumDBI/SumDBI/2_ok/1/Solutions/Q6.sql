select ps.SubcategoryID, ps.Name as SubcategoryName, ps.Category, COUNT(*) as NumberOfProducts
from ProductSubcategory ps
join Product p on ps.SubcategoryID = p.SubcategoryID
group by ps.SubcategoryID, ps.Name, ps.Category
having COUNT (*) <= all (
			select COUNT(*)
			from Product p
			group by p.SubcategoryID
			)









