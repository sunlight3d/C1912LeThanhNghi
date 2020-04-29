USE Northwind;

DECLARE @m TABLE (CategoryID INT);
INSERT INTO @m
SELECT CategoryID FROM Categories WHERE Categories.CategoryID BETWEEN 5 AND 7
SELECT * FROM @m;

SELECT * FROM Products ORDER BY CategoryID;

DECLARE @selectedProducts TABLE (CategoryID INT, NumberOfProducts INT);

INSERT INTO @selectedProducts
SELECT CategoryID, COUNT(ProductName) as NumberOfProducts
FROM Products
GROUP BY CategoryID
HAVING CategoryID < 3;

SELECT CategoryID FROM @selectedProducts;


--Th? join @selectedProducts v?i b?ng Products ?? 10 min