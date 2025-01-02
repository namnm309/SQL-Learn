--Advanced 
--=======================================================Joins===========================================================================
--Có 4 dạng : 
	/*
		+(INNER) JOIN :(kiểu mặc định) trả về các bảng có giá trị trùng khớp 
		+LEFTR (OUTER) JOIN: Trả về tất cả các bản ghi từ bảng bên trái và các bản ghi khớp từ bảng bên phải
		+RIGHT (OUTER) JOIN: Trả về tất cả các bản ghi từ bảng bên phải và các bản ghi khớp từ bảng bên trái
		+FULL (OUTER) JOIN: Trả về tất cả các bản ghi khi có sự khớp nhau ở bảng bên trái hoặc bên phải
		+
	*/
	--INNER Join 
	SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
	FROM Products
	INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID --Join = Inner Join 

	--Left Join 
	SELECT Customers.CustomerName, Orders.OrderID
	FROM Customers
	LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

	--Right join 
	SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
	FROM Orders
	RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID

	--Full Join
	SELECT Customers.CustomerName, Orders.OrderID
	FROM Customers
	FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID

	--Self Join 
	SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
	FROM Customers A, Customers B
	WHERE A.CustomerID <> B.CustomerID
	AND A.City = B.City

--======================================================================Union============================================================================
--Dùng để kết hợp tập kết quả của hai hoặc nhiều Select câu lệnh 
--Có 2 dạng là Union ( chỉ lấy kết quả khác nhau ) và Union All (cho phép lấy trùng ) 
	--Union 
	SELECT column_name(s) FROM table1
	UNION
	SELECT column_name(s) FROM table2;

	--Union All 
	SELECT column_name(s) FROM table1
	UNION ALL
	SELECT column_name(s) FROM table2;

--=======================================================================Exists===========================================================================\
	SELECT column_name(s)
	FROM table_name
	WHERE EXISTS
	(SELECT column_name FROM table_name WHERE condition);

--========================================================================ANY,All=========================================================================
--Các toán tử ANYvà ALLcho phép bạn thực hiện so sánh giữa một giá trị cột đơn và một phạm vi các giá trị khác.
	--Any 
	SELECT ProductName
	FROM Products
	WHERE ProductID = ANY
	  (SELECT ProductID
	  FROM OrderDetails
	  WHERE Quantity = 10);

	  --ALL 
	SELECT ProductName
	FROM Products
	WHERE ProductID = ALL
	  (SELECT ProductID
	  FROM OrderDetails
	  WHERE Quantity = 10);

--============================================================INSERT INTO==================================================================
--Câu lệnh này INSERT INTO SELECTsao chép dữ liệu từ một bảng và chèn vào một bảng khác.
--Sao chép tất cả các cột từ bảng này sang bảng khác:
	INSERT INTO table2
	SELECT * FROM table1
	WHERE condition;

--Chỉ sao chép một số cột từ bảng này sang bảng khác:
	INSERT INTO table2 (column1, column2, column3, ...)
	SELECT column1, column2, column3, ...
	FROM table1
	WHERE condition;

--Chỉ định cả tên cột và giá trị cần chèn:
	INSERT INTO table_name (column1, column2, column3, ...)
	VALUES (value1, value2, value3, ...);

--Nếu bạn đang thêm giá trị cho tất cả các cột của bảng, bạn không cần phải chỉ định tên cột trong truy vấn SQL. 
--Tuy nhiên, hãy đảm bảo thứ tự của các giá trị giống với thứ tự của các cột trong bảng. Ở đây, INSERT INTOcú pháp sẽ như sau:
	INSERT INTO table_name
	VALUES (value1, value2, value3, ...);
	
--===========================================================NULL==========================================================================
--Hàm MySQL IFNULL()cho phép bạn trả về một giá trị thay thế nếu biểu thức là NULL:
	--+)Cách 1 : 
	SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0))
	FROM Products;

	--+)Cách 2 :
	SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
	FROM Products;

	SELECT 
    GR.GenreID,
    GR.GenreName,
    COALESCE(MaleMembers.NumberOfMaleMembers, 0) AS NumberOfMaleMembers,
    COALESCE(FemaleMembers.NumberOfFemaleMembers, 0) AS NumberOfFemaleMembers

	--Không thể kiểm tra giá trị NULL bằng toán tử so sánh, chẳng hạn như =, < hoặc <>.
	--Thay vào đó , chúng ta sẽ phải sử dụng các toán tử IS NULLvà IS NOT NULL.

	SELECT column_names
	FROM table_name
	WHERE column_name IS NULL;

	SELECT column_names
	FROM table_name
	WHERE column_name IS NOT NULL;


