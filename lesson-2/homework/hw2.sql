1.CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2));
--
2.INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
    (1, 'Erkinov Bobur Baxodir ogli', 27200000.00),
    (2, 'Erkinov Nodir Baxodir ogli', 25000000.00),
    (3, 'Erkinov Nosir Baxodir ogli', 18800000.00);
--
3.UPDATE Employees
SET Salary = 50000000.25
WHERE EmpID = 1;
--
4.DELETE FROM Employees
WHERE EmpID = 2;
--
5.Delete - удаляет строки с возсожным комбанацием Where, отлично подходит чтобы удалить одну указанную ячейку,
  TRUNCATE - Может все строки без условия,
  DROP  - полностью может удалить таблицу и базу данных.
--
6.ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);
--
7.ALTER TABLE Employees
ADD Department VARCHAR(50);
--
8.ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;
--
9.CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
  --
10.DELETE FROM Employees;
--
11.CREATE TABLE TempDepartments (
    DepartmentID INT,
    DepartmentName VARCHAR(50));
INSERT INTO TempDepartments (DepartmentID, DepartmentName)
VALUES 
    (1, 'Management'),
    (2, 'Sales'),
    (3, 'IT'),
    (4, 'Finance'),
    (5, 'HR');
--
12.UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
--
13. TRUNCATE TABLE Employees;
--
14. ALTER TABLE Employees
DROP COLUMN Department;
--
15.
EXEC sp_rename 'Employees', 'StaffMembers';
--
16.DROP TABLE Departments;
--
17. CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Description VARCHAR(255)
--
18.ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);
--
19.ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;
--
20.EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';
--
21.INSERT INTO Products (ProductID, ProductName)
VALUES 
    (1, 'Laptop', 'Electronics'),
    (2, 'Office Chair', 'Furniture'),
    (3, 'Smartphone', 'Electronics'),
    (4, 'Notebook', 'Stationery'),
    (5, 'Desk Lamp', 'Electronics');
--
22.SELECT * INTO Products_Backup
FROM Products
--
23. EXEC sp_rename 'Products', 'Inventory';
--
24. ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;
--
25. CREATE TABLE Inventory_New (
    ProductCode INT IDENTITY(1000,5) PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50));
   

