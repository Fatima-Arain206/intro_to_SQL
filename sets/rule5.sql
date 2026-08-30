-- SET RULE 5 OF UNIIN
--6 RULE CORRECT COLUMNS
/* EVEN IF all rules are met and SQL show no error the RESULT MAYBE INCORRECT
INCORRECT COLUMNS SLETION LEADS TO INACURATE RESULTS
*/
SELECT 
--LastName,

FirstName,
LastName
FROM Sales.Customers
UNION
SELECT 
LastName,
FirstName
--LastName
FROM Sales.Employees

