create trigger deleteSupplier
on Suppliers 
after delete
as
begin
	select d.SupplierID, d.SupplierName, sc.SupplierCategoryID, sc.SupplierCategoryName
	from deleted d
	join SupplierCategories sc on sc.SupplierCategoryID = d.SupplierCategoryID
end
go

delete from Suppliers where SupplierID = 3