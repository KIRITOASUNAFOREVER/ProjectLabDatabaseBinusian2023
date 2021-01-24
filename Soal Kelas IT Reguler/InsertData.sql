-- Insert Data

USE delVia

INSERT INTO Staff_MS
VALUES
('ST001','SP001','CEO','Fiona Tendio','FEMALE','fiona@yahoo.co.id','081211118265','Jalan Elang I/1',550000),
('ST002','SP002','Secretary','Edward Tendio','MALE','edward@gmail.com','081289434641','Jalan Kelinci II/2',600000),
('ST003','SP003','Treasurer','Aldo Handaka','MALE','aldo@yahoo.com','081211119385','Jalan Garuda III/3',650000),
('ST004','SP004','Promotion','Evan Edbert','MALE','evan@gmail.com','081211115624','Jalan Singa IV/4',700000),
('ST005','SP005','Marketing','Jason Purwoko','MALE','jason@yahoo.com','081211119200','Jalan Macan V/5',750000),
('ST006','SP006','Inventory Manager','Isabella Gozali','FEMALE','isabella@yahoo.co.id','081211119546','Jalan Kodok VI/6',800000),
('ST007','SP007','Head Chef','Eduardo Soureka','MALE','eduardo@gmail.com','081211117567','Jalan Jangkrik VII/7',850000),
('ST008','SP008','Chef','Ansellino Gunawan','MALE','ansel@yahoo.com','081211111778','Jalan Siput VIII/8',900000),
('ST009','SP009','Supervisor','Taurean Wingardi','MALE','taurean@yahoo.co.id','081211110083','Jalan Kelelawar IX/9',950000),
('ST010','SP010','Cashier','Raffael Tatulus','MALE','raffael@gmail.com','081211118265','Jalan Buaya X/10',1000000)

SELECT * FROM Staff_MS

INSERT INTO Vendor_MS
VALUES
('VE001','PT. Mawar','Jalan Mawar I/1','mawar@gmail.com'),
('VE002','PT. Melati','Jalan Melati II/2','melati@yahoo.com'),
('VE003','PT. Lili','Jalan Lili III/3','lili@yahoo.co.id'),
('VE004','PT. Bangkai','Jalan Bangkai IV/4','bangkai@gmail.com'),
('VE005','PT. Tulip','Jalan Tulip V/5','tulip@yahoo.com'),
('VE006','PT. Asoka','Jalan Asoka VI/6','asoka@yahoo.co.id'),
('VE007','PT. Kamboja','Jalan Kamboja VII/7','kamboja@gmail.com'),
('VE008','PT. Kemuning','Jalan Kemuning VIII/8','kemuning@yahoo.com'),
('VE009','PT. Lavender','Jalan Lavender IX/9','lavender@yahoo.co.id'),
('VE010','PT. Amarilis','Jalan Amarilis X/10','amarilis@gmail.com')

SELECT * FROM Vendor_MS

INSERT INTO Ingredient_MS
VALUES
('ID001', 'Flour', 125, 2000),
('ID002', 'Bread', 175, 4000),
('ID003', 'Ham', 300, 8000),
('ID004', 'Lettuce', 500, 5000),
('ID005', 'Bacon', 525, 8000),
('ID006', 'Mayonaise', 150, 2000),
('ID007', 'Ketchup', 100, 1000),
('ID008', 'Tomato', 600, 3000),
('ID009', 'Chicken', 375, 9000),
('ID010', 'Tuna', 350, 10000)

SELECT * FROM Ingredient_MS

INSERT INTO Purchase_TR
VALUES
('PU001','09/18/2020','ST001'),
('PU002','10/19/2020','ST002'),
('PU003','09/21/2020','ST003'),
('PU004','06/15/2020','ST004'),
('PU005','05/17/2020','ST005'),
('PU006','06/21/2020','ST006'),
('PU007','06/29/2020','ST007'),
('PU008','07/30/2020','ST008'),
('PU009','08/25/2020','ST009'),
('PU010','10/12/2020','ST010'),
('PU011','08/06/2020','ST001'),
('PU012','06/16/2020','ST002'),
('PU013','07/12/2020','ST003'),
('PU014','07/11/2020','ST004'),
('PU015','07/10/2020','ST005')

