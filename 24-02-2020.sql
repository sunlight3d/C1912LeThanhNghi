USE dbProductManagement;
--Bang Customers co ma khach hang la kieu int, nhung van muon hien ra dang "KH001"
CREATE TABLE Customers(
MaKhach INT IDENTITY(1, 1) PRIMARY KEY,
TenKhach NVARCHAR(500),
DienThoai VARCHAR(100),
);
CREATE TABLE Items(
MaHang INT IDENTITY(1, 1) PRIMARY KEY,
TenHang NVARCHAR(500),
DonGia FLOAT
);
--Bảng CustomerItems chứa MaKhach => 1 Customers - N CustomerItems
--Bảng CustomerItems chứa MaHang => 1 Items - N CustomerItems
--=> Customers(N) => Items(N)
--BangA(1) -> (N) BangX 
--BangX(N) -> (1) BangB
-- => BangA(N) - BangB(N)(bat buoc phai tach ra)
--BangX duoc goi la "association table cua BangA, BAng B"

CREATE TABLE CustomerItems(
MaKhach INT,
MaHang INT,
DonGia FLOAT, 
SoLuong INT
);
--TRong 1 CSDL thiet ke ok khi ma ko thay quan he n-n(tach thanh 2 quan he 1-n)
--Khi nao ko dat Foreign key ? => khi du lieu tho dua vao DB chua chuan
--VD: "ma hang001", "mh001", "m h 001"
--insert du lieu 
INSERT INTO Customers(TenKhach, DienThoai)
VALUES('mr a', '1111111'),
('mr c', '3333333'),
('mr b', '2222222'),
('mr d', '4444444');

INSERT INTO Items(TenHang, DonGia)
VALUES('Tu lanh', 350000),
('Tivi', 350000),
('Dieu hoa', 310000),
('May giat', 620000);

SELECT * FROM Items;
SELECT * FROM Customers;
SELECT * FROM CustomerItems;
--vd: ban C mua 10 cai tu lanh
INSERT INTO CustomerItems(MaKhach, MaHang, DonGia, SoLuong) VALUES(2, 1, 21000, 10);--khuyen mai cho ban C, chi con 21K
--ban B mua 20 cai Tivi ?
INSERT INTO CustomerItems(MaKhach, MaHang, DonGia, SoLuong) VALUES(3, 2, 50000, 20);

--ban D mua 5 cai Tivi ?
INSERT INTO CustomerItems(MaKhach, MaHang, DonGia, SoLuong) VALUES(4, 2, 31000, 5);

--ban D mua 15 cai may giat ?
INSERT INTO CustomerItems(MaKhach, MaHang, DonGia, SoLuong) VALUES(4,4, 50000, 20);
--Hien thi tong so tien ma khach hang da mua ?
SELECT sum(SoLuong * DonGia) as 'Tong so tien' FROM CustomerItems;
--Tinh tong so tien ma ban D da mua ?
SELECT sum(SoLuong * DonGia) as 'Tong so tien' FROM CustomerItems WHERE MaKhach = 4;
--Hien thi cac mat hang + tong so luong da ban
SELECT sum(SoLuong) as 'So luong san pham', MaHang FROM CustomerItems GROUP BY MaHang;
SELECT * FROM CustomerItems;

(SELECT sum(SoLuong) as 'So luong san pham', MaHang FROM CustomerItems GROUP BY MaHang) as tbl2;

--join nhieu table => viet bao cao
--Bay gio nguoi xem ko muon hien ma hang, muon hien "ten hang"
--"Ten hang" lai nam o bang Items
--Khach hang lại muốn "ko hiện mã Khách ???"
SELECT 
Customers.TenKhach,
Customers.DienThoai,
Items.TenHang,
tbl2.[So luong san pham]
FROM CustomerItems INNER JOIN  
(SELECT sum(SoLuong) as 'So luong san pham', MaHang FROM CustomerItems GROUP BY MaHang) as tbl2
ON CustomerItems.MaHang = tbl2.MaHang
INNER JOIN Items ON Items.MaHang = tbl2.MaHang
INNER JOIN Customers ON CustomerItems.MaKhach = Customers.MaKhach
ORDER BY tbl2.[So luong san pham] DESC;
 
--Hien thi 3 san pham ban chay nhat
SELECT TOP 3 * FROM CustomerItems ORDER BY SoLuong DESC;