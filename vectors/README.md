# Vectors — Embeddings and Similarity Concepts in SQL Workflows

## Purpose
Vector search supports semantic matching (meaning-based, not exact keyword-based).

## Prerequisites/objectives
- Understand cosine/dot-product conceptually.
- Know when to keep vector compute in DB vs external service.

## Mental model
```mermaid
flowchart LR
  A[Text/Product] --> B[Embedding model]
  B --> C[Vector]
  C --> D[Similarity search]
  D --> E[Ranked candidates]
```

## Practical SQL-friendly pattern
Even if raw vector ops are external, SQL stores metadata and candidate sets.

```sql
CREATE TABLE dbo.ProductEmbedding
(
    ProductID INT NOT NULL,
    EmbeddingVersion NVARCHAR(50) NOT NULL,
    VectorPayload NVARCHAR(MAX) NOT NULL,
    UpdatedAt DATETIME2(0) NOT NULL,
    CONSTRAINT PK_ProductEmbedding PRIMARY KEY (ProductID, EmbeddingVersion)
);
```

### Candidate retrieval query
```sql
SELECT
    pe.ProductID,
    pe.EmbeddingVersion,
    pe.UpdatedAt
FROM dbo.ProductEmbedding AS pe
WHERE pe.EmbeddingVersion = N'v1'
ORDER BY
    pe.UpdatedAt DESC;
```
Interpretation: relational pre-filter before similarity scoring step.

## Business use case
Semantic product recommendations in catalog/search systems.

## NULL/edge/performance
- Version drift causes stale comparisons; track embedding version.
- Vector payload size can be large; separate hot metadata columns.

## Security/maintainability
- Treat embeddings as potentially sensitive derived data.
- Keep model/version lineage auditable.

## Debugging hints
- Poor search quality? verify same embedding model for query + corpus.
- Latency spikes? move heavy similarity compute to specialized engine.

## Exercises
1. Beginner: store/query embedding metadata.
2. Intermediate: add job table for async re-embedding.
3. Advanced: hybrid search combining lexical SQL filter + semantic rerank.

DSA link: nearest-neighbor search uses geometric indexing structures.

## Navigation
Previous: [json](../json/README.md)  
Next: [DSA](../DSA/README.md)
