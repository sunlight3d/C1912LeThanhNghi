CREATE TABLE Orders(
OrderID	INT IDENTITY PRIMARY KEY, 
CustomerID INT,
EmployeeID INT,
OrderDate DATE,
);
INSERT INTO Orders(CustomerID, EmployeeID, OrderDate)
VALUES(1,3,'1993/03/26');
SELECT CONCAT(DAY(OrderDate), '--', MONTH(OrderDate), '--',YEAR(OrderDate)) as 'NGay Dat Hang'
FROM Orders;