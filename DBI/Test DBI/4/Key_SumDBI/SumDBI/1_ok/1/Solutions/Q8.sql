create procedure TotalAmount 
	@OrderID nvarchar(255), @TotalAmount float output
as
begin
	select @TotalAmount = SUM(od.SalePrice * od.Quantity * (1 - od.Discount))
	from OrderDetails od
	where od.OrderID = @OrderID
end
go

declare @t float
exec  TotalAmount 'CA-2014-100006', @t output
print @t