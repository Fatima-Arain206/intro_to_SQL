SELECT 
    EDIT_DISTANCE('color', 'colour') AS ColorVariant,     -- Returns 1
    EDIT_DISTANCE('database', 'databaes') AS Typo,        -- Returns 2
    EDIT_DISTANCE('SQL Server', 'SQL Server') AS Exact,   -- Returns 0
    EDIT_DISTANCE('hello', 'world') AS Different;         -- Returns 4