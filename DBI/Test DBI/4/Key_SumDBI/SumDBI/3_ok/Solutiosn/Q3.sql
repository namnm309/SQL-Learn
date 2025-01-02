select *
from students
where SUBSTRING(class, 1, 2) = '12' and gender = 'F' and point >= 500
order by class asc, studentId asc
