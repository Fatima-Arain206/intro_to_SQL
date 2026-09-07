--task
select 
p1.Name As Employee,
e.Name as Manger,
t.StartDate
from dbo.Person as p1 , dbo.ReportsTo as t, dbo.Person as e


where match(p1-(t)-> e)
select 
p1.Name As Manger,
e.Name as Employee,
t.StartDate
from dbo.Person as p1 , dbo.ReportsTo as t, dbo.Person as e


where match(p1<-(t)- e)



select 
p1.Name As Employee,
e.Name as Manger,
t.StartDate
from dbo.Person as p1 , dbo.ReportsTo as t, dbo.Person as e


where match(e-(t)-> p1)


select 
p1.Name As Employee,
e.Name as Manger,
t.ConnectionDate,
t.ConnectionStrength
from dbo.Person as p1 , dbo.Knows as t, dbo.Person as e


where match(p1<-(t)- e)

--Edge tables can store properties about the relationship itself, like dates, weights, or types. This is useful for temporal analysis or weighted graph algorithms.