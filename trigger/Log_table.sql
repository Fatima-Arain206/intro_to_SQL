-- create a log table
create table Sales.OrderInsertLog(
	LogID int primary key identity(1,1),
	OrderID int,
	LoggedAT DateTime default getDate()
	);
