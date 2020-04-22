DROP TABLE Employees;
CREATE TABLE Employees(
	EmployeeNo INTEGER IDENTITY(1, 1),
	EmployeeName NVARCHAR(1000),
	Grade INTEGER CHECK(Grade >= 3),
	Salary FLOAT DEFAULT 100000
);
--Ràng buộc: Grade phải tối thiểu bậc 3 trở lên(CHECK = giống như "validate data")
-- Ko điền lương => mặc định là 100000
--Thêm check mà ko drop table ?? VD: EmployeeName dài ít nhất 5 ký tự
ALTER TABLE Employees ADD CONSTRAINT CK_CheckName CHECK(LEN(EmployeeName) >=5);
ALTER TABLE Employees DROP CONSTRAINT CK_CheckName;
--test constraint ?
INSERT INTO Employees(EmployeeName, Grade)
VALUES('Johnddddd', 4);

CREATE TABLE Projects(
	ProjectNo INTEGER IDENTITY(1, 2) PRIMARY KEY,
	ProjectName NVARCHAR(1000)	
);
--Hai bang nay chua co quan he(Relation) gi
INSERT INTO Employees(EmployeeName, Grade, Salary)
VALUES('John', 3, 123456),
('Hoang', 5, 223344),
('John', 6, 4878787),
('John', 4, 7888187);
INSERT INTO Projects(ProjectName)
VALUES('Java'), ('C++');

SELECT * FROM Employees;
SELECT * FROM Projects;
--Cần thông tin : nhân viên nào thuoc ve du an nao ?
--Moi (1) du an co nhieu(N) nhan vien tham gia, 
--trong thang N se chua id cua thang 1 => Foreign key(khoa ngoai)
--trong Project chua EmployeeNo
--> Tạo thêm trường EmployeeNo INTEGER cho bảng Projects
ALTER TABLE Projects ADD EmployeeNo INTEGER;
ALTER TABLE Projects ALTER COLUMN EmployeeNo INTEGER NOT NULL;
SELECT * FROM Projects;
--Thay đổi dữ liệu của EmployeeNo khỏi null
UPDATE Projects SET Projects.EmployeeNo = 1 WHERE Projects.EmployeeNo IS NULL;
--bảng Employees ?
