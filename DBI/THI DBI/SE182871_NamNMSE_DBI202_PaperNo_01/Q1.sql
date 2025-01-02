Create table Departments (
DeptID varchar(20) Primary Key,
name nvarchar(200),
office nvarchar(100)

)

Create table Employees (
EmpCode varchar(20) Primary key,
Name nvarchar(50),
BirthDate date,
DeptID varchar(20) Foreign Key References Departments (DeptID)

)

Create table Dependants (
Number int Primary key,
Name nvarchar(50),
BirthDate date,
Role nvarchar(30),
EmpCode varchar(20) Foreign key References Employees (EmpCode)
)