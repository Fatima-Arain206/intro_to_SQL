-- Find products purchased by people in the same department
SELECT DISTINCT
    p1.Name AS Person,
    p1.Department,
    prod.Name AS Product
FROM dbo.Person AS p1,
     dbo.Knows AS k,
     dbo.Person AS p2,
     dbo.Purchased AS pu,
     dbo.Product AS prod
WHERE MATCH(p1-(k)->p2-(pu)->prod)
  --AND p1.Department = p2.Department;