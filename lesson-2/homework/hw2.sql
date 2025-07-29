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
