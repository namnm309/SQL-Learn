with CountBook as (
	select a.authorId, COUNT(b.bookId) as NumberOfBooks
	from authors a
	join books b on a.authorId = b.authorId
	group by a.authorId
),
CountBorrow as (
	select b.authorId, COUNT(*) as NumberOfBorrows
	from books b 
	join borrows br on b.bookId = br.bookId
	group by b.authorId
)

select a.authorId, a.name as authorName, a.surname as authorsurname, cb.NumberOfBooks, cb2.NumberOfBorrows
from CountBook cb
join CountBorrow cb2 on cb.authorId = cb2.authorId
join authors a on cb.authorId = a.authorId
order by a.authorId asc