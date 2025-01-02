create trigger InsertSubCategory 
on Subcategory
after insert
as
begin
	select i.SubCategoryName, c.CategoryName
	from inserted i 
	join Category c on i.CategoryID = c.ID
end
go

insert into SubCategory(SubCategoryName, CategoryID)
values ('Beds',2)
