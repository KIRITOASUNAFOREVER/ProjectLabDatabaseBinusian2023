-- 10 case answer
USE delVia

--1 (HASILNYA KOSONG KARENA TIDAK ADA STAFF YANG GAJINYA DIATAS 1 JUTA) 
SELECT [Name],Position_Name,COUNT(Purchase_TR.Staff_id + Service_TR.Staff_id) AS 'Total Activity' FROM Staff_MS
JOIN Purchase_TR ON Staff_MS.Staff_id = Purchase_TR.Purchase_id
JOIN Service_TR ON Staff_MS.Staff_id = Service_TR.Staff_id
WHERE Staff_MS.Salary BETWEEN 1000000 AND 4000000
GROUP BY Staff_MS.Name, Staff_MS.Position_Name
HAVING COUNT(Purchase_TR.Staff_id + Service_TR.Staff_id)  > 2

--2
SELECT Customer_MS.Customer_id,[Name],SUM(MenuQty) AS 'Pax Bought' FROM Customer_MS
JOIN Service_TR ON Customer_MS.Customer_id = Service_TR.Customer_id
JOIN Servicedetail_TR ON Service_TR.Service_id = Servicedetail_TR.Service_id
WHERE Customer_MS.Gender = 'MALE' AND DATEPART(MONTH,Service_TR.Date) < 7
GROUP BY Customer_MS.Customer_id,[Name]

--3
SELECT Ingredient_MS.Name, COUNT(Purchasedetail_TR.Ingredient_id) AS 'Ingredient Bought', COUNT(Purchasedetail_TR.Purchase_id) AS 'Purchase Count', [Total Expenses] = SUM(Purchasedetail_TR.IngredientQty*Ingredient_MS.Price) FROM Ingredient_MS
JOIN Purchasedetail_TR ON Ingredient_MS.Ingredient_id = Purchasedetail_TR.Ingredient_id
JOIN Purchase_TR ON Purchase_TR.Purchase_id = Purchasedetail_TR.Purchase_id
WHERE DATEPART(MONTH,Purchase_TR.Date)%2 = 0 AND (DATEPART(WEEKDAY, Purchase_TR.Date) = 3 OR DATEPART(WEEKDAY, Purchase_TR.Date) = 4)
GROUP BY Ingredient_MS.Name

--4 (HASILNYA KOSONG KARENA TIDAK ADA STAFF ID GANJIL MELAYANI CUSTOMER ID GENAP)                     
SELECT LEFT(Staff_MS.Name,CHARINDEX(' ',Staff_MS.Name + ' ')-1)  AS [Staff First Name], COUNT(Purchase_TR.Purchase_id) AS 'Transaction Count', COUNT(Service_TR.Service_id) AS 'Pax Sold'
FROM Staff_MS
JOIN Purchase_TR ON Staff_MS.Staff_id = Purchase_TR.Staff_id
JOIN Service_TR ON Staff_MS.Staff_id = Service_TR.Staff_id
JOIN Customer_MS ON Customer_MS.Customer_id = Service_TR.Customer_id
WHERE RIGHT(Staff_MS.Staff_id,1)%2=1 AND RIGHT(Customer_MS.Customer_id,1)%2=0
GROUP BY Staff_MS.Name

--5 (HASILNYA KOSONG KARENA GAK ADA YANG MELEBIHI ATAU SAMA DENGAN RATA RATA)
SELECT SUBSTRING(Vendor_MS.Name, 4, 55) AS 'Vendor Name', Ingredient_MS.Name,'Rp. '+CAST(Ingredient_MS.Price AS varchar) AS 'Ingredient Price' FROM Vendor_MS
JOIN Purchasedetail_TR ON Vendor_MS.Vendor_id = Purchasedetail_TR.Vendor_id
JOIN Ingredient_MS ON Ingredient_MS.Ingredient_id = Purchasedetail_TR.Ingredient_id
WHERE
Ingredient_MS.Stock < 250
AND
Ingredient_MS.Price >= (SELECT [AVG] = AVG(Ingredient_MS.Price) FROM Ingredient_MS)

