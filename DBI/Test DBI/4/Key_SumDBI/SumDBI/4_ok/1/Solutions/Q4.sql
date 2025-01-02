select p.ProductID, p.ProductName, s.SupplierID, s.SupplierName, p.TaxRate,p.UnitPrice, p.TypicalWeightPerUnit
from Products p 
join Suppliers s on p.SupplierID = s.SupplierID
where p.TaxRate = 15 and p.UnitPrice < 10 and p.TypicalWeightPerUnit < 0.5
order by s.SupplierName asc, p.ProductName asc