--aligned col store index
create nonCLUSTERED COLUMNSTORE INDEX
IDX_COL_STORE
ON Employees(EmployeeID,HireDate)
on PS_OrderDate(HireDate)
