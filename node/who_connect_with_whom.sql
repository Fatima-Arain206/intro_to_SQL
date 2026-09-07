SELECT 
    Connector.Name AS PersonWhoKnowsAlice,
    k.ConnectionStrength,
    [Target].Name

FROM dbo.Person AS Connector, 
     dbo.Knows AS k, 
     dbo.Person AS Target
WHERE MATCH(Connector-(k)->Target)
  AND Target.Name = 'Alice Johnson';