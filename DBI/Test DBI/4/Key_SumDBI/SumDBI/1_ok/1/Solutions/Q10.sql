insert into Category
values ('Sports')

declare @sportId int;

select @sportId = ID
from Category
where CategoryName = 'Sports';


insert into SubCategory(SubCategoryName, CategoryID)
values ('Tennis', @sportId), ('Football', @sportId)