SELECT * FROM Purchase_TR

INSERT INTO Purchasedetail_TR VALUES ('PU001', 'ID001', 'VE001', 5)
INSERT INTO Purchasedetail_TR VALUES ('PU002', 'ID002', 'VE002', 8)
INSERT INTO Purchasedetail_TR VALUES ('PU003', 'ID003', 'VE003', 25)
INSERT INTO Purchasedetail_TR VALUES ('PU004', 'ID004', 'VE004', 65)
INSERT INTO Purchasedetail_TR VALUES ('PU005', 'ID005', 'VE005', 240)
INSERT INTO Purchasedetail_TR VALUES ('PU006', 'ID006', 'VE006', 150)
INSERT INTO Purchasedetail_TR VALUES ('PU007', 'ID007', 'VE007', 20)
INSERT INTO Purchasedetail_TR VALUES ('PU008', 'ID008', 'VE008', 280)
INSERT INTO Purchasedetail_TR VALUES ('PU009', 'ID009', 'VE009', 15)
INSERT INTO Purchasedetail_TR VALUES ('PU010', 'ID010', 'VE010', 125)
INSERT INTO Purchasedetail_TR VALUES ('PU011', 'ID001', 'VE001', 30)
INSERT INTO Purchasedetail_TR VALUES ('PU012', 'ID002', 'VE002', 75)
INSERT INTO Purchasedetail_TR VALUES ('PU013', 'ID003', 'VE003', 325)
INSERT INTO Purchasedetail_TR VALUES ('PU014', 'ID004', 'VE004', 20)
INSERT INTO Purchasedetail_TR VALUES ('PU015', 'ID005', 'VE005', 750)
INSERT INTO Purchasedetail_TR VALUES ('PU001', 'ID006', 'VE006', 25)
INSERT INTO Purchasedetail_TR VALUES ('PU002', 'ID007', 'VE007', 800)
INSERT INTO Purchasedetail_TR VALUES ('PU003', 'ID008', 'VE008', 300)
INSERT INTO Purchasedetail_TR VALUES ('PU004', 'ID009', 'VE009', 250)
INSERT INTO Purchasedetail_TR VALUES ('PU005', 'ID010', 'VE010', 225)
INSERT INTO Purchasedetail_TR VALUES ('PU006', 'ID001', 'VE001', 155)
INSERT INTO Purchasedetail_TR VALUES ('PU007', 'ID002', 'VE002', 400)
INSERT INTO Purchasedetail_TR VALUES ('PU008', 'ID003', 'VE003', 650)
INSERT INTO Purchasedetail_TR VALUES ('PU009', 'ID004', 'VE004', 150)
INSERT INTO Purchasedetail_TR VALUES ('PU010', 'ID005', 'VE005', 675)

SELECT * FROM Purchasedetail_TR

INSERT INTO Customer_MS
VALUES
('CU001','Alice Setiabudi', '082119192020', 'Jalan Juanda I/1','FEMALE', 'alice@gmail.com'),
('CU002','Sophie Gunawan', '082119199191', 'Jalan Pattimura II/2','FEMALE', 'sophie@yahoo.com'),
('CU003','Andi Hermawan', '082119196583', 'Jalan Soekarno III/3','MALE', 'andi@yahoo.co.id'),
('CU004','Tony Setiawan', '082119194575', 'Jalan Soepomo IV/4','MALE', 'tony@gmail.com'),
('CU005','Tiona Hermansyah', '082119191739', 'Jalan Hatta V/5','FEMALE', 'tiona@yahoo.com'),
('CU006','Lucia Yonazuki', '082119196734', 'Jalan Soedirman VI/6','FEMALE', 'lucia@yahoo.co.id'),
('CU007','Chloe Gremory', '082119194621', 'Jalan Otto VI/6','MALE', 'chloe@gmail.com'),
('CU008','Travis Dermawan', '082119191947', 'Jalan Hamengkubuwono VII/7','MALE', 'travis@yahoo.com'),
('CU009','Alfie Pahlawan', '082119191865', 'Jalan Pakubuwono VIII/8','FEMALE', 'alfie@yahoo.co.id'),
('CU010','Earlicha Lionel', '082119198453', 'Jalan Singosari IX/9','FEMALE', 'earlicha@gmail.com')

