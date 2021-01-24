USE BluejackNetwork

--1

SELECT 
[CustomerName] = cs.[name],
[Transaction Date] = CONVERT(varchar, ss.sales_date, 107),
[Total Price] = 'Rp. ' + CAST(CAST(nd.sales_price * ds.quantity AS numeric(11,2)) AS varchar)
FROM Customer cs
JOIN Sales ss
ON ss.customer_id = cs.customer_id
JOIN DetailSales ds
ON ss.sales_id = ds.sales_id
JOIN NetworkDevice nd
ON ds.network_device_id = nd.network_device_id
WHERE ds.quantity > 5 AND nd.sales_price > 3000000 

--2

SELECT
[StaffId] = st.staff_id,
[StaffName] = st.[name],
[Total Purchased Network] = SUM(dp.quantity)
FROM Staff st
JOIN Purchase ps
ON st.staff_id = ps.staff_id
JOIN DetailPurchase dp
ON ps.purchase_id = dp.purchase_id
WHERE st.[name] LIKE '%s%' GROUP BY st.staff_id, st.[name]
HAVING SUM(dp.quantity) > 10


--3

SELECT [NetworkId] = n.network_device_id,
[NetworkName] = n.name,
[Network Stock] = CAST(n.stock AS VARCHAR)+' pc(s)',
[Total Sales Transaction] = COUNT(DISTINCT s.sales_id),
[Total Price] = SUM(d.quantity*n.sales_price)
FROM NetworkDevice n, Sales s, DetailSales d
WHERE s.sales_id = d.sales_id
AND d.network_device_id = n.network_device_id
AND n.name LIKE('%c%')
GROUP BY n.network_device_id, n.name, n.stock
HAVING SUM(d.quantity*n.sales_price)>30000000


--4

SELECT [VendorName] = v.name,
[VendorAddress] = v.address,
[Phone] = '+62' + SUBSTRING(s.phone_number, 2, LEN(s.phone_number)-1),
[Total Purchase Transaction] = COUNT(DISTINCT p.purchase_id),
[Average Price] = AVG(n.purchase_price)
FROM Vendor v, Staff s, Purchase p, DetailPurchase d, NetworkDevice n
WHERE v.vendor_id = p.vendor_id
AND s.staff_id = p.staff_id
AND p.purchase_id = d.purchase_id
AND d.network_device_id = n.network_device_id
AND LEN(v.address)<25
GROUP BY v.name,v.address,s.phone_number
HAVING AVG(n.purchase_price) > 1000000


--5

SELECT DISTINCT [CustomerId] = c.customer_id,
[CustomerName] = c.[name], 
[CustomerGender] = c.gender, 
[CustomerAge] = DATEDIFF(Year, c.dob, GETDATE())
FROM Customer c,
	(
		SELECT AVG(n.sales_price) AS average
		FROM NetworkDevice n
	)AS PRICE,
	Sales, DetailSales, NetworkDevice
WHERE DATEDIFF(Year, c.dob, GETDATE()) > 21
AND sales_price > PRICE.average
AND c.customer_id=Sales.customer_id
AND Sales.sales_id=DetailSales.sales_id
AND DetailSales.network_device_id = NetworkDevice.network_device_id


--6

SELECT [StaffName] = LEFT(s.[name],CHARINDEX(' ', s.[name])-1),
[StaffAddress] = s.[address],
[StaffSalary] = s.salary,
[VendorName]=v.[name],
[NetworkId] = d.network_device_id,
[Quantity] = d.quantity, 
[PurchaseDate] = p.purchase_date
FROM Staff s, Vendor v,DetailPurchase d, Purchase p,
(
	SELECT [avg]=AVG(salary)
	FROM Staff
)AS Average
WHERE s.staff_id=p.staff_id
AND p.purchase_id=d.purchase_id
AND p.vendor_id=v.vendor_id
AND s.salary>Average.[avg]

--7

SELECT [NetworkName]=d.[name], [NetworkCategoryName]=c.[name], [Sales Price]='Rp. '+CAST(d.sales_price AS VARCHAR),
[Total Sold] = SUM(ds.quantity)
FROM NetworkDevice d, NetworkCategory c, Sales s, DetailSales ds, (
	SELECT sp=AVG(sales_price) FROM NetworkDevice
) AS avgp
WHERE d.sales_price > avgp.sp
AND ds.network_device_id = d.network_device_id
AND d.network_category_id = c.network_category_id
GROUP BY d.[name], c.[name], d.sales_price
HAVING SUM(ds.quantity) > 10
ORDER BY NetworkName DESC

--8

SELECT [Network Name] = UPPER(d.[name]), 
		[Network Category Name] = c.[name], 
		[Purchase Price] = 'Rp. ' + CAST(d.purchase_price AS VARCHAR),
		[Total Purchase] = SUM(dp.quantity),
		[Network Stock] = d.stock
FROM NetworkDevice d, NetworkCategory c, DetailPurchase dp,
	(
		SELECT [max] = MAX(purchase_price) FROM NetworkDevice
	) AS max_pp
WHERE d.sales_price < max_pp.[max] 
AND (c.name = 'Router' OR c.name = 'Switch')
AND d.network_device_id = dp.network_device_id
AND d.network_category_id = c.network_category_id
GROUP BY d.name, c.name, d.purchase_price, dp.quantity, d.stock

--9

CREATE VIEW VendorTransaction
AS(
	SELECT [VendorName] = v.[name], 
	[VendorPhone] = v.phone_number, 
	[Total Sold Network]=A.qty,
	[Total Transaction]=A.idcount
	FROM Vendor v,(
		SELECT p.vendor_id, [qty] = SUM(d.quantity),[idcount] = COUNT(DISTINCT p.purchase_id)
		FROM Purchase p, DetailPurchase d, Staff s
		WHERE p.purchase_id=d.purchase_id
		AND p.staff_id = s.staff_id
		AND s.gender LIKE('Male')
		GROUP BY p.vendor_id
	) AS A
	WHERE v.vendor_id = A.vendor_id
	AND A.idcount > 2
)

--10

CREATE VIEW CustomerTransaction
AS(
	SELECT [CustomerName] = Customer.[name],
	[CustomerGender] = Customer.gender, 
	[Total Purchased Network] = PRICE.qty,
	[Total Transaction]=PRICE.idcount
	FROM Customer,
	(
		SELECT [id]=Sales.customer_id, [qty] = SUM(DetailSales.quantity),[idcount]=COUNT(DISTINCT Sales.sales_id)
		FROM DetailSales,Sales
		WHERE Sales.sales_id = DetailSales.sales_id
		GROUP BY Sales.customer_id
	) AS PRICE
	WHERE PRICE.id = Customer.customer_id
	AND PRICE.qty > 15
	AND Customer.[name] LIKE('% %')
)