--===========================================================Min,Max==================================================================
--Hàm này MIN()trả về giá trị nhỏ nhất của cột được chọn.
	SELECT MIN(Price)
	FROM Products;

	SELECT MIN(column_name)
	FROM table_name
	WHERE condition;
--Hàm này MAX()trả về giá trị lớn nhất của cột được chọn.
	SELECT MAX(Price)
	FROM Products;

	SELECT MAX(column_name)
	FROM table_name
	WHERE condition;

--===============================================================count================================================================
--Hàm này COUNT()trả về số hàng khớp với tiêu chí đã chỉ định.
	--Tìm tổng số hàng trong Products bảng:
	SELECT COUNT(*)--Bạn có thể chỉ định tên cột thay vì ký hiệu dấu hoa thị (*).
	FROM Products;

	--Tìm số sản phẩm mà the ProductNamekhông phải là null:
	SELECT COUNT(ProductName)
	FROM Products;

--Bạn có thể bỏ qua các mục trùng lặp bằng cách sử dụng DISTINCTtừ khóa trong COUNT()hàm.
--Ở đây chúng ta sử dụng COUNT()hàm và GROUP BYmệnh đề để trả về số bản ghi cho mỗi danh mục trong bảng Sản phẩm:
--================================================================Sum===================================================================
--Hàm này SUM()trả về tổng của một cột số.
	--Trả về tổng của tất cả Quantitycác trường trong OrderDetailsbảng:
	SELECT SUM(Quantity)
	FROM OrderDetails;
	
	--Tham số bên trong SUM()hàm cũng có thể là một biểu thức.
	--Nếu chúng ta giả sử rằng mỗi sản phẩm trong OrderDetailscột có giá 10 đô la, 
	--chúng ta có thể tìm tổng thu nhập tính bằng đô la bằng cách nhân mỗi số lượng với 10:
	SELECT SUM(Quantity * 10)
	FROM OrderDetails;

--=================================================================AVG====================================================================
--Hàm này AVG()trả về giá trị trung bình của một cột số.
	--Tìm giá trung bình của tất cả sản phẩm:
	SELECT AVG(Price)
	FROM Products;
	--Lưu ý: Giá trị NULL sẽ bị bỏ qua.

	--Để liệt kê tất cả các bản ghi có giá cao hơn mức trung bình, chúng ta có thể sử dụng AVG()hàm trong truy vấn phụ:
	SELECT * FROM Products
	WHERE price > (SELECT AVG(price) FROM Products);

--=================================================================LIKE======================================================================
--Dấu phần trăm %biểu thị số không, một hoặc nhiều ký tự
	--Chọn tất cả khách hàng bắt đầu bằng chữ cái "a":
	SELECT * FROM Customers
	WHERE CustomerName LIKE 'a%';

-- Dấu gạch dưới _biểu thị một ký tự duy nhất
	--Ký _tự đại diện biểu thị một ký tự đơn.
	SELECT * FROM Customers
	WHERE city LIKE 'L_nd__';

--Trả về tất cả khách hàng bắt đầu bằng "b" và kết thúc bằng "s":

	SELECT * FROM Customers
	WHERE CustomerName LIKE 'b%s';--Blondel père et fils 	

--Trả về tất cả khách hàng bắt đầu bằng "a" và có độ dài ít nhất 3 ký tự:

	SELECT * FROM Customers
	WHERE CustomerName LIKE 'a__%';--Alfreds Futterkiste 	

--Trả về tất cả khách hàng có chữ "r" ở vị trí thứ hai:

	SELECT * FROM Customers
	WHERE CustomerName LIKE '_r%';--Around the Horn 	

--=================================================================7,8,9,10 ===========================================================
--D1
	--q7 
						with subT as (
						select top 5 *
						from Product
						order by UnitPrice desc
						union
						select top 5 *
						from Product
						order by UnitPrice asc
					)

					select *
					from subT
					order by UnitPrice desc
	--q8
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

	--q9
				create trigger InsertSubCategory 
				on [dbo].[SubCategory]
				after insert
				as
				begin
					select i.SubCategoryName, c.CategoryName
					from inserted i
					join Category c
					on i.CategoryID = c.ID
				end

				insert into SubCategory(SubCategoryName, CategoryID)
				values ('Beds', 2)
	--q10 
			insert into Category
			values ('Sports')

			declare @sportId int;

			select @sportId = ID
			from Category
			where CategoryName = 'Sports';


			insert into SubCategory(SubCategoryName, CategoryID)
			values ('Tennis', @sportId), ('Football', @sportId)	
