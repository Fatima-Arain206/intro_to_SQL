--joining multiple tables
-- use SalesDB
-- using SalesDB retrive all all list of orders.along with the related
-- customer,product and employee details
-- orderid
--customer's name
-- product name
-- sales amount
-- product price
--salesperson's name

SELECT 
	o.OrderID,
	o.Sales,
	C.FirstName as CustomersFirstName,
	C.LastName as  CustomersLastName,
	p.Product as ProductName,
	p.Price as productPrice,
	e.FirstName as SalesPersonFirstName,
	e.LastName as SalesPersonLastName
FROM
Sales.Orders as o
LEFT JOIN Sales.Customers AS C
ON O.CustomerID = C.CustomerID
LEFT JOIN Sales.Products as p
on o.ProductID = p.ProductID
LEFT JOIN Sales.Employees as e
on o.SalesPersonID = e.EmployeeID


