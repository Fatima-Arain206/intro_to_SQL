-- Create graph tables
CREATE TABLE Person AS NODE;
CREATE TABLE Manages AS EDGE;
CREATE TABLE Knows AS EDGE;

-- Insert nodes
INSERT INTO Person VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

-- Insert edges (relationships)
INSERT INTO Manages VALUES (1, 2), (2, 3);

-- Query relationships
SELECT Person1.name, Person2.name 
FROM Person AS Person1, Manages, Person AS Person2
WHERE MATCH (Person1-(Manages)->Person2)
AND Person1.id = 1;