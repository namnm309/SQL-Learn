create trigger tr_delete_productInventory_location
on [dbo].[ProductInventory]
after delete
as
begin
	select d.ProductID, d.LocationID, l.Name as LocationName, d.Shelf, d.Bin, d.Quantity
	from deleted d
	join Location l on d.LocationID = l.LocationID
end

delete from ProductInventory
where ProductID = 1 and LocationID = 1