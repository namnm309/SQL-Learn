select c.*
from Customer c 
join Orders o on c.ID = o.CustomerID
where SUBSTRING(c.CustomerName, 1, 1) = 'B' and MONTH(o.OrderDate) = 12 and YEAR(o.OrderDate) = 2017
order by c.Segment desc, c.CustomerName asc