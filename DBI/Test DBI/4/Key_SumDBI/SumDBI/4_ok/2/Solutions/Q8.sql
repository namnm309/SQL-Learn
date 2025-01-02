create procedure Proc2 
	@purchaseOrderID int, @totalAmount decimal(18,2) output
as
begin
	select @totalAmount = SUM(p.UnitPrice * pol.OrderedQuantity)
	from Products p
	join PurchaseOrderLines pol on p.ProductID = pol.ProductID
	where pol.PurchaseOrderID = @purchaseOrderID
end
go

declare @x decimal(18,2)
exec Proc2 1, @x output
select @x as TotalOrderedQuantity
