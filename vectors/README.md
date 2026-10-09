# Vectors in SQL Workflows

## Overview
This folder introduces vector-like storage/search ideas for AI-assisted retrieval.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `NCCI.sql` | NCCI |
| `in_memory.sql` | in memory |
| `insert.sql` | insert |
| `temporal.sql` | temporal |
| `vecotor_distance.sql` | vecotor distance |
| `vector_index.sql` | vector index |

## Conceptual example (schema may vary by SQL Server version)
> **Self-contained conceptual demo**: adapt datatype/functions to your SQL Server build.

```sql
SELECT
    d.DocumentId,
    d.Title,
    d.EmbeddingText
FROM dbo.DocumentEmbedding AS d
WHERE d.Topic = 'sql-server';
```
Line-by-line:
1. Query retrieves candidate documents and metadata.
2. Vector similarity step is implementation-dependent (engine/version).

Expected result: candidate rows ready for similarity ranking stage.

## Practical guidance
- Keep embeddings versioned.
- Store source text chunk ids for traceability.
- Rebuild vectors when model changes.

## DSA connection
Vector retrieval is nearest-neighbor search in high-dimensional space.

## Exercises
1. Design schema for chunk + embedding + source reference.
2. Add a fallback keyword filter before vector ranking.
