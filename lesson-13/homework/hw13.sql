1.
SELECT CONCAT(emp_id, '-', first_name, ' ', last_name) AS emp_details
FROM Employees
WHERE emp_id = 100;
2.
UPDATE Employees
SET phone_number = REPLACE(phone_number, '124', '999');
3.
SELECT first_name,
       LENGTH(first_name) AS name_length
FROM Employees
WHERE first_name LIKE 'A%' 
   OR first_name LIKE 'J%' 
   OR first_name LIKE 'M%'
ORDER BY first_name;
4.
SELECT manager_id,
       SUM(salary) AS total_salary
FROM Employees
GROUP BY manager_id;
5.
SELECT year,
       (SELECT MAX(v) 
        FROM (VALUES (Max1), (Max2), (Max3)) AS value(v)) AS max_value
FROM TestMax;
6.
SELECT *
FROM Cinema
WHERE id % 2 = 1
  AND description <> 'boring';
7.
SELECT *
FROM SingleOrder
ORDER BY CASE WHEN id = 0 THEN 1 ELSE 0 END, id;
8.
SELECT COALESCE(col1, col2, col3, col4) AS first_non_null
FROM Person;
9.
SELECT PARSENAME(REPLACE(FullName, ' ', '.'), 3) AS FirstName,
       PARSENAME(REPLACE(FullName, ' ', '.'), 2) AS MiddleName,
       PARSENAME(REPLACE(FullName, ' ', '.'), 1) AS LastName
FROM Students;
10.
SELECT o.*
FROM Orders o
WHERE o.customer_id IN (
          SELECT customer_id
          FROM Orders
          WHERE state = 'California'
      )
  AND o.state = 'Texas';
11.
SELECT STRING_AGG(value_column, ',') AS ConcatenatedValues
FROM DMLTable;
12.
SELECT *
FROM Employees
WHERE LEN(REPLACE(first_name + last_name, 'a', '')) <= LEN(first_name + last_name) - 3;
13.
SELECT department_id,
       COUNT(*) AS TotalEmployees,
       100.0 * SUM(CASE WHEN DATEDIFF(YEAR, hire_date, GETDATE()) > 3 THEN 1 ELSE 0 END) / COUNT(*) AS PercentOver3Years
FROM Employees
GROUP BY department_id;
14.
SELECT job_description,
       MAX_BY(spaceman_id, experience_years) AS MostExperienced,
       MIN_BY(spaceman_id, experience_years) AS LeastExperienced
FROM Personal
GROUP BY job_description;
15.
