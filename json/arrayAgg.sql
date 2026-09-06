SELECT 
    pc.Department AS Category,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'id': pc.ManagerID,
            'departmentname': pc.Department,
            'price': pc.Salary
        )
    ) AS details
FROM Sales.Employees AS pc
--INNER JOIN Sales.Products AS p
   -- ON pc.EmployeeID = p.ProductID
GROUP BY pc.Department, pc.FirstName;