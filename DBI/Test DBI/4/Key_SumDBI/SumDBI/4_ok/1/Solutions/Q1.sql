create table Teams (
	TeamCode varchar(15) primary key,
	Name nvarchar(50),
	Address nvarchar(200),
)

create table Players (
	SSN varchar(15) primary key,
	Name nvarchar(100),
	TeamCode varchar(15),
	foreign key (TeamCode) references Teams (TeamCode)
)

create table Games (
	GameCode varchar(15) primary key,
	Date Date,
	Time time
)

create table Participate (
	TeamCode varchar(15),
	GameCode varchar(15),
	Result int,
	primary key (TeamCode, GameCode),
	foreign key (TeamCode) references Teams (TeamCode),
	foreign key (GameCode) references Games (GameCode)
)