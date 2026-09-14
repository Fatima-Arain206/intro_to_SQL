-- Generate an embedding for the user's search phrase
DECLARE @searchVector VECTOR(1536);
SELECT @searchVector = AI_GENERATE_EMBEDDINGS('lightweight hiking boots' USE MODEL MyEmbeddingModel);

SELECT TOP 10 
    ProductID,
    Name,
    VECTOR_DISTANCE('cosine', @searchVector, DescriptionVector) AS Distance
FROM dbo.Products
ORDER BY Distance;