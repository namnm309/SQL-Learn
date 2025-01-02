create trigger InsertProduct
on Product
after insert
as
begin
	select i.ProductName, sc.SubCategoryName
	from inserted i
	join SubCategory sc on i.SubCategoryID = sc.ID
end

insert into Product(ProductName, UnitPrice, SubCategoryID)
values ('Craft paper', 0.5, 3)
 