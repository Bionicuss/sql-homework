
---

**1. Data**
Data refers to values stored in tables.

---

**2. Key Features of SQL Server**

1. Reliability
2. Easy integration with other Microsoft products
3. Data integrity
4. Data security
5. Versatility / Multi-functionality

---

**3. Authentication Types**
There are two types of authentication:

* Server authentication
* Local (Windows) authentication

---

**4. Create a Database**

```sql
CREATE DATABASE SchoolDB;
```

---

**5. Use the Database and Create a Table**

```sql
USE SchoolDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
```

---

**6. Definitions**

* **SQL**: Structured Query Language, used to interact with databases.
* **SQL Server**: A database server where data is stored.
* **SSMS (SQL Server Management Studio)**: A tool used to write queries and view results on the screen.

---

**7. SQL Command Categories**

* **DQL (Data Query Language)**: Used for querying data (e.g., `SELECT`)
* **DML (Data Manipulation Language)**: Used for managing data (e.g., `INSERT`, `DELETE`, `UPDATE`)
* **DDL (Data Definition Language)**: Used for defining or modifying database structures (e.g., `CREATE`, `ALTER`, `DROP`)
* **DCL (Data Control Language)**: Used for managing access rights (e.g., `GRANT`, `REVOKE`)
* **TCL (Transaction Control Language)**: Used for managing transactions (e.g., `COMMIT`, `ROLLBACK`)

---

**8. Insert Data into Table**

```sql
INSERT INTO Students (StudentID, Name, Age)
VALUES (1, 'Bobur Erkinov', 28);
```

---

**9. Restoring a Database in SSMS**
Steps to restore a database:

* Open **SSMS**
* Select the **Databases** section
* Right-click and choose **Restore Database**
* Select **Device**
* Browse and specify the path to the backup file
* Select the file
* Click **OK**

---

