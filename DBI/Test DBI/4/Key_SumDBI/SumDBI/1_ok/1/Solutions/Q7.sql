with subT as (
	select top 5 *
	from Product
	order by UnitPrice desc
	union
	select top 5 *
	from Product
	order by UnitPrice asc
)

select *
from subT
order by UnitPrice desc