select top 1 t.typeId, t.name as typeName,COUNT(bookId) as NumberOfBooks
from books b
join types t on b.typeId = t.typeId
group by t.typeId, t.name
order by NumberOfBooks desc