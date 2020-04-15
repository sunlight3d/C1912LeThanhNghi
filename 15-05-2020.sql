--Tao 1 database moi
--chi co admin/sa hoc mot so user duoc phan quyen admin moi co the tao dc database  
CREATE DATABASE dbProductManagement;
--xoa = drop = CAREFUL !!!!
DROP DATABASE dbProductManagement;-- chi thuc hanh o nha, ko lam o cong ty
-- cac cau lenh DROP => ko hoi "Are you sure ?"
--1 database co chua nhieu bang(Table)
--khi hoc mon javascript, minh co lam viec voi array(du lieu kieu mang, danh sach,..) 
--array co so luong phan tu ko nhieu(vai tram, < 1000 phan tu)
--table gan giong "array cac object", so luong lon hon nhieu, -> hang trieu ban ghi = "record"
-- moi row(hàng) trong Table(bảng) gọi là 1 bản ghi(record)
-- mỗi cột(column) trong Table đc gọi là các trường(field)
--Một database(CSDL) có nhiều bảng, 1 bảng có nhiều trường(field) và có thể có rất nhiều bản ghi(record)
--VD: để lưu danh sách sinh viên của 1 trường đại học A, có 1 bảng tblStudents
--bảng tblStudents có các trường studentName, age, email, studentId(so the sinh vien)
--Bt1: tạo bảng tblStudents nằm trong database dbProductManagement
USE dbProductManagement;--nhay(switch) den database dbProductManagement
--VARCHAR = String = variable characters, 
--VARCHAR(250) = maximum 250 characters, vượt quá thì bị cắt đi
--Thêm các ràng buộc khi tạo bảng, NOT NULL = phải có dữ liệu mới cho insert
CREATE TABLE tblStudents(
	studentName VARCHAR(250) NOT NULL,
	age INT NOT NULL,
	email VARCHAR(200),
	studentId  VARCHAR(100)
);
--Trong mỗi bản ghi phải có 1 trường(field) mà dữ liệu của nó ko trùng với các bản ghi khác
--VD: số CMND, số thẻ sinh viên, ....
--Mỗi table phải đặc trưng cho 1 thực thể nào đó, ko được đặc trưng cho > 2 thực thể 
--xóa bảng + xóa cả dữ liệu -> lệnh này cẩn thận, ko làm ở cty !
DROP TABLE tblStudents;
--Table sẽ tồn tại, nhưng ko có bản ghi nào
--VD2: tao bang tblProducts 
CREATE TABLE tblProducts(
	productName NVARCHAR(300),
	productId INT,
	productionYear INT
);
--xem trong bảng tblProduct có các bản ghi nào?
--* = all fields = tất cả các trường(cột, thuộc tính)
SELECT * FROM tblProducts;
--Làm thử bài tập: tạo 1 bảng tblPoint(name, x, y)
--quên mất máy tính các bạn chưa cài SQL Server
--dùng tạm w3school
CREATE TABLE tblPoint(
name NVARCHAR(200), 
x FLOAT, 
y FLOAT
);
INSERT INTO tblPoint(name, x, y)
VALUES('điểm a', 10.0, 20.2);
--kiem tra xem co du lieu chua
SELECT * FROM tblPoint;