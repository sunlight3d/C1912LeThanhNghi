USE dbProductManagement;
--Quan ly diem sinh vien

IF NOT EXISTS(SELECT * FROM sysobjects WHERE name='tblStudent')
	CREATE TABLE tblStudent(
		studentId INT IDENTITY(10, 2),
		name VARCHAR(300),
		email VARCHAR(300),
		math FLOAT,
		physics FLOAT,
		chemistry FLOAT
	);
INSERT INTO tblStudent(name, email, math, physics, chemistry)
VALUES('Alan Turing', 'aa@gmail.com', 7.2, 9.7, 2.3),
('John', 'john@gmail.com', 6.2, 5.7, 4.3),
('Binnnn', 'john@gmail.com', 9.2, 9.7, 8.3)
--chi lấy ra tên và điểm 3 môn
SELECT 
	CONCAT(tblStudent.name, ' - ', tblStudent.email) as information, 
	tblStudent.math, 
	tblStudent.physics, 
	tblStudent.chemistry,
	tblStudent.math+tblStudent.physics+tblStudent.chemistry as totalMark
FROM tblStudent
ORDER BY totalMark DESC;--descending
-- ko nen drop table
--VD quan hệ 1 -1 : 1 Person có 1 Passport
--VD Passport chỉ có 1 trường(attribute, field) => Gộp bảng Passport và Person lam 1
-- Mot database => chi co cac quan he 1-1, 1-n, n-1,
-- Neu co quan he n-n => phai tach thanh 2 quan he 1-n
--ví dụ về 1 table, ko có trường id để làm khóa chính => dùng vài trường khác gộp lại để làm khóa chính
DROP TABLE tblOrder;
--Tạo bảng xong rồi, thêm dữ liệu rồi, nhớ ra chưa đặt Primary Key(khoa chinh)
--Drop table => ko ổn(do dữ liệu nhiều quá, team đang dùng)
--Sửa(alter) cấu trúc bảng 
CREATE TABLE tblOrder(
	customerId INT,
	productId INT,
	description VARCHAR(300),
	numberOfProducts INT	
);
INSERT INTO tblOrder(customerId, productId, description, numberOfProducts)
VALUES(1,2,'toi mua iphone x', 100);
DELETE FROM tblOrder

SELECT *, ROW_NUMBER()  OVER (ORDER BY customerId) rowIndex FROM tblOrder;
DELETE TOP (1) FROM tblOrder
WHERE customerId=1 AND productId = 2;
--customerId NOT NULL => ko duoc drop bang =? 
ALTER TABLE tblOrder ALTER COLUMN customerId INT NOT NULL;
ALTER TABLE tblOrder ALTER COLUMN productId INT NOT NULL;
--dữ liệu lởm rồi => tạo constraint
ALTER TABLE tblOrder ADD CONSTRAINT PK_Order PRIMARY KEY (customerId, productId);
--Lỡ tạo rồi nhưng phát hiện nhầm, tạo lại 
--drop constraint => drop vô tư
ALTER TABLE tblOrder DROP CONSTRAINT PK_Order;
--muốn dùng productId VÀ customerId làm PRIMARY KEY 
--Derived: VD: điểm tổng(total) được tính từ điểm toán,lý, hóa.
