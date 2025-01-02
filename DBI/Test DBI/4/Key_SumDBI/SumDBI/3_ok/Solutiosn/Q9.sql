create trigger Tr2
on books
after insert
as
begin
	select i.bookId, i.name as bookName, a.authorId, a.name as authorName, a.surname as authorSurname, t.typeId, t.name as typeName
	from inserted i
	join authors a on i.authorId = a.authorId
	join types t on i.typeId = t.typeId
end
go

insert into books(bookId, name, pagecount, point,authorId,typeId) values
(500,'book 1', 250, 10, 1, 1), (501, 'book 2', 200, 15, 2, 3)