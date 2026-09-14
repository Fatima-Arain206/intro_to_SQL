 -- Create a user without UNMASK permission
 CREATE USER MaskedViewer WITHOUT LOGIN;
 GRANT SELECT ON dbo.Employees TO MaskedViewer;
 GRANT SELECT ON dbo.Customers TO MaskedViewer;

 -- Query as the masked user (data appears masked)
 EXECUTE AS USER = 'MaskedViewer';
 SELECT FirstName, LastName, Email, SSN, Salary FROM dbo.Employees;
 SELECT CompanyName, ContactName, Phone, CreditCardNumber FROM dbo.Customers;
 REVERT;

 -- Query as admin (data appears unmasked)
 SELECT FirstName, LastName, Email, SSN, Salary FROM dbo.Employees;