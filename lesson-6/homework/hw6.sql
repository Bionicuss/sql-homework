1. SELECT col1, col2
FROM (
    SELECT col1, col2 FROM InputTbl WHERE col1 < col2
    UNION
    SELECT col2, col1 FROM InputTbl WHERE col2 < col1
) AS t;
2. SELECT *
FROM TestMultipleZero
WHERE (A <> 0 OR B <> 0 OR C <> 0 OR D <> 0);
3. SELECT id, name
FROM section1
WHERE id % 2 = 1;
4. SELECT id, name
FROM section1
WHERE id = (SELECT MIN(id) FROM section1);
5. SELECT id, name
FROM section1
WHERE id = (SELECT MAX(id) FROM section1);
6. SELECT id, name
FROM section1
WHERE name LIKE 'B%';
7. SELECT Code
FROM ProductCodes
WHERE Code LIKE '%[_]%';

