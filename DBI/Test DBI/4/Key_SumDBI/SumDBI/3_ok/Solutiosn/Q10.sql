update students
set class = '9A'
where class like '9%' and point > 900

select *
from students where class = '9A' and point > 900