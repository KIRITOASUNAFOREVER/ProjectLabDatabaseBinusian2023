-- Project Database Systems

CREATE DATABASE delVia
USE delVia

CREATE TABLE Staff_MS(
	Staff_id VARCHAR(5) PRIMARY KEY,
	Position_id VARCHAR(5),
	Position_Name VARCHAR(50),
	[Name] VARCHAR(50),
	Gender VARCHAR(10),
	[Email] VARCHAR(30),
	Phone VARCHAR(15),
	[Address] VARCHAR(500),
	Salary NUMERIC(20,2),
	CONSTRAINT StaffIDCon CHECK(Staff_id LIKE ('ST[0-9][0-9][0-9]')),
	CONSTRAINT PositionIDCon CHECK(Position_id LIKE ('SP[0-9][0-9][0-9]')),
	CONSTRAINT StaffGenderCon CHECK(Gender LIKE 'MALE' OR Gender LIKE 'FEMALE'),
	CONSTRAINT StaffSalaryCon CHECK(Salary BETWEEN 500000 AND 5000000),
	CONSTRAINT PhoneCon CHECK(Phone LIKE '08%'),
	CONSTRAINT StaffPositionCon CHECK(Position_Name LIKE 'CEO' OR Position_Name LIKE 'Secretary' OR Position_Name LIKE 'Treasurer' OR Position_Name LIKE 'Promotion' OR Position_Name LIKE 'Marketing' OR Position_Name LIKE 'Inventory Manager' OR Position_Name LIKE 'Head Chef' OR Position_Name LIKE 'Chef' OR Position_Name LIKE 'Supervisor' OR Position_Name LIKE 'Cashier'),
	CONSTRAINT EmailCon CHECK(	Email LIKE '%@%' 
								AND 
								Email LIKE '%gmail.com' OR Email LIKE '%yahoo.com' OR Email LIKE '%yahoo.co.id'
								AND 
								LEFT(Email,1) <> '@'
								AND
								SUBSTRING(REVERSE(Email), 5, 1) <> '@' 
								)
)

CREATE TABLE Vendor_MS(
	Vendor_id VARCHAR(5) PRIMARY KEY,
	[Name] VARCHAR(50),
	[Address] VARCHAR(500),
	Email VARCHAR(30),
	CONSTRAINT VendorIDCon CHECK(Vendor_id LIKE ('VE[0-9][0-9][0-9]')),
	CONSTRAINT VendorNameCon CHECK([Name] LIKE 'PT. %'),
	CONSTRAINT EmailVenCon CHECK(	Email LIKE '%@%' 
								AND 
								Email LIKE '%gmail.com' OR Email LIKE '%yahoo.com' OR Email LIKE '%yahoo.co.id'
								AND 
								LEFT(Email,1) <> '@'
								AND
								SUBSTRING(REVERSE(Email), 5, 1) <> '@' 
								)
)

CREATE TABLE Ingredient_MS(
	Ingredient_id VARCHAR(5) PRIMARY KEY,
	[Name] VARCHAR(50),
	Stock INTEGER,
	Price NUMERIC(11,2),
	CONSTRAINT IngredientIDCon CHECK(Ingredient_id LIKE ('ID[0-9][0-9][0-9]'))
)

CREATE TABLE Purchase_TR(
	Purchase_id VARCHAR(5) PRIMARY KEY,
	[Date] VARCHAR(10),
	Staff_id VARCHAR(5) FOREIGN KEY REFERENCES Staff_MS(Staff_id),
	CONSTRAINT PurchaseIDCon CHECK(Purchase_id LIKE ('PU[0-9][0-9][0-9]')),
	CONSTRAINT PurchaseDateCon CHECK(
			[Date] <= getdate()
		)
)

CREATE TABLE Purchasedetail_TR(
	Purchase_id VARCHAR(5) FOREIGN KEY REFERENCES Purchase_TR(Purchase_id),
	Ingredient_id VARCHAR(5) FOREIGN KEY REFERENCES Ingredient_MS(Ingredient_id),
	Vendor_id VARCHAR(5) FOREIGN KEY REFERENCES Vendor_MS(Vendor_id),
	IngredientQty NUMERIC(5,0),
	PRIMARY KEY(Purchase_id, Ingredient_id),
)

CREATE TABLE Customer_MS(
	Customer_id VARCHAR(5) PRIMARY KEY,
	[Name] VARCHAR(50),
	Phone VARCHAR(15),
	[Address] VARCHAR(500),
	Gender VARCHAR(10),
	[Email] VARCHAR(30),
	CONSTRAINT CustIDCon CHECK(Customer_id LIKE ('CU[0-9][0-9][0-9]')),
	CONSTRAINT PhoneCustCon CHECK(Phone LIKE '08%'),
	CONSTRAINT CustGenderCon CHECK(Gender LIKE 'MALE' OR Gender LIKE 'FEMALE'),
	CONSTRAINT EmailCustCon CHECK(	Email LIKE '%@%' 
								AND 
								Email LIKE '%gmail.com' OR Email LIKE '%yahoo.com' OR Email LIKE '%yahoo.co.id'
								AND 
								LEFT(Email,1) <> '@'
								AND
								SUBSTRING(REVERSE(Email), 5, 1) <> '@' 
								)
)

CREATE TABLE Menu_MS(
	Menu_id VARCHAR(5) PRIMARY KEY,
	[Name] VARCHAR(50),
	[Description] VARCHAR(500),
	Price NUMERIC(11,2),
	CONSTRAINT MenuIDCon CHECK(Menu_id LIKE ('ME[0-9][0-9][0-9]')),
	CONSTRAINT PriceMenuCon CHECK(Price BETWEEN 5000 AND 500000)
)

CREATE TABLE Service_TR(
	Service_id VARCHAR(5) PRIMARY KEY,
	Staff_id VARCHAR(5) FOREIGN KEY REFERENCES Staff_MS(Staff_id),
	Customer_id VARCHAR(5) FOREIGN KEY REFERENCES Customer_MS(Customer_id),
	[Date] VARCHAR(20),
	[Type] VARCHAR(20),
	[Address] VARCHAR(500),
	CONSTRAINT ServiceIDCon CHECK(Service_id LIKE ('TR[0-9][0-9][0-9]')),
	CONSTRAINT ServiceDateCon CHECK(
			[Date] <= getdate() 
		)
)

CREATE TABLE Servicedetail_TR(
	Service_id VARCHAR(5) FOREIGN KEY REFERENCES Service_TR(Service_id),
	Menu_id VARCHAR(5) FOREIGN KEY REFERENCES Menu_MS(Menu_id),
	MenuQty Numeric(5,0),
	PRIMARY KEY(Service_id, Menu_id),
)