USE dbProductManagement;
--primary key = PK = khoa chinh
DROP TABLE Person;
CREATE TABLE Person(
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(200),
	LastName NVARCHAR(220),
	Email VARCHAR(120),
	Phone VARCHAR(100)
);
INSERT INTO Person(FirstName, LastName, Email, Phone) 
VALUES('Nguyen Duc', 'Hoang', 'hoang@gmail.com', '112233-44-33');
INSERT INTO Person(FirstName, LastName, Email, Phone) 
VALUES('Anna', 'abc', 'krisjri@gmail.com', '112233-44-99');
INSERT INTO Person(FirstName, LastName, Email, Phone) 
VALUES('Anna', 'abc', 'krisjri@gmail.com', '112233-44-99');
--Kiem tra du lieu
SELECT * FROM Person;
--Làm thế nào để "tự sinh" trường id(primary key) ?
--id ngau nhien "1215mj4meru34"
--id kieu timestamp 102124544(so ms tinh tu 01-01-1970)
--timestamp co the dung de tinh license phan mem...
--id kieu tu tang = AUTO INCREAMENT
--Nếu xóa 1 bản ghi đi, bản ghi mới nhất tính từ đâu, tại sao ?
--lớp C1912 có 1 bạn có id = 90 chuyển trường, xóa bản ghi khỏi danh sách
--có 1 bạn khác nhập học, => cấp id = 90 => hệ thống cho phép
--auto-increament luôn luôn tăng, ko giảm
--test: xoa ban ghi so 3 di
--database nao chi co 1 file ? = sqlite
DELETE FROM Person WHERE id=3;
INSERT INTO Person(FirstName, LastName, Email, Phone)
VALUES('Dao Van', 'ZX', 'ddee@gmail.com', '22353555');
CREATE TABLE Employees(
	EmployeeName VARCHAR(200) NOT NULL,
	EmployeeId INT IDENTITY(1,1),
	DateOfBirth Date,
	yearOfWorking INT
);
DELETE FROM Employees WHERE 1=1;
INSERT INTO Employees(EmployeeName, DateOfBirth, yearOfWorking)
VALUES
('Hoang', '1993/10/25', 2),
('John', '1996/8/25', 2),
('Helen', '1992/11/25', 2);
--đặt bí danh = alias cho từng trường(cột)
SELECT 
	Employees.EmployeeName AS 'Ten Nhan vien',
	Employees.DateOfBirth AS 'Ngày sinh', 
	Employees.yearOfWorking AS 'Nam cong tac'
FROM Employees 
WHERE Employees.EmployeeName = 'Hoang'
	AND Employees.yearOfWorking = 3
;
SELECT COUNT(*) AS 'Tong so nhan vien'
FROM Employees;
SELECT * FROM Employees; -- nhỡ có 1tr bản ghi ??
SELECT TOP 10* FROM Employees;