# Vectors

This folder introduces vector-related database concepts, which are becoming important in AI and similarity search workflows.

## Why vectors matter
A vector represents a set of numeric values used to model meaning, similarity, and patterns in high-dimensional spaces.

## Common uses
- semantic search
- recommendation systems
- AI-powered similarity search
- retrieval-augmented generation (RAG)

## SQL Server relation
SQL Server provides support for modern AI-related workflows, including vector features and similarity use cases. This folder introduces the idea that SQL is no longer only about rows and tables; it can also support advanced AI patterns.

## Example idea
```sql
-- Conceptual example only
SELECT TOP 10 *
FROM dbo.Documents
ORDER BY VECTOR_DISTANCE(Embedding, @QueryVector) ASC;
```

## Practice tasks
1. Understand how embeddings differ from traditional keys.
2. Learn why similarity search is not the same as exact SQL matching.
3. Explore how SQL can support AI-driven retrieval workflows.

This folder is part of the future-facing side of database learning.
