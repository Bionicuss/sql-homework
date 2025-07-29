1. Bulk insert это для импорта большого кол-во данных с CSV, TXT, exel,xml;
---
2.  CSV, TXT, xlsx, xml.
---
3. CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
---
4. INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
    (1, 'Laptop', 1200.00),
    (2, 'Smartphone', 800.00),
    (3, 'Printer', 250.00);
---
5. NULL - ячейка может быть пустым, NOT NULL - ячейка не может быть пустым.
---
6. ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
---
7. SELECT * FROM Products
WHERE Price > 500;
---
8. ALTER TABLE Products
ADD CategoryID INT;
---
9. CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE);
---
10. CREATE TABLE Example (
    ID INT IDENTITY(1,1) PRIMARY KEY, -- начинается с 1, увеличивается на 1
    Name VARCHAR(50));
---
11. BULK INSERT Products
FROM 'C:\download\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n', 
    FIRSTROW = 2);
---
12. ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
---
13. PRIMARY KEY	- уникальность нужно применять с Not NULL, не допускает NULL
UNIQUE KEY- УНИКАЛЬНОСТЬ КОТОРЫЙ ДОПУСКАЕТ NULL
---
14. ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);
---
15. ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;
---
16. SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price, CategoryID
FROM Products;
---
17. вязывает таблицы между собой
---
18. CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Age INT CHECK (Age >= 18));
---
19. CREATE TABLE Costumers (
    CostumersID INT IDENTITY(100, 10) PRIMARY KEY,
    Costumers Name VARCHAR(100));
20. CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    PRIMARY KEY (OrderID, ProductID));
21. 

---
22. CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE);
23. CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE);

  
