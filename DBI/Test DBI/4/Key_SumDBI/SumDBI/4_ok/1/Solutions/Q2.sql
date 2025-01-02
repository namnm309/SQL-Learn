select s.SupplierID, s.SupplierName, s.SupplierCategoryID, s.DeliveryMethod, s.DeliveryCity
from Suppliers s
where s.SupplierCategoryID = 2