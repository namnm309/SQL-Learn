select p.SubCategoryID, s.SubCategoryName, COUNT(*) as NumberOfProducts
from SubCategory s
join Product p on p.SubCategoryID = s.ID
group by p.SubCategoryID, s.SubCategoryName
having COUNT(*) > 100
order by NumberOfProducts desc