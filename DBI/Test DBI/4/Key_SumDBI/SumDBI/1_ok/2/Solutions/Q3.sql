select distinct c.*
from Customer c
join Orders o on o.CustomerID = c.ID
join OrderDetails od on o.ID = od.OrderID
where SUBSTRING(c.CustomerName, 1, 1) = 'B' and MONTH(o.OrderDate) = 12 and YEAR(o.OrderDate) = 2017
order by c.Segment desc, c.CustomerName asc