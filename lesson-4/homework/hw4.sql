1. SELECT TOP 5 * 
FROM Employees;
----
2. SELECT * 
FROM Employees 
LIMIT 5;
---
3. SELECT DISTINCT Category 
FROM Products;
---
4. SELECT * 
FROM Customers 
WHERE FirstName LIKE 'A%';
---
5. SELECT * 
FROM Products 
ORDER BY Price ASC;
-----
6. SELECT * FROM Employees 
WHERE Salary >= 60000 AND Department = 'HR';
----
7. SELECT 
    EmployeeID,
    FirstName,
    LastName,
    ISNULL(Email, 'No') AS Email
FROM Employees;
---
8. SELECT * FROM Products 
WHERE Price BETWEEN 50 AND 100;
----
9. SELECT DISTINCT Category, ProductName 
FROM Products;
----
10. SELECT DISTINCT Category, ProductName 
FROM Products 
ORDER BY ProductName DESC;
