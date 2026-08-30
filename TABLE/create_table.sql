--table
CREATE TABLE Employees(
EmployeeID int primary key  clustered identity(100,1),
EmployeeName varchar(100) not null,
EmployeEmail varchar(150) not null unique,
Department varchar(100),
HireDate Date not null,
Salary Decimal(10,2)
)

