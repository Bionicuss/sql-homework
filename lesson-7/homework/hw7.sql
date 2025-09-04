1. SELECT MIN(Price) AS MinPrice FROM Products;
2. SELECT MAX(Salary) AS MaxSalary FROM Employees;
3. SELECT COUNT(*) AS TotalCustomers FROM Customers;
4. SELECT COUNT(DISTINCT Category) AS U FROM Products;
5. SELECT SUM(Amount) AS Totals FROM Sales
WHERE ProductID = 7;
6. SELECT AVG(Age) AS AverageAge
FROM Employees;
7. SELECT DepartmentName, COUNT(*) AS EmployeeCount FROM Employees
GROUP BY DepartmentName;
8. SELECT Category, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM Products GROUP BY Category;
9. SELECT CustomerID, SUM(Amount) AS TotalSales FROM Sales
GROUP BY CustomerID;
10. SELECT DepartmentName, COUNT(*) AS EmployeeCount FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;
11. SELECT p.Category, SUM(s.Amount) AS TotalSales, AVG(s.Amount) AS AvgSales FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;
12. SELECT COUNT(*) AS HREmployees FROM Employees
WHERE DepartmentName = 'HR';
13. SELECT DepartmentName, MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary FROM Employees
GROUP BY DepartmentName;
14. SELECT DepartmentName, AVG(Salary) AS AvgSalary FROM Employees
GROUP BY DepartmentName;
15. SELECT DepartmentName, AVG(Salary) AS AvgSalary, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName;
16. SELECT Category, AVG(Price) AS AvgPrice FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;
17. SELECT YEAR(SaleDate) AS SaleYear, SUM(Amount) AS TotalSales FROM Sales
GROUP BY YEAR(SaleDate)
ORDER BY SaleYear;
18. SELECT CustomerID, COUNT(*) AS OrdersCount FROM Sales
GROUP BY CustomerID
HAVING COUNT(*) >= 3;
19. SELECT DepartmentName, SUM(Salary) AS TotalSalaryExpenses FROM Employees
GROUP BY DepartmentName
HAVING SUM(Salary) > 60000;
20. SELECT Category, AVG(Price) AS AvgPrice FROM Products
GROUP BY Category
HAVING AVG(Price) > 150;
21. SELECT CustomerID, SUM(Amount) AS TotalSales FROM Sales
GROUP BY CustomerID
HAVING SUM(Amount) > 1500;
22. SELECT DepartmentName, SUM(Salary) AS TotalSalary, AVG(Salary) AS AvgSalary FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000;
23. SELECT o.CustomerID, SUM(o.Freight) AS TotalFreightOver50, MIN(od.UnitPrice * od.Quantity) AS LeastPurchase FROM Sales.Orders o
JOIN Sales.OrderDetails od
ON o.OrderID = od.OrderID
WHERE o.Freight > 50
GROUP BY o.CustomerID;
24. 