--D2
	--q7
						with LocationProductCount as 
					(
						select pm.ModelID, pm.Name as ModelName, p.ProductID, p.Name as ProductName, COUNT(distinct pi.LocationID) as NumberOfLocations
						from ProductModel pm
						left join Product p on pm.ModelID = p.ModelID
						left join ProductInventory pi on pi.ProductID = p.ProductID
						where pm.Name like 'HL Mountain%'
						group by pm.ModelID, pm.Name, p.ProductID, p.Name
					),

					MaxLocationModel as (
						select lpc.ModelID, MAX(lpc.NumberOfLocations) as MaxNumberOfLocations
						from LocationProductCount lpc 
						group by lpc.ModelID
					)

					select lpc.*
					from LocationProductCount lpc
					join MaxLocationModel mlm on lpc.ModelID = mlm.ModelID
					and lpc.NumberOfLocations = mlm.MaxNumberOfLocations
	--q8
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

	--q9 
				create trigger tr_delete_productInventory_location
				on [dbo].[ProductInventory]
				after delete
				as
				begin
					select d.ProductID, d.LocationID, l.Name as LocationName, d.Shelf, d.Bin, d.Quantity
					from deleted d
					join Location l on d.LocationID = l.LocationID
				end

				delete from ProductInventory
				where ProductID = 1 and LocationID = 1
	--q10
					update ProductInventory
					set Quantity = 2000
					where ProductID in (
						select productID
						from Product
						where ModelID = 33
					)
--D3
	--q9
				create trigger Tr2
			on books
			after insert
			as
			begin
				select i.bookId, i.name as bookName, a.authorId, a.name as authorName, a.surname as authorSurname, t.typeId, t.name as typeName
				from inserted i
				join authors a on i.authorId = a.authorId
				join types t on i.typeId = t.typeId
			end
			go

			insert into books(bookId, name, pagecount, point,authorId,typeId) values
			(500,'book 1', 250, 10, 1, 1), (501, 'book 2', 200, 15, 2, 3)
	--q10
		update students
		set class = '9A'
		where class like '9%' and point > 900

		select *
		from students where class = '9A' and point > 900
--D4
	--q7 
				with ProQuanMay13 as (
				select pol.ProductID, SUM(pol.OrderedQuantity) as TotalOrderedQuantity, COUNT(distinct pol.PurchaseOrderID) as NumberOfPurchaserOrders
				from PurchaseOrderLines pol
				join PurchaseOrders po on pol.PurchaseOrderID = po.PurchaseOrderID
				where MONTH(po.OrderDate) = 5 and YEAR(po.OrderDate) = 2013
				group by ProductID
			)

			select p.ProductID, p.ProductName, p.UnitPrice, p.Color, pqm.TotalOrderedQuantity, pqm.NumberOfPurchaserOrders
			from Products p
			left join ProQuanMay13 pqm on p.ProductID = pqm.ProductID
			where p.UnitPrice = 18 and p.Color in ('black', 'white')
			order by pqm.TotalOrderedQuantity desc, p.ProductName asc
	--q8 
				create procedure Proc2
					@purchaseOrderID int, @totalAmount decimal(18,2) output
				as
				begin
					select @totalAmount = SUM(p.UnitPrice * pol.OrderedQuantity)
					from PurchaseOrderLines pol
					join Products p on p.ProductID = pol.ProductID
					where pol.PurchaseOrderID = @purchaseOrderID
				end

				declare @x decimal(18,2)

				exec Proc2 1, @x output
				select @x as TotalOrderedQuantity
	--q9 
				create trigger deleteSupplier
				on Suppliers 
				after delete
				as
				begin
					select d.SupplierID, d.SupplierName, sc.SupplierCategoryID, sc.SupplierCategoryName
					from deleted d
					join SupplierCategories sc on sc.SupplierCategoryID = d.SupplierCategoryID
				end
				go

				delete from Suppliers where SupplierID = 3
	--q10
				insert into Suppliers(SupplierID, SupplierName, SupplierCategoryID, DeliveryMethod, DeliveryCity, SupplierReference)
				values (14, 'ABC company', 3, 'Courier', 'New York', 'ABC123456')

--==============================================================================With==================================================
WITH CTE_Name (Column1, Column2, ...) AS (
    -- Subquery để tạo CTE
    SELECT Column1, Column2, ...
    FROM SomeTable
    WHERE Condition
    GROUP BY Column1
    ...
)
SELECT Column1, Column2, ...
FROM SomeOtherTable
JOIN CTE_Name ON SomeCondition
WHERE Condition
ORDER BY Column;
