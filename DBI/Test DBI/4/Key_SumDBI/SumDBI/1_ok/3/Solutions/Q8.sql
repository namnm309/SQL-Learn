create procedure TotalAmount
	@OrderID nvarchar(255), @TotalAmount float output
as
begin
	select  @TotalAmount = SUM(SalePrice * Quantity * (1 - Discount))
	from OrderDetails
	group by OrderID
	having OrderID = @OrderID
end
go

declare @t float
exec TotalAMount 'CA-2014-100006', @t output 
print @t
