# Node + SQL Server Concepts (Graph-style Queries Included)

## Overview
This folder appears to practice SQL graph/node-style scripts and relationship matching patterns.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `SQLQuery2.sql` | SQLQuery2 |
| `SQLQuery3.sql` | SQLQuery3 |
| `friend.sql` | friend |
| `insert.sql` | insert |
| `match.sql` | match |
| `match__.sql` | match   |
| `match_diff.sql` | match diff |
| `match_re.sql` | match re |
| `pord.sql` | pord |
| `shortPath.sql` | shortPath |
| `who_connect_with_whom.sql` | who connect with whom |

## Self-contained graph-flavored query idea
```sql
SELECT
    p1.PersonName AS SourcePerson,
    p2.PersonName AS TargetPerson,
    f.RelationshipType
FROM dbo.Person AS p1
INNER JOIN dbo.Friendship AS f
    ON f.SourcePersonId = p1.PersonId
INNER JOIN dbo.Person AS p2
    ON p2.PersonId = f.TargetPersonId;
```
Line-by-line:
1. `p1` and `p2` represent source/target nodes.
2. Bridge table (`Friendship`) represents graph edges.
3. Joins materialize readable path endpoints.

Expected result: directed relationship rows.

## Use cases
- Recommendation edges
- "Who is connected to whom" queries
- Shortest path experiments

## DSA connection
This maps directly to graph traversal concepts (nodes, edges, path exploration).

## Exercises
1. Return second-degree connections (friend-of-friend).
2. Prevent duplicate undirected edge insertion.