SELECT * FROM Customer_MS

INSERT INTO Menu_MS
VALUES
('ME001','Nasi Goreng','Nasi Digoreng dengan Telur',25000),
('ME002','Mie Goreng','Mie Digoreng dengan Telur',25000),
('ME003','Kwetiaw Goreng','Kwetiaw Digoreng dengan Telur',25000),
('ME004','Bihun Goreng','Bihun Digoreng dengan Telur',25000),
('ME005','Burger Ayam','Roti Dibalut dengan Daging Ayam',20000),
('ME006','Burger Ham','Roti Dibalut dengan Daging HAM',25000),
('ME007','Burger Tuna','Roti Dibalut dengan Ikan Tuna',30000),
('ME008','Ayam Goreng','Ayam Diogreng dengan Bumbu Khusus',35000),
('ME009','Tuna Goreng','Ikan Tuna Digoreng dengan Bumbu Rahasia',50000),
('ME010','Sandwich Istimewa','Sandwich dibalut Ayam, HAM, Tuna, Telur',45000)

SELECT * FROM 

INSERT INTO Service_TR VALUES ('TR001','ST001','CU001','11/07/2020','REGULAR','Jalan Satu I/1')
INSERT INTO Service_TR VALUES ('TR002','ST002','CU002','10/14/2020','REGULAR','Jalan Dua II/2')
INSERT INTO Service_TR VALUES ('TR003','ST003','CU003','09/16/2020','REGULAR','Jalan Tiga III/3')
INSERT INTO Service_TR VALUES ('TR004','ST004','CU004','01/17/2020','REGULAR','Jalan Empat IV/4')
INSERT INTO Service_TR VALUES ('TR005','ST005','CU005','11/04/2020','REGULAR','Jalan Lima V/5')
INSERT INTO Service_TR VALUES ('TR006','ST006','CU006','07/07/2020','REGULAR','Jalan Enam VI/6')
INSERT INTO Service_TR VALUES ('TR007','ST007','CU007','11/09/2020','REGULAR','Jalan Tujuh VII/7')
INSERT INTO Service_TR VALUES ('TR008','ST008','CU008','09/13/2020','REGULAR','Jalan Delapan VIII/8')
INSERT INTO Service_TR VALUES ('TR009','ST009','CU009','08/16/2020','REGULAR','Jalan Sembilan IX/9')
INSERT INTO Service_TR VALUES ('TR010','ST010','CU010','06/05/2020','REGULAR','Jalan Sepuluh X/10')
INSERT INTO Service_TR VALUES ('TR011','ST001','CU001','10/08/2020','REGULAR','Jalan Sebelas XI/11')
INSERT INTO Service_TR VALUES ('TR012','ST002','CU002','03/17/2020','REGULAR','Jalan DuaBelas XII/12')
INSERT INTO Service_TR VALUES ('TR013','ST003','CU003','02/02/2020','REGULAR','Jalan TigaBelas XIII/13')
INSERT INTO Service_TR VALUES ('TR014','ST004','CU004','02/06/2020','REGULAR','Jalan EmpatBelas XIV/14')
INSERT INTO Service_TR VALUES ('TR015','ST005','CU005','05/07/2020','REGULAR','Jalan LimaBelas XV/15')

SELECT * FROM Service_TR

INSERT INTO Servicedetail_TR
VALUES
('TR001','ME001',5),
('TR002','ME002',10),
('TR003','ME003',1),
('TR004','ME004',4),
('TR005','ME005',6),
('TR006','ME006',7),
('TR007','ME007',7),
('TR008','ME008',7),
('TR009','ME009',3),
('TR010','ME010',3),
('TR011','ME001',3),
('TR012','ME002',3),
('TR013','ME003',1),
('TR014','ME004',1),
('TR015','ME005',1),
('TR001','ME006',1),
('TR002','ME007',2),
('TR003','ME008',3),
('TR004','ME009',3),
('TR005','ME010',4),
('TR006','ME001',5),
('TR007','ME002',6),
('TR008','ME003',6),
('TR009','ME004',1),
('TR010','ME005',1)

SELECT * FROM Servicedetail_TR