update ProductInventory
set Quantity = 2000
where ProductID in (
	select productID
	from Product
	where ModelID = 33
)

