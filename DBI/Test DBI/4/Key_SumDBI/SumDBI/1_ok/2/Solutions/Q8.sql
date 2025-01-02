create procedure CountProduct
	@OrderID nvarchar(255), @NbProducts int output
as
begin
	select @NbProducts = COUNT(distinct ProductID)
	from OrderDetails od
	group by od.OrderID
	having od.OrderID = @OrderID
end

declare @t int
exec CountProduct 'CA-2014-100391', @t output
print @t