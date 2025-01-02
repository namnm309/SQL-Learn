delete from ProductInventory
where ProductID in (
	select ProductID
	from Product
	where ModelID = 33
)