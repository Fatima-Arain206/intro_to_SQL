/* Nodes (boxes) represent entities like people and products
Edges (arrows) represent relationships between nodes. 
Arrow direction indicates the relationship direction (Alice knows Bob, not necessarily Bob knows Alice).
Understand graph capabilities
The graph capabilities extend the relational model with dedicated node and edge tables. Nodes represent entities such as people, products, and locations. Edges represent relationships between them, such as "knows," "purchased," or "located in."

The key advantage of graph queries is pattern matching. Instead of writing complex multi-way joins, you express the pattern you're looking for using an ASCII style syntax:

SQL
*/
-- Traditional relational approach (multiple joins)
SELECT p1.Name, p2.Name
FROM Person AS p1
INNER JOIN dbo.Knows AS f ON p1.PersonID = f.Person1ID
INNER JOIN Person AS p2 ON f.PersonID = p2.PersonID;

-- Graph approach (pattern matching)
SELECT Person1.Name, Person2.Name
FROM Person AS Person1, -- Traditional relational approach (multiple joins)
SELECT p1.Name, p2.Name
FROM Person AS p1
INNER JOIN Friendship AS f ON p1.PersonID = f.Person1ID
INNER JOIN Person AS p2 ON f.Person2ID = p2.PersonID;

-- Graph approach (pattern matching)
SELECT Person1.Name, Person2.Name
FROM Person AS Person1, ReportsTO, Person AS Person2
WHERE MATCH(Person1-(ReportsTo)->Person2);
