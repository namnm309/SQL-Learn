

Create table Students (
StudentID int Primary key,
Name nvarchar(50),
Address nvarchar(200),
Gender char(1)


)

Create table Classes (
ClassID int Primary key,
GroupID char(6),
courseID char(6),
NoCredits int,
Semester char(10),
[year] int


)

Create table Attend (
Date date ,
Slot int ,
Attend bit,
StudenID int Foreign key references Students(StudentID),
ClassID int Foreign key references Classes (ClassID),
constraint prk primary key (Date,Slot)
)

Create table Teachers (
TeacherID int Primary key,
Name nvarchar(50),
Address nvarchar(200),
Gender char(1),
ClassID int foreign key references Classes(ClassID)

)