--6 (HASILNYA KOSONG KARENA GAK ADA PAX YANG DIJUAL MELEBIHI 100 BUAH)
SELECT Customer_MS.Name, Service_TR.Date, Menu_MS.Name, Menu_MS.Price,
SUBSTRING(Menu_MS.Description, 0, CHARINDEX(' ', Menu_MS.Description, CHARINDEX(' ', Menu_MS.Description, 0)+1)) AS ' Brief Description',
Servicedetail_TR.MenuQty AS 'Pax',
SUM(Menu_MS.Price*Servicedetail_TR.MenuQty) AS 'Total Price'
FROM Customer_MS
JOIN Service_TR ON Customer_MS.Customer_id = Service_TR.Customer_id
JOIN Servicedetail_TR ON Service_TR.Service_id = Servicedetail_TR.Service_id
JOIN Menu_MS ON Menu_MS.Menu_id = Servicedetail_TR.Menu_id
WHERE Servicedetail_TR.MenuQty > 100
GROUP BY Customer_MS.Name,Service_TR.Date,Menu_MS.Name,Menu_MS.Price,Menu_MS.Description, Servicedetail_TR.MenuQty
HAVING Menu_MS.Price > (SELECT [AVG] = AVG(Menu_MS.Price) FROM Menu_MS)

--7
SELECT [Name] = UPPER(Staff_MS.Name), Purchase_TR.Date, CAST(SUM(Purchasedetail_TR.IngredientQty) AS varchar) + ' pcs' AS 'Quantity Bought' FROM Staff_MS
JOIN Purchase_TR ON Staff_MS.Staff_id = Purchase_TR.Staff_id
JOIN Purchasedetail_TR ON Purchase_TR.Purchase_id = Purchasedetail_TR.Purchase_id
JOIN Ingredient_MS ON Ingredient_MS.Ingredient_id = Purchasedetail_TR.Ingredient_id
WHERE DATEPART(MONTH,Purchase_TR.Date) %2 = 0 AND Ingredient_MS.Price < (SELECT [MAX] = MAX(Ingredient_MS.Price) FROM Ingredient_MS)
GROUP BY Staff_MS.Name, Purchase_TR.Date

--8
SELECT Customer_MS.Name,left(Customer_MS.Email, charindex('@', Customer_MS.Email) - 1) AS [Email],
[Menu Name] = LOWER(Menu_MS.Name), SUM(Servicedetail_TR.MenuQty) AS 'Pax Bought' FROM Customer_MS
JOIN Service_TR ON Customer_MS.Customer_id = Service_TR.Customer_id
JOIN Servicedetail_TR ON Service_TR.Service_id = Servicedetail_TR.Service_id
JOIN Menu_MS ON Menu_MS.Menu_id = Servicedetail_TR.Menu_id
WHERE Customer_MS.Gender = 'MALE'
GROUP BY Customer_MS.Name, Customer_MS.Email, Menu_MS.Name
HAVING SUM(Servicedetail_TR.MenuQty) >= (SELECT [AVG] = AVG(Servicedetail_TR.MenuQty) FROM Servicedetail_TR)

--9
CREATE VIEW [LoyalCustomerView]
AS
SELECT
	Customer_MS.Name,
	COUNT(Service_TR.Customer_id) AS 'Total Transaction',
	SUM(Servicedetail_TR.MenuQty) AS 'Total Pax Purchased',
	SUM(Menu_MS.Price*Servicedetail_TR.MenuQty) AS 'Total Price'
FROM
	Customer_MS
	JOIN Service_TR ON Customer_MS.Customer_id = Service_TR.Customer_id
	JOIN Servicedetail_TR ON Service_TR.Service_id = Servicedetail_TR.Service_id
	JOIN Menu_MS ON Menu_MS.Menu_id = Servicedetail_TR.Menu_id
WHERE
	Customer_MS.Gender = 'FEMALE'
GROUP BY
	Customer_MS.Name
HAVING
	COUNT(Service_TR.Customer_id) > 2

--10
CREATE VIEW [VendorRecapView]
AS
SELECT
	Vendor_MS.Name,
	COUNT(Purchasedetail_TR.Vendor_id) AS 'Purchases Made',
	SUM(Purchasedetail_TR.IngredientQty) AS 'Ingredients Purchased'
FROM
	Vendor_MS
	JOIN Purchasedetail_TR ON Vendor_MS.Vendor_id = Purchasedetail_TR.Vendor_id
	JOIN Ingredient_MS ON Ingredient_MS.Ingredient_id = Purchasedetail_TR.Ingredient_id
	JOIN Purchase_TR ON Purchase_TR.Purchase_id = Purchasedetail_TR.Purchase_id
WHERE
	Ingredient_MS.Stock > 150
GROUP BY
	Vendor_MS.Name
HAVING
	COUNT(Purchasedetail_TR.Vendor_id) > 1