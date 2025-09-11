1.
SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId;
2.
SELECT 
    e.name AS Employee
FROM Employee e
JOIN Employee m
    ON e.managerId = m.id
WHERE e.salary > m.salary;
3.
SELECT 
    email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
4.
SELECT p1.id, p1.email, p2.id, p2.email
FROM Person p1
JOIN Person p2
  ON p1.email = p2.email
 AND p1.id > p2.id;
