# TABLE: Data Modeling, Constraints, and Partitioning

## Overview
This folder focuses on table design in SQL Server: structure, constraints, sequence/identity, JSON columns, partitioning, and indexing.

## Learning objectives
- Build normalized tables with clear keys.
- Enforce integrity using PK/FK/default/computed columns.
- Understand partition function/scheme and aligned indexes.
- Read scripts and reason about maintainability/performance.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `ALIGHNED_COLUMN_STORE.sql` | ALIGHNED COLUMN STORE |
| `DEFAULT.sql` | DEFAULT |
| `DIFFERENT_PARTION.sql` | DIFFERENT PARTION |
| `GRAPH.SQL` | GRAPH.SQL |
| `NCCI.sql` | NCCI |
| `NCCIndex.sql` | NCCIndex |
| `OPEN_JSON.sql` | OPEN JSON |
| `PARTITION_FUNCTION.sql` | PARTITION FUNCTION |
| `SEQUENCE.sql` | SEQUENCE |
| `SEQUNCE_OBJECR.SQL` | SEQUNCE OBJECR.SQL |
| `SQ.sql` | SQ |
| `SQLQuery1.sql` | SQLQuery1 |
| `SQLQuery10.sql` | SQLQuery10 |
| `SQLQuery11.sql` | SQLQuery11 |
| `SQLQuery1_FOREIGN_KEY.sql` | SQLQuery1 FOREIGN KEY |
| `SQLQuery1_json_col.sql` | SQLQuery1 json col |
| `SQLQuery2.sql` | SQLQuery2 |
| `SQLQuery2_TABLE.sql` | SQLQuery2 TABLE |
| `SQLQuery2_TABLE_WITH_FORIEGN_KEY.sql` | SQLQuery2 TABLE WITH FORIEGN KEY |
| `SQLQuery2_json_value.sql` | SQLQuery2 json value |
| `SQLQuery3.sql` | SQLQuery3 |
| `SQLQuery3_FOREIGN_KEY_CHECK.sql` | SQLQuery3 FOREIGN KEY CHECK |
| `SQLQuery4.sql` | SQLQuery4 |
| `SQLQuery4_.sql` | SQLQuery4  |
| `SQLQuery5.sql` | SQLQuery5 |
| `SQLQuery6.sql` | SQLQuery6 |
| `SQLQuery7.sql` | SQLQuery7 |
| `SQLQuery8.sql` | SQLQuery8 |
| `SQLQuery9.sql` | SQLQuery9 |
| `Verfify_partition.sql` | Verfify partition |
| `add_data.sql` | add data |
| `aligned_index.sql` | aligned index |
| `combine_information.sql` | combine information |
| `computed_col.sql` | computed col |
| `create_index.sql` | create index |
| `create_table.sql` | create table |
| `create_tables.sql` | create tables |
| `drop_pk.sql` | drop pk |
| `drop_pk__.sql` | drop pk   |
| `find_pk.sql` | find pk |
| `full_anti_join.sql` | full anti join |
| `grpby.sql` | grpby |
| `in.sql` | in |
| `in_MEMORAY.sql` | in MEMORAY |
| `insert.sql` | insert |
| `intersect.sql` | intersect |
| `json.modfiy.sql` | json.modfiy |
| `json_mode.sql` | json mode |
| `json_modify.sql` | json modify |
| `json_path.sql` | json path |
| `ledger.sql` | ledger |
| `legder_tab.sql` | legder tab |
| `non_alighn_index.sql` | non alighn index |
| `partion_fun_scheme.sql` | partion fun scheme |
| `partion_schme.sql` | partion schme |
| `sequencedouble.sql` | sequencedouble |
| `sequnce_object.sql` | sequnce object |
| `split_merge.sql` | split merge |
| `sql_seq_TSQL.sql` | sql seq TSQL |
| `table_seq.sql` | table seq |
| `verify.sql` | verify |

## Key concepts
- Entity design and granularity
- Primary key vs unique key
- Foreign key integrity and cascading choices
- Partition elimination and index alignment

## Self-contained demo schema
```sql
CREATE TABLE dbo.Customer (
    CustomerId INT IDENTITY(1,1) NOT NULL,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_Customer_CreatedAt DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT PK_Customer PRIMARY KEY (CustomerId)
);
```
Line-by-line:
1. `CustomerId` uses `IDENTITY` for surrogate key generation.
2. `FirstName`/`LastName` are required (`NOT NULL`) for data quality.
3. Default timestamp prevents missing audit creation values.
4. Named PK makes troubleshooting and migrations easier.

Expected result: table is created with enforced key + default behavior.

## Practical use cases
- Multi-tenant app onboarding tables
- Sales/order transaction model
- Slowly growing historical partitions

## Common mistakes + debugging hints
- Mistake: using wide natural keys as clustered PK.
  - Hint: compare page splits and key size impact.
- Mistake: FK datatype mismatch.
  - Hint: verify `sys.columns` datatype/length pair.
- Mistake: partition function boundary confusion.
  - Hint: test boundary values exactly (`=`, `<`, `>=`).

## Performance, security, maintainability notes
- Index foreign keys used in joins.
- Use explicit column lists in all DML scripts.
- Apply least privilege; never `GRANT` to `public`.
- Name constraints/indexes deterministically for CI/CD diffs.

## DSA connection
Table indexes are commonly B-tree based structures: search is approximately `O(log n)` versus table scan `O(n)`.

## Exercises
1. Create `dbo.OrderHeader` + `dbo.OrderDetail` with PK/FK.
   - Hint: ensure FK column type exactly matches parent key.
2. Design monthly partitioning for `OrderDate`.
   - Hint: define boundaries first, then map to filegroups.
