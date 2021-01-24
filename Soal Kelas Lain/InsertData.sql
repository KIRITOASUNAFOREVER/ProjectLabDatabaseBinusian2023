USE BluejackNetwork

-- Table Master

INSERT INTO Customer VALUES
('CST001', 'Jermaine Gookey', '081177225522', '1 Old Gate Court Chicago', 'Female', '1991/08/09'),
('CST002', 'Simeon Pontin', '081820530122', '50254 Ohio Parkway Seattle', 'Male', '1985/09/24'),
('CST003', 'Ives Divall', '081168038033', '5834 Thierer Park Illinois', 'Male', '1986/11/28'),
('CST004', 'Gabie Poytress', '081837215911', '2683 Warbler Place Kitchen', 'Female', '1994/01/28'),
('CST005', 'Brietta Gianolini', '081851026955', '5 Vahlen Park New York', 'Female', '1986/03/30'),
('CST006', 'Cullie Lewington', '081110631844', '84760 Morningstar Plaza Federal Way', 'Male', '1990/08/20'),
('CST007', 'Marie Poser', '081160997333', '5802 Green Trail Seattle', 'Female', '1986/04/11'),
('CST008', 'Trace Barwick', '081595510922', '6 Sommers Terrace Green Park', 'Male', '1992/10/14'),
('CST009', 'Loni Headland', '081120577654', '352 Washington Avenue Illinois', 'Female', '1982/01/17'),
('CST010', 'Sarette Hinder', '081502496712', '295 Tomscot Hill Melbourne', 'Female', '1993/09/07'),
('CST011', 'Tony Stark', '081123543214', '9 Vahlen Park New York', 'Female', '1986/03/30'),
('CST012', 'Nelson Mandela', '081110412356', '84760 Morningstar Plaza Federal Way', 'Male', '1990/08/20'),
('CST013', 'Kenny Foster', '081160964123', '5802 Green Trail Seattle', 'Female', '1986/04/11'),
('CST014', 'Richard Wick', '081595565432', '6 Sommers Terrace Green Park', 'Male', '1992/10/14'),
('CST015', 'Matt Murdock', '081120598685', '352 Washington Avenue Illinois', 'Female', '1982/01/17')

INSERT INTO Staff VALUES 
('STF001', 'Monroe Buesden', '081995597111', '79 Bartillon Court Chicago', '1984/10/28', 'Male', 4500000),
('STF002', 'Kennedy Harriagn', '081790660122', '78 Commercial Drive Seattle', '1990/01/27', 'Male', 4200000),
('STF003', 'Markos Batterton', '081775499012', '3037 Petterle Terrace Illinois', '1989/04/24', 'Male', 4500000),
('STF004', 'Haskell Mertsching', '081339302332', '781 Larry Point Park View', '1985/09/13', 'Male', 4000000),
('STF005', 'Pierette Silverstone', '081901498412', '1 Transport Junction Federal Way', '1991/06/24', 'Female', 4000000),
('STF006', 'Fredra Takos', '081385512245', '6 Monument Pass New York', '1988/02/23', 'Female', 4000000),
('STF007', 'Ramon Towle', '081781072964', '88 Ruskin Terrace Melbourne', '1994/11/02', 'Male', 4200000),
('STF008', 'Bernadette Darwen', '081405068042', '1378 Schiller Alley Hell Kitchen', '1981/10/08', 'Female', 4000000),
('STF009', 'Chelsae Chumley', '081211077211', '775 Erie Lane Afghanistan', '1993/04/24', 'Female', 4400000),
('STF010', 'Lawrence Dinsdale', '081602817247', '2 Westridge Drive Perth', '1982/08/15', 'Male', 4100000),
('STF011', 'Laony Manson', '081385212351', '6 Monument Pass New York', '1988/02/23', 'Female', 3500000),
('STF012', 'Henky Tomson', '081781213156', '88 Ruskin Terrace Melbourne', '1994/11/02', 'Male', 4500000),
('STF013', 'Ruskin Darwen', '081405123512', '1378 Schiller Alley Hell Kitchen', '1981/10/08', 'Female', 4100000),
('STF014', 'Benedict Richard', '081211022151', '775 Erie Lane Afghanistan', '1993/04/24', 'Female', 4000000),
('STF015', 'Kognac Anwen', '081602866412', '2 Westridge Drive Perth', '1982/08/15', 'Male', 4000000)

