SELECT
dc.name as consname,
c.name as colname
FROM sys.default_constraints as dc
join sys.all_columns as c
on dc.parent_object_id = c.object_id and dc.parent_column_id = c.column_id
where dc.parent_object_id= OBJECT_ID('DEPARTMENTS')