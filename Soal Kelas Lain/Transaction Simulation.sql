USE BluejackNetwork

SELECT * FROM Purchase

INSERT INTO Purchase VALUES
('PCH016', 'STF001', 'VDR001', '2018-03-02')
-- Membeli Network Device kepada Vendor melalui Staff dengan Kode Staff STF001

SELECT * FROM DetailPurchase

INSERT INTO DetailPurchase VALUES
('PCH016', 'NTK015', 8)
-- Memasukkan Detail Pembelian, barang yang dibeli adalah barang dengan kode NTK015
-- yaitu network device dengan nama Cex, dengan jumlah sebanyak 8
UPDATE NetworkDevice
SET stock = stock + DetailPurchase.quantity
WHERE network_device_id = DetailPurchase.network_device_id
-- Stock pada NetworkDevice bertambah karena terjadinya pembelian stock dari vendor


SELECT * FROM Sales

INSERT INTO Sales VALUES
('SLS016','STF001','CST001','2018-03-02')
-- Melayani pembelian network device kepada customer CST001 melalui staff dengan Kode Staff STF001

SELECT * FROM DetailSales

INSERT INTO DetailSales VALUES
('SLS016', 'NTK015', 8)
-- Memasukkan Detail Pembelian, barang yang dibeli adalah barang dengan kode NTK0015
-- yaitu network device dengan nama Cex, dengan jumlah sebanyak 8
UPDATE NetworkDevice
SET stock = stock - DetailSales.quantity
WHERE network_device_id = DetailSales.network_device_id
-- Stock pada NetworkDevice berkurang karena terjadinya pembelian stock oleh customer