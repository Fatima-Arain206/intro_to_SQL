create NONclustered  index
cci_col_store 
on Employees(EmployeeID)

create nonclustered columnstore index
ncci_col_dep
on Employees(Department,Salary)-- a clustered row store index has only one non clusterd columnn store index
