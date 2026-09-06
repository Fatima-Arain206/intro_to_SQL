-- Not good: Fuzzy match against entire table
SELECT * FROM Sales.Customers
WHERE EDIT_DISTANCE_SIMILARITY('John Smith', FirstName) > 70;

-- Better: Pre-filter before fuzzy matching
SELECT * FROM  Sales.Customers
WHERE FirstName LIKE 'J%'  -- First letter filter
  AND EDIT_DISTANCE_SIMILARITY('John Smith', FirstName) > 70;

-- Best: Use multiple pre-filters
SELECT * FROM  Sales.Customers
WHERE FirstName LIKE 'Jo%'
  AND LastName LIKE 'Sm%'
  AND JARO_WINKLER_DISTANCE('John', FirstName) > 0.85
  AND JARO_WINKLER_DISTANCE('Smith', LastName) > 0.85;