select s.ID as SubCategoryID, s.SubCategoryName, COUNT(*) as NumberOfProducts
from SubCategory s
join Product p on s.ID = p.SubCategoryID
group by s.ID, s.SubCategoryName
having count(*) > 100
order by NumberOfProducts desc