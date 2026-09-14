BEGIN TRANSACTION;

;WITH ProductsToInsert AS
(
    SELECT TOP (100)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS ProductNumber
    FROM sys.all_objects
)
INSERT INTO dbo.Products
(
    ProductID,
    Name,
    Description,
    DescriptionVector
)
SELECT
    ProductNumber,
    CONCAT(N'Product ', ProductNumber),
    CONCAT(
        N'This is the description for product ',
        ProductNumber,
        N'. It is suitable for testing vector search.'
    ),
    AI_GENERATE_EMBEDDINGS(
        CONCAT(
            N'This is the description for product ',
            ProductNumber,
            N'. It is suitable for testing vector search.'
        )
        USE MODEL MyEmbeddingModel
    )
FROM ProductsToInsert;

COMMIT TRANSACTION;