-- Find who reports to whom
SELECT 
    Employee.Name AS Employee,
    Manager.Name AS Manager,
    r.StartDate
FROM dbo.Person AS Employee, 
     dbo.ReportsTo AS r, 
     dbo.Person AS Manager
WHERE MATCH(Employee-(r)->Manager);
