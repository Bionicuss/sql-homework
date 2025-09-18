-------------------------------------------------
-- EASY TASKS
-------------------------------------------------

-- 1. Вывести "100-Steven King"
SELECT CAST(EMPLOYEE_ID AS VARCHAR(10)) + '-' + FIRST_NAME + ' ' + LAST_NAME AS EmployeeInfo
FROM Employees
WHERE EMPLOYEE_ID = 100;

-- 2. Заменить '124' на '999' в номере телефона
UPDATE Employees
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER, '124', '999');

-- 3. Имя + длина имени, если начинается на A/J/M
SELECT FIRST_NAME AS FirstName,
       LEN(FIRST_NAME) AS NameLength
FROM Employees
WHERE FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'J%' OR FIRST_NAME LIKE 'M%'
ORDER BY FIRST_NAME;

-- 4. Общая зарплата по ManagerID
SELECT MANAGER_ID, SUM(SALARY) AS TotalSalary
FROM Employees
GROUP BY MANAGER_ID;

-- 5. Год + максимальное из (Max1, Max2, Max3)
SELECT Year1,
       (CASE 
            WHEN Max1 >= Max2 AND Max1 >= Max3 THEN Max1
            WHEN Max2 >= Max1 AND Max2 >= Max3 THEN Max2
            ELSE Max3
        END) AS MaxValue
FROM TestMax;

-- 6. Нечётные фильмы и описание <> boring
SELECT movie, description
FROM cinema
WHERE id % 2 = 1
  AND description <> 'boring';

-- 7. Сортировка, Id=0 последним
SELECT *
FROM SingleOrder
ORDER BY CASE WHEN Id = 0 THEN 1 ELSE 0 END, Id;

-- 8. Первый ненулевой из набора колонок
SELECT id,
       COALESCE(ssn, passportid, itin) AS FirstNonNull
FROM person;

-------------------------------------------------
-- MEDIUM TASKS
-------------------------------------------------

-- 1. Разбить FullName на First/Middle/Last
SELECT 
  PARSENAME(REPLACE(FullName, ' ', '.'), 3) AS FirstName,
  PARSENAME(REPLACE(FullName, ' ', '.'), 2) AS MiddleName,
  PARSENAME(REPLACE(FullName, ' ', '.'), 1) AS LastName
FROM Students;

-- 2. Заказы в Texas у клиентов, у которых был заказ в California
SELECT *
FROM Orders
WHERE CustomerID IN (
    SELECT DISTINCT CustomerID
    FROM Orders
    WHERE DeliveryState = 'CA'
)
AND DeliveryState = 'TX';

-- 3. Конкатенация строк (SQL Server 2017+)
SELECT STRING_AGG(String, ' ') AS QueryText
FROM DMLTable;

-- 4. Сотрудники, у которых в ФИО ≥3 букв 'a'
SELECT FIRST_NAME, LAST_NAME
FROM Employees
WHERE LEN(FIRST_NAME + LAST_NAME) - LEN(REPLACE(LOWER(FIRST_NAME + LAST_NAME), 'a', '')) >= 3;

-- 5. Кол-во сотрудников по отделу + % со стажем > 3 лет
SELECT DEPARTMENT_ID,
       COUNT(*) AS TotalEmployees,
       100.0 * SUM(CASE WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 3 THEN 1 ELSE 0 END) / COUNT(*) AS PctOver3Years
FROM Employees
GROUP BY DEPARTMENT_ID;

-------------------------------------------------
-- DIFFICULT TASKS
-------------------------------------------------

-- 1. Накопительная сумма по Grade (Students)
SELECT StudentID, FullName, Grade,
       SUM(Grade) OVER (ORDER BY StudentID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM Students;

-- 2. Студенты с одинаковыми днями рождения
SELECT Birthday, STRING_AGG(StudentName, ', ') AS Students
FROM Student
GROUP BY Birthday
HAVING COUNT(*) > 1;

-- 3. Сумма очков по уникальным парам игроков
SELECT 
    CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END AS Player1,
    CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END AS Player2,
    SUM(Score) AS TotalScore
FROM PlayerScores
GROUP BY CASE WHEN PlayerA < PlayerB THEN PlayerA ELSE PlayerB END,
         CASE WHEN PlayerA < PlayerB THEN PlayerB ELSE PlayerA END;

-- 4. Разделить строку 'tf56sd#%OqH' на категории
;WITH chars AS (
    SELECT value AS ch
    FROM STRING_SPLIT('tf56sd#%OqH', '')
    WHERE value <> ''  -- STRING_SPLIT иногда даёт пустые строки
)
SELECT 
  STRING_AGG(CASE WHEN ch COLLATE Latin1_General_CS_AS LIKE '[A-Z]' THEN ch END, '') AS UppercaseLetters,
  STRING_AGG(CASE WHEN ch COLLATE Latin1_General_CS_AS LIKE '[a-z]' THEN ch END, '') AS LowercaseLetters,
  STRING_AGG(CASE WHEN ch LIKE '[0-9]' THEN ch END, '') AS Numbers,
  STRING_AGG(CASE WHEN ch NOT LIKE '[0-9A-Za-z]' THEN ch END, '') AS Others
FROM chars;
