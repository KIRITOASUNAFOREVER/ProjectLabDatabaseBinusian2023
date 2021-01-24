--  Simulate Transaction Processes
USE delVia

-- SERVICE
INSERT INTO Service_TR
VALUES
('TR016','ST006','CU006','05/08/2020','REGULAR','Jalan EnamBelas XVI/16'),
('TR017','ST007','CU007','06/29/2020','REGULAR','Jalan TujuhBelas XVII/17'),
('TR018','ST008','CU008','06/21/2020','REGULAR','Jalan DelapanBelas XVIII/18'),
('TR019','ST009','CU009','07/30/2020','REGULAR','Jalan SembilanBelas XIX/19'),
('TR020','ST010','CU010','08/25/2020','REGULAR','Jalan DuaPuluh XX/20')

INSERT INTO Servicedetail_TR
VALUES
('TR011','ME006',5),
('TR012','ME007',4),
('TR013','ME008',3),
('TR014','ME009',2),
('TR015','ME010',1)

-- PURCHASE
INSERT INTO Purchase_TR
VALUES
('PU016','06/24/2020','ST006'),
('PU017','07/15/2020','ST007'),
('PU018','07/30/2020','ST008'),
('PU019','07/23/2020','ST009'),
('PU020','09/25/2020','ST010')

INSERT INTO Purchasedetail_TR
VALUES
('PU011', 'ID006', 'VE006', 175),
('PU012', 'ID007', 'VE007', 275),
('PU013', 'ID008', 'VE008', 475),
('PU014', 'ID009', 'VE009', 550),
('PU011', 'ID006', 'VE006', 775)