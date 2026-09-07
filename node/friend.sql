-- Find friends of friends (2-hop connections)
SELECT DISTINCT
    Person1.Name AS Person,
    Person3.Name AS FriendOfFriend
FROM dbo.Person AS Person1,
     dbo.ReportsTo AS k1,
     dbo.Person AS Person2,
     dbo.ReportsTo AS k2,
     dbo.Person AS Person3
WHERE MATCH(Person1-(k1)->Person2-(k2)->Person3)
 --AND Person1.Name = 'Alice Johnson'
  -AND Person3.Name <> Person1.Name;  -- Exclude self