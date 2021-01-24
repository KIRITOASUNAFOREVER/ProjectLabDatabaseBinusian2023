CREATE DATABASE BluejackNetwork

USE BluejackNetwork

CREATE TABLE Staff(
 staff_id varchar(32) NOT NULL PRIMARY KEY CONSTRAINT checkStaffId CHECK (staff_id LIKE 'STF[0-9][0-9][0-9]'),
 [name] varchar(64) NOT NULL,
 phone_number varchar(12) NOT NULL CONSTRAINT checkPhone CHECK (phone_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
 [address] varchar(128) NOT NULL,
 dob date NOT NULL CONSTRAINT checkDate CHECK (YEAR(dob) < '1995'),
 gender varchar(16) NOT NULL CONSTRAINT checkGender CHECK (gender = 'Male' OR gender ='Female'),
 salary int NOT NULL CONSTRAINT checkSalary CHECK (salary >= 3000000) 
)

CREATE TABLE Vendor(
 vendor_id varchar(32) NOT NULL PRIMARY KEY CONSTRAINT checkVendorId CHECK (vendor_id LIKE 'VDR[0-9][0-9][0-9]'),
 [name] varchar(64) NOT NULL,
 phone_number varchar(12) NOT NULL CONSTRAINT checkVendorPhone CHECK (phone_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
 [address] varchar(128) NOT NULL CONSTRAINT checkAddressVendor CHECK (LEN([address]) > 15),
)

CREATE TABLE Customer(
 customer_id varchar(32) NOT NULL PRIMARY KEY CONSTRAINT checkCustomerId CHECK (customer_id LIKE 'CST[0-9][0-9][0-9]'),
 [name] varchar(64) NOT NULL CONSTRAINT checkName CHECK (LEN([name]) BETWEEN 5 AND 25),
 phone_number varchar(12) NOT NULL CONSTRAINT checkCustomerPhone CHECK (phone_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
 [address] varchar(128) CONSTRAINT checkAddressCustomer CHECK (LEN([address]) > 15),
 gender varchar(16) NOT NULL CONSTRAINT checkGenderCustomer CHECK (gender = 'Male' OR gender ='Female'),
 dob date NOT NULL
)

CREATE TABLE NetworkCategory(
 network_category_id varchar(32) NOT NULL PRIMARY KEY CONSTRAINT checkNetworkCategoryId CHECK (network_category_id LIKE 'NCT[0-9][0-9][0-9]'),
 [name] varchar(64) NOT NULL
)

CREATE TABLE NetworkDevice(
 network_device_id varchar(32) NOT NULL PRIMARY KEY CONSTRAINT checkNetworkDeviceId CHECK (network_device_id LIKE 'NTK[0-9][0-9][0-9]'),
 [name] varchar(64) NOT NULL,
 network_category_id varchar(32) NOT NULL FOREIGN KEY REFERENCES NetworkCategory(network_category_id),
 stock int NOT NULL,
 sales_price int NOT NULL,
 purchase_price int NOT NULL
)

CREATE TABLE Sales(
 sales_id varchar(32) NOT NULL PRIMARY KEY CONSTRAINT checkSalesId CHECK (sales_id LIKE 'SLS[0-9][0-9][0-9]'),
 staff_id varchar(32) NOT NULL FOREIGN KEY REFERENCES Staff(staff_id) ON UPDATE CASCADE ON DELETE CASCADE,
 customer_id varchar(32) NOT NULL FOREIGN KEY REFERENCES Customer(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
 sales_date date NOT NULL,
)

CREATE TABLE DetailSales(
 sales_id varchar(32) NOT NULL FOREIGN KEY REFERENCES Sales(sales_id) ON UPDATE CASCADE ON DELETE CASCADE,
 network_device_id varchar(32) NOT NULL FOREIGN KEY REFERENCES NetworkDevice(network_device_id) ON UPDATE CASCADE ON DELETE CASCADE,
 quantity int NOT NULL
)

CREATE TABLE Purchase(
 purchase_id varchar(32) NOT NULL PRIMARY KEY CONSTRAINT checkPurchaseId CHECK (purchase_id LIKE 'PCH[0-9][0-9][0-9]'),
 staff_id varchar(32) NOT NULL FOREIGN KEY REFERENCES Staff(staff_id) ON UPDATE CASCADE ON DELETE CASCADE,
 vendor_id varchar(32) NOT NULL FOREIGN KEY REFERENCES Vendor(vendor_id) ON UPDATE CASCADE ON DELETE CASCADE,
 purchase_date date NOT NULL,
)

CREATE TABLE DetailPurchase(
 purchase_id varchar(32) NOT NULL FOREIGN KEY REFERENCES Purchase(purchase_id) ON UPDATE CASCADE ON DELETE CASCADE,
 network_device_id varchar(32) NOT NULL FOREIGN KEY REFERENCES NetworkDevice(network_device_id) ON UPDATE CASCADE ON DELETE CASCADE,
 quantity int NOT NULL
)