INSERT INTO Vendor VALUES
('VDR001', 'Skidoo', '081841068216', '43948 Magdeline Avenue Hells Kitchen'),
('VDR002', 'Devify', '081924823783', '6260 School Terrace Sun View'),
('VDR003', 'Oxify', '081707475474', '3 Ridgeview Place Illinois'),
('VDR004', 'Twimbo', '081169693203', '9201 Darwin Drive Chicago'),
('VDR005', 'Zoozzy', '081850135443', '96299 Village Way Seattle'),
('VDR006', 'Ailane', '081275014450', '34 Chive Way Alleyway'),
('VDR007', 'Snaptags', '081575611297', '1974 Cascade Alley Federal Way'),
('VDR008', 'Thoughtbeat', '081697012019', '22 Lawn Street Illinois'),
('VDR009', 'Jaxspan', '081805983434', '3730 Sundown Junction Melbourne'),
('VDR010', 'Midel', '081736022923', '6292 Warrior Lane Perth'),
('VDR011', 'Anway', '081275014450', '34 Chive Way Alleyway'),
('VDR012', 'Snitch', '081575611297', '1974 Cascade Alley Federal Way'),
('VDR013', 'M-O-M', '081697012019', '22 Lawn Street Illinois'),
('VDR014', 'Nixel', '081805983434', '3730 Sundown Junction Melbourne'),
('VDR015', 'Hanks', '081736022923', '6292 Warrior Lane Perth')

INSERT INTO NetworkCategory VALUES
('NCT001', 'Router'),
('NCT002', 'Switch'),
('NCT003', 'Network Accessories')

INSERT INTO NetworkDevice VALUES 
('NTK001', 'Fintone', 'NCT001', 20, 1000000, 900000),
('NTK002', 'Zaam-Dox', 'NCT002', 15, 4000000, 2000000),
('NTK003', 'Greenlam', 'NCT002', 30, 1500000, 1200000),
('NTK004', 'Zathin', 'NCT001', 35, 3400000, 1800000),
('NTK005', 'Solarbreeze', 'NCT003', 45, 900000, 800000),
('NTK006', 'Biodex', 'NCT003', 15, 700000, 600000),
('NTK007', 'Opela', 'NCT002', 33, 2100000, 2000000),
('NTK008', 'Y-find', 'NCT002', 23, 1500000, 1200000),
('NTK009', 'Vagram', 'NCT003', 19, 900000, 700000),
('NTK010', 'Ventosanzap', 'NCT003', 28, 1000000, 900000),
('NTK011', 'Hexo', 'NCT003', 15, 700000, 600000),
('NTK012', 'Pentogram', 'NCT002', 33, 2100000, 2000000),
('NTK013', 'W-a-n', 'NCT002', 23, 1500000, 1200000),
('NTK014', 'Hexa', 'NCT003', 19, 900000, 700000),
('NTK015', 'Cex', 'NCT003', 28, 1000000, 900000)


-- Table Transaction 

