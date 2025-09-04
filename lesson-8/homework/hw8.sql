1. SELECT Category, COUNT(*) AS TotalProducts FROM Products
GROUP BY Category;
2. SELECT AVG(Price) AS AvgPrice_Electronics FROM Products
WHERE Category = 'Electronics';
3. SELECT * FROM Customers
WHERE City LIKE 'L%';
4. SELECT ProductName FROM Products
WHERE ProductName LIKE '%er';
5. SELECT *
FROM Customers
WHERE Country LIKE '%a';
6. SELECT MAX(Price) AS Max FROM Products;
7. SELECT ProductID, ProductName, StockQuantity,
CASE
WHEN StockQuantity < 30 THEN 'Low Stock'
ELSE 'Sufficient'
END AS SSS
FROM Products;
8. SELECT Country, COUNT(*) AS CustomersCount FROM Customers
GROUP BY Country;
9. SELECT MIN(Quantity) AS MinQuantity, MAX(Quantity) AS MaxQuantity FROM Orders;
10. SELECT DISTINCT o.CustomerID FROM Orders o
LEFT JOIN Invoices i ON o.CustomerID = i.CustomerID
WHERE MONTH(o.OrderDate) = 1 AND YEAR(o.OrderDate) = 2023 AND i.InvoiceID IS NULL;
11. SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;
12. SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
13.  SELECT YEAR(OrderDate) AS Year, AVG(TotalAmount) AS AverageOrderAmount FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY Year;
14. SELECT ProductName, Price,
CASE
WHEN Price < 100 THEN 'Low'
WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
ELSE 'High'
END AS PriceGroup
FROM Products;
15. CREATE TABLE Population_Each_Year AS
SELECT
district_id,
district_name,
SUM(CASE WHEN year = '2012' THEN population END) AS "2012",
SUM(CASE WHEN year = '2013' THEN population END) AS "2013"
FROM city_population
GROUP BY district_id, district_name;
16. SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;
17. SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';
18. CREATE TABLE Population_Each_City AS
SELECT year,
SUM(CASE WHEN district_name = 'Bektemir' THEN population END)   AS Bektemir,
SUM(CASE WHEN district_name = 'Chilonzor' THEN population END)   AS Chilonzor,
SUM(CASE WHEN district_name = 'Yakkasaroy' THEN population END)  AS Yakkasaroy FROM city_population
GROUP BY year
ORDER BY year;
19. SELECT top 3 CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC
20. 
