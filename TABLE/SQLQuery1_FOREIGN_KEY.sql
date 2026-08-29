-- forign key
CREATE TABLE DEPARTMENTS(
DepartmentID int primary key identity(1,1),
DepartmentName varchar(59)
)
CREATE TABLE EMPLOYE(
EmployeID int primary key ,
Name varchar(50),
DepartmentID int,
FOREIGN KEY (DepartmentID)
REFERENCES DEPARTMENTS(DepartmentID)
)

