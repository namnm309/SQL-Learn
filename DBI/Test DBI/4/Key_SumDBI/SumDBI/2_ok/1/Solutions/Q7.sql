with LocationProductCount as 
(
	select pm.ModelID, pm.Name as ModelName, p.ProductID, p.Name as ProductName, COUNT(distinct pi.LocationID) as NumberOfLocations
	from ProductModel pm
	left join Product p on pm.ModelID = p.ModelID
	left join ProductInventory pi on pi.ProductID = p.ProductID
	where pm.Name like 'HL Mountain%'
	group by pm.ModelID, pm.Name, p.ProductID, p.Name
),

MaxLocationModel as (
	select lpc.ModelID, MAX(lpc.NumberOfLocations) as MaxNumberOfLocations
	from LocationProductCount lpc 
	group by lpc.ModelID
)

select lpc.*
from LocationProductCount lpc
join MaxLocationModel mlm on lpc.ModelID = mlm.ModelID
and lpc.NumberOfLocations = mlm.MaxNumberOfLocations