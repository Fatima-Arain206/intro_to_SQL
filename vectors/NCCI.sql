select * from dbo.Person

create nonclustered COLUMNSTORE index IX_Person_ColumnStore on dbo.Person (PersonID,Department)