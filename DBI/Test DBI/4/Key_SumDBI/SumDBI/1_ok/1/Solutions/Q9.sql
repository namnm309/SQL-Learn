create trigger InsertSubCategory 
on [dbo].[SubCategory]
after insert
as
begin
	select i.SubCategoryName, c.CategoryName
	from inserted i
	join Category c
	on i.CategoryID = c.ID
end

insert into SubCategory(SubCategoryName, CategoryID)
values ('Beds', 2)