INSERT INTO Purchase VALUES
('PCH001', 'STF001', 'VDR001', '2018/12/15'),
('PCH002', 'STF002', 'VDR002', '2018/11/15'),
('PCH003', 'STF003', 'VDR003', '2018/12/13'),
('PCH004', 'STF004', 'VDR004', '2018/10/15'),
('PCH005', 'STF005', 'VDR005', '2018/09/15'),
('PCH006', 'STF006', 'VDR006', '2018/12/13'),
('PCH007', 'STF007', 'VDR007', '2018/12/12'),
('PCH008', 'STF008', 'VDR008', '2018/01/15'),
('PCH009', 'STF009', 'VDR009', '2018/03/13'),
('PCH010', 'STF010', 'VDR010', '2018/12/12'),
('PCH011', 'STF011', 'VDR011', '2018/11/11'),
('PCH012', 'STF012', 'VDR012', '2018/09/02'),
('PCH013', 'STF013', 'VDR013', '2018/04/02'),
('PCH014', 'STF014', 'VDR014', '2018/03/03'),
('PCH015', 'STF015', 'VDR015', '2018/07/07')

INSERT INTO Sales VALUES
('SLS001', 'STF001', 'CST001', '2018/12/15'),
('SLS002', 'STF002', 'CST002', '2018/11/15'),
('SLS003', 'STF003', 'CST003', '2018/12/13'),
('SLS004', 'STF004', 'CST004', '2018/10/15'),
('SLS005', 'STF005', 'CST005', '2018/09/15'),
('SLS006', 'STF006', 'CST006', '2018/12/13'),
('SLS007', 'STF007', 'CST007', '2018/12/12'),
('SLS008', 'STF008', 'CST008', '2018/01/15'),
('SLS009', 'STF009', 'CST009', '2018/03/13'),
('SLS010', 'STF010', 'CST010', '2018/12/12'),
('SLS011', 'STF011', 'CST011', '2018/11/11'),
('SLS012', 'STF012', 'CST012', '2018/09/02'),
('SLS013', 'STF013', 'CST013', '2018/04/02'),
('SLS014', 'STF014', 'CST014', '2018/03/03'),
('SLS015', 'STF015', 'CST015', '2018/07/07')


-- Table Detail Transaction

INSERT INTO DetailPurchase VALUES
('PCH001', 'NTK001', 8),
('PCH002', 'NTK002', 12),
('PCH003', 'NTK003', 9),
('PCH004', 'NTK004', 10),
('PCH005', 'NTK005', 10),
('PCH006', 'NTK002', 12),
('PCH007', 'NTK007', 15),
('PCH008', 'NTK008', 16),
('PCH009', 'NTK009', 11),
('PCH010', 'NTK010', 6),
('PCH011', 'NTK011', 7),
('PCH012', 'NTK012', 8),
('PCH013', 'NTK013', 9),
('PCH014', 'NTK014', 10),
('PCH015', 'NTK002', 11),
('PCH001', 'NTK004', 14),
('PCH002', 'NTK007', 12),
('PCH003', 'NTK006', 7),
('PCH004', 'NTK015', 8),
('PCH005', 'NTK008', 15),
('PCH006', 'NTK005', 5),
('PCH007', 'NTK002', 9),
('PCH008', 'NTK007', 10),
('PCH009', 'NTK009', 11),
('PCH010', 'NTK015', 15)


INSERT INTO DetailSales VALUES
('SLS001', 'NTK001', 8),
('SLS002', 'NTK002', 12),
('SLS003', 'NTK003', 9),
('SLS004', 'NTK004', 10),
('SLS005', 'NTK005', 10),
('SLS006', 'NTK006', 12),
('SLS007', 'NTK007', 15),
('SLS008', 'NTK008', 16),
('SLS009', 'NTK009', 11),
('SLS010', 'NTK010', 6),
('SLS011', 'NTK011', 7),
('SLS012', 'NTK012', 8),
('SLS013', 'NTK013', 9),
('SLS014', 'NTK014', 10),
('SLS015', 'NTK015', 11),
('SLS001', 'NTK004', 14),
('SLS002', 'NTK007', 12),
('SLS003', 'NTK006', 7),
('SLS004', 'NTK015', 8),
('SLS005', 'NTK008', 15),
('SLS006', 'NTK005', 5),
('SLS007', 'NTK002', 9),
('SLS008', 'NTK007', 10),
('SLS009', 'NTK005', 11),
('SLS010', 'NTK015', 15)
