-- Create graph tables
CREATE TABLE PERSON
(
    personID int primary key identity,
    personName varchar(20) not null,
    Department varchar(60) not null
) AS NODE;

 ALTER TABLE PERSON_MANAGER
ADD RelationType varchar(30) not null


-- Insert data into node table
INSERT INTO PERSON (personName, Department)
VALUES
    ('Ali', 'IT'),
    ('Ayesha', 'HR'),
    ('Hassan', 'Finance'),
    ('Usman', 'IT');

-- Insert data into edge table
INSERT INTO PERSON_MANAGER ($from_id, $to_id, MANAGERID, RelationType)
VALUES
    ((SELECT $node_id FROM PERSON WHERE personName = 'Ali'),
     (SELECT $node_id FROM PERSON WHERE personName = 'Ayesha'),
     1,
     'knows'),
    ((SELECT $node_id FROM PERSON WHERE personName = 'Ali'),
     (SELECT $node_id FROM PERSON WHERE personName = 'Hassan'),
     2,
     'knows'),
    ((SELECT $node_id FROM PERSON WHERE personName = 'Ayesha'),
     (SELECT $node_id FROM PERSON WHERE personName = 'Usman'),
     3,
     'manager_of');

-- View data
SELECT 
    P1.personID,
    P1.personName AS FROM_PERSON,
    M.RelationType ,
    P2.personName AS TO_PERSON


 FROM PERSON AS P1, PERSON_MANAGER AS M,
 PERSON AS P2
 WHERE MATCH(P1 -(M)-> P2)
 ;
---
SELECT 
    P1.personID,
    P1.personName AS TOpERSON,
    M.RelationType ,
    P2.personName AS FROM_PERSON


 FROM PERSON AS P1, PERSON_MANAGER AS M,
 PERSON AS P2
 WHERE MATCH(P1 <-(M)- P2)