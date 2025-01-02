create procedure proc_product_location 
	@productId int, @numberOfLocation int output
as
begin
	select @numberOfLocation = COUNT(distinct LocationID)
	from ProductInventory
	group by ProductID
	having ProductID = @productId
end
go

declare @x int
exec proc_product_location 1, @x output
select @x as NumberOfLocations