/* ================================
   LESSON 14: DATE & TIME FUNCTIONS
   SQL PRACTICE TASKS
   ================================ */

-----------------------------------
-- 🟢 EASY TASKS
-----------------------------------

-- 1. Разделить имя и фамилию (TestMultipleColumns)
SELECT 
    Id,
    SUBSTRING(Name, 1, CHARINDEX(',', Name) - 1) AS Имя,
    LTRIM(SUBSTRING(Name, CHARINDEX(',', Name) + 1, LEN(Name))) AS Фамилия
FROM TestMultipleColumns;

-- 2. Найти строки, содержащие символ %
SELECT *
FROM TestPercent
WHERE Strs LIKE '%[%]%';

-- 3. Разделить строку по точке (Splitter)
SELECT 
    Id,
    value AS РазделённоеЗначение
FROM Splitter
CROSS APPLY STRING_SPLIT(Vals, '.');

-- 4. Найти строки с более чем двумя точками (testDots)
SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;

-- 5. Посчитать количество пробелов в строке (CountSpaces)
SELECT 
    texts,
    LEN(texts) - LEN(REPLACE(texts, ' ', '')) AS КоличествоПробелов
FROM CountSpaces;

-- 6. Сотрудники с зарплатой больше, чем у их менеджера (Employee)
SELECT e.Name AS Сотрудник, e.Salary AS Зарплата,
       m.Name AS Менеджер, m.Salary AS ЗарплатаМенеджера
FROM Employee e
JOIN Employee m ON e.ManagerId = m.Id
WHERE e.Salary > m.Salary;

-- 7. Стаж работы от 10 до 15 лет (Employees)
SELECT 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS СтажЛет
FROM Employees
WHERE DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 15;

-----------------------------------
-- 🟡 MEDIUM TASKS
-----------------------------------

-- 1. Дни, когда температура выше, чем вчера (weather)
SELECT w1.Id, w1.RecordDate, w1.Temperature
FROM weather w1
JOIN weather w2 ON DATEADD(DAY, 1, w2.RecordDate) = w1.RecordDate
WHERE w1.Temperature > w2.Temperature;

-- 2. Первая дата входа игрока (Activity)
SELECT 
    player_id,
    MIN(event_date) AS ПерваяДатаЛогина
FROM Activity
GROUP BY player_id;

-- 3. Третий фрукт из списка (fruits)
;WITH CTE AS (
    SELECT 
        Id,
        value,
        ROW_NUMBER() OVER (PARTITION BY Id ORDER BY (SELECT NULL)) AS rn
    FROM fruits
    CROSS APPLY STRING_SPLIT(fruit_list, ',')
)
SELECT Id, LTRIM(value) AS ТретийФрукт
FROM CTE
WHERE rn = 3;

-- 4. Этап работы сотрудника (Employees)
SELECT 
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    CASE 
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 5 AND 10 THEN 'Mid-Level'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 20 THEN 'Senior'
        ELSE 'Veteran'
    END AS ЭтапРаботы
FROM Employees;

-- 5. Извлечь число в начале строки (GetIntegers)
SELECT 
    Id,
    Vals,
    LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'x') - 1) AS НачальноеЧисло
FROM GetIntegers
WHERE Vals IS NOT NULL;

-----------------------------------
-- 🔴 DIFFICULT TASKS
-----------------------------------

-- 1. Поменять местами первые 2 символа строки (MultipleVals)
SELECT 
    Id,
    STUFF(STUFF(Vals, 1, 1, SUBSTRING(Vals, 2, 1)), 2, 1, SUBSTRING(Vals, 1, 1)) AS Переставлено
FROM MultipleVals;

-- 2. Каждую букву строки в отдельную строку
DECLARE @str VARCHAR(100) = 'sdgfhsdgfhs@121313131';

;WITH Numbers AS (
    SELECT TOP (LEN(@str)) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects
)
SELECT SUBSTRING(@str, n, 1) AS Символ
FROM Numbers;

-- 3. Устройство первого логина игрока (Activity)
SELECT player_id, device_id
FROM (
    SELECT 
        player_id,
        device_id,
        event_date,
        ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
) t
WHERE rn = 1;

-- 4. Разделить строку на буквы и числа (rtcfvty34redt)
DECLARE @str2 VARCHAR(100) = 'rtcfvty34redt';

SELECT 
    @str2 AS ИсходнаяСтрока,
    LEFT(@str2, PATINDEX('%[0-9]%', @str2 + 'x') - 1) AS Буквы,
    SUBSTRING(@str2, PATINDEX('%[0-9]%', @str2 + 'x'), LEN(@str2)) AS Числа;
