SELECT 
    EDIT_DISTANCE_SIMILARITY('color', 'colour') AS ColorSimilarity,     -- ~85
    EDIT_DISTANCE_SIMILARITY('database', 'databaes') AS TypoSimilarity, -- ~75
    EDIT_DISTANCE_SIMILARITY('SQL', 'SQL Server') AS PartialMatch,      -- ~30
    EDIT_DISTANCE_SIMILARITY('hello', 'hello') AS Exact;                -- 100