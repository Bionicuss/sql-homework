1.
SELECT 
p.ProductName,
s.SupplierName
FROM Products p
CROSS JOIN Suppliers s;
2. 
select * from Departments as d
join Employees as e
on d.departmentID=e.departmentID
3. 
SELECT *
FROM Departments p
CROSS JOIN Employees  e;
4.
select * from Orders as o
right join Customers as c
on o.Customerid=c.Customerid
5.
select 
*
from Students s
cross join Courses c;
6.
SELECT P.ProductName,
    O.OrderID,
    O.OrderDate FROM Products AS P
JOIN Orders AS O
ON P.PRODUCTID = O.PRODUCTID
7.
select D.DepartmentID, D.DepartmentName,E.Name FROM Departments AS D 
JOIN Employees AS E
ON D.DepartmentID=E.DepartmentID
8. 
SELECT S.Name,S.StudentID,E.CourseID FROM Students AS S
JOIN Enrollments AS E
ON S.StudentID=E.StudentID
9.
SELECT o.OrderID, o.CustomerID, p.PaymentID, p.Amount FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID;
10.
SELECT o.OrderID, o.CustomerID, p.ProductName, p.Price FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
WHERE p.Price > 100;
11.
SELECT e.Name AS EmployeeName, d.DepartmentName FROM Employees e
CROSS JOIN Departments d
WHERE e.DepartmentID <> d.DepartmentID;
12.
SELECT o.OrderID, o.Quantity, p.ProductName, p.StockQuantity
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
WHERE o.Quantity > p.StockQuantity;
13.
SELECT c.FirstName, c.LastName, s.ProductID, s.SaleAmount
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID
WHERE s.SaleAmount >= 500;
14.
SELECT s.Name AS StudentName, c.CourseName
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;
15.
SELECT p.ProductName, s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';

16.
SELECT o.OrderID, o.TotalAmount, p.Amount AS PaidAmount
FROM Orders o
JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.Amount < o.TotalAmount;
17.
SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;
18.
SELECT p.ProductName, c.CategoryName
FROM Products p
JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');
19.
SELECT s.SaleID, c.FirstName, c.LastName, s.SaleAmount, s.SaleDate
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA';
20.
SELECT o.OrderID, c.FirstName, c.LastName, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' AND o.TotalAmount > 100;
23.
SELECT s.StudentID, s.Name
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.EnrollmentID IS NULL;
24.SELECT m.EmployeeID AS ManagerID, m.Name AS ManagerName, m.Salary AS ManagerSalary,
       e.EmployeeID AS EmployeeID, e.Name AS EmployeeName, e.Salary AS EmployeeSalary
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE m.Salary <= e.Salary;













