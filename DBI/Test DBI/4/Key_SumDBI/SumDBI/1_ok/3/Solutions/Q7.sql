with t as (
	select top 5. SubCategoryID, COUNT(*) as NumberOfProducts
	from Product
	group by (SubCategoryID)
	order by COUNT(*) desc
	union 
	select top 5. SubCategoryID, COUNT(*) as NumberOfProducts
	from Product
	group by (SubCategoryID)
	order by COUNT(*) asc
)

select *
from t 
order by t.NumberOfProducts desc