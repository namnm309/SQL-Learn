select br.borrowId, br.takenDate, b.bookId, b.name as bookName, b.typeId, t.name as typeName
from borrows br
join books b on br.bookId = b.bookId
join types t on t.typeId = b.typeId
where MONTH(br.takenDate) = 3 and YEAR(br.takenDate) = 2017 and t.name in ('Diaries', 'Art')
order by t.name desc, br.borrowId asc