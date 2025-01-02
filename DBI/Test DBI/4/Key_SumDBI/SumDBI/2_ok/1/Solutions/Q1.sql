create table Employees (
	EmpID int primary key,
	name nvarchar(50),
	salary money
)

create table Managers (
	EmpID int primary key,
	bonus money,
	foreign key (EmpID) references Employees (EmpID)
)

create table Projects (
	ProjectID int primary key,
	EmpID int,
	name nvarchar(200),
	foreign key (EmpID) references Managers (EmpID)
)

create table Works (
		EmpID int,
		ProjectID int,
		hours int,
		primary key (EmpID, ProjectID),
		foreign key (EmpID) references Employees (EmpID),
		foreign key (ProjectID) references Projects (ProjectID)
)