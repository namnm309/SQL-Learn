select pph.ProductID, Price, StartDate, EndDate
from ProductPriceHistory pph
where YEAR(pph.EndDate) = 2003 and pph.Price < 100
order by pph.Price desc