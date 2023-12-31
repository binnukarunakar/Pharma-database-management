DROP DATABASE pharmacy;
CREATE DATABASE pharmacy;
USE pharmacy;

CREATE TABLE Companies (
  company_id INT PRIMARY KEY,
  company_name VARCHAR(255)
);

CREATE TABLE Drugs (
  drug_id INT PRIMARY KEY,
  drug_name VARCHAR(255),
  company_id INT,
  dosage VARCHAR(100),
  side_effects TEXT,
  FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);

CREATE TABLE DrugBatches (
	batch_id VARCHAR(100) PRIMARY KEY,
    drug_id INT,
    manufacture_date DATE,
    expiration_date DATE,
    tablets_per_container INT
);

CREATE TABLE Inventory (
	batch_id VARCHAR(100),
	price DECIMAL(5,2),
	count INT,
    FOREIGN KEY (batch_id) REFERENCES DrugBatches(batch_id)
);

CREATE TABLE Customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(1),
    dob DATE,
    height DECIMAL,
    weight DECIMAL,
    phone_number VARCHAR(15)
);

CREATE TABLE Orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_total decimal(4,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Doctors (
    doc_id VARCHAR(10) PRIMARY KEY,
    doc_name VARCHAR(255) NOT NULL,
    specialty VARCHAR(255) NOT NULL,
    practice VARCHAR(255) NOT NULL
);

CREATE TABLE OrderContains (
	order_id INT,
    batch_id VARCHAR(100),
    doc_id VARCHAR(10),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY	(batch_id) REFERENCES DrugBatches(batch_id),
    FOREIGN KEY (doc_id) REFERENCES Doctors(doc_id)
);

INSERT INTO Companies
VALUES
  (101, 'Pfizer'),
  (102, 'Moderna'),
  (103, 'Johnson & Johnson'),
  (104, 'Novartis'),
  (105, 'Roche'),
  (106, 'Merck & Co.'),
  (107, 'AbbVie'),
  (108, 'Bristol Myers Squibb'),
  (109, 'Sanofi'),
  (110, 'GSK');

SELECT * FROM Companies;

INSERT INTO Drugs
VALUES
	(1, 'Aspirin', 101, '325mg', 'May cause stomach irritation'), 
	(2, 'Ibuprofen', 102, '200mg', 'May cause nausea and dizziness'), 
	(3, 'Lipitor', 103, '10mg', 'May cause muscle pain and weakness'), 
	(4, 'Amoxicillin', 104, '500mg', 'May cause diarrhea and rash'), 
	(5, 'Ciprofloxacin', 105, '250mg', 'May cause tendonitis and joint pain'), 
	(6, 'Zantac', 101, '150mg', 'May cause constipation'), 
	(7, 'Ventolin', 102, '100mcg', 'May cause increased heart rate'), 
	(8, 'Prozac', 103, '20mg', 'May cause insomnia and weight changes'), 
	(9, 'Insulin', 104, 'N/A', 'May cause hypoglycemia'), 
	(10, 'EpiPen', 105, 'N/A', 'May cause anxiety and palpitations'); 

SELECT * FROM Drugs;

INSERT INTO DrugBatches
VALUES 
	('ASP98765', 1, '2023-01-15', '2024-01-15', 100), 
	('IBU23456', 2, '2023-02-20', '2024-02-20', 150), 
	('LIP4321', 3, '2023-03-10', '2024-03-10', 120), 
	('AMO74859', 4, '2023-04-05', '2024-04-05', 200), 
	('CIP23180', 5, '2023-05-12', '2024-05-12', 180), 
	('ZAN80957', 6, '2023-06-18', '2024-06-18', 90), 
	('VEN71097', 7, '2023-07-25', '2024-07-25', 120), 
	('PRO11009', 8, '2023-08-05', '2024-08-05', 160), 
	('INS76724', 9, '2023-09-15', '2024-09-15', 50), 
	('EPI87247', 10, '2023-10-20', '2024-10-20', 30), 
	('VEN71098', 7, '2023-09-25', '2024-09-25', 120); 

SELECT * FROM DrugBatches;

INSERT INTO Inventory
VALUES 
	('ASP98765', 4.99, 10),
    ('IBU23456', 3.99, 7),
    ('LIP4321', 7.99, 5),
    ('AMO74859', 9.99, 15),
    ('CIP23180', 4.99, 6),
    ('ZAN80957', 9.99, 19),
    ('VEN71097', 15.99, 4),
    ('VEN71098', 15.99, 20),
    ('PRO11009', 9.99, 10),
    ('INS76724', 24.99, 12),
    ('EPI87247', 20.99, 10);
    
SELECT * FROM Inventory;

INSERT INTO customers
VALUES 	(1, 'Eugene', 'Krabs', 'M', '1942-11-30', 70, 180, '432-534-6534'),
		(2, 'Thomas', 'Morella', 'M', '1982-01-20', 75, 210, '643-454-6543'),
        (3, 'Barbara', 'Jones', 'F', '1993-04-23', 64, 152, '345-834-2654'),
        (4, 'Mona', 'Lorens', 'F', '1967-01-07', '66.5', '130.28', '773-283-8973'),
        (5, 'Katti', 'Dossett', 'F', '1983-08-15', '93.58', '206.21', '947-808-5125'),
        (6, 'Ray', 'Tomsett', 'M', '2001-02-03', '64.39', '155.22', '535-931-1197'),
        (7, 'Jamima', 'McGarvie', 'F', '1964-07-25', '91.72', '203.08', '378-332-2246'),
        (8, 'Perry', 'Skells', 'M', '1955-12-14', '77.84', '204.29', '280-347-9782'),
        (9, 'Ronni', 'Sharrock', 'F', '1955-03-24', '81.48', '228.04', '674-608-4507'),
        (10, 'Milly', 'Lackham', 'F', '2003-04-22', '62.85', '167.62', '427-132-0205'),
        (11, 'Naomi', 'Rosbrough', 'F', '2007-03-31', '37.27', '102.54', '626-128-3708'),
        (12, 'Albert', 'De Maria', 'M', '1987-05-21', '64.94', '239.79', '453-432-7673'),
        (13, 'Nessa', 'Kerner', 'F', '1978-09-20', '55.36', '142.12', '589-326-2197'),
        (14, 'Duke', 'Hellcat', 'M', '1991-08-16', '73.22', '230.35', '914-787-3900'),
        (15, 'Leonid', 'Peaseman', 'M', '1989-08-01', '68.27', '190.43', '337-721-4687');

SELECT * FROM customers;
	
INSERT INTO orders
VALUES (1, 1, 45.98, '2023-11-01'),
		(2, 2, 4.99, '2023-11-01'),
        (3, 3, 25.98, '2023-11-01'),
        (4, 4, 20.99, '2023-11-01'),
        (5, 2, 3.99, '2023-11-02'),
        (6, 5, 22.97, '2023-11-02'),
        (7, 1, 24.99, '2023-11-02'),
        (8, 11, 9.99, '2023-11-03'),
        (9, 4, 13.98, '2023-11-03'),
        (10, 7, 7.99, '2023-11-03');

SELECT * FROM orders;

INSERT INTO Doctors 
VALUES
    ('D1001-A', 'Dr. Smith', 'Neurologist', 'St. John''s Hospital'),
    ('D1002-B', 'Dr. Johnson', 'Pulmonologist', 'Mercy Medical Center'),
    ('D1003-C', 'Dr. Williams', 'Cardiologist', 'City General Hospital'),
    ('D1004-D', 'Dr. Davis', 'Orthopedic', 'Oakwood Hospital'),
    ('D1005-E', 'Dr. Anderson', 'Oncologist', 'Memorial Hospital'),
    ('D1006-F', 'Dr. Martinez', 'Gastroenterologist', 'Riverside Clinic'),
    ('D1007-G', 'Dr. Taylor', 'Pediatrician', 'Greenfield Hospital'),
    ('D1008-H', 'Dr. Walker', 'Dermatologist', 'Pinecrest Medical'),
    ('D1009-I', 'Dr. Hall', 'Psychiatrist', 'Elmwood Clinic'),
    ('D1010-J', 'Dr. Scott', 'Endocrinologist', 'Parkside Hospital'),
    ('D1011-K', 'Dr. White', 'Neurosurgeon', 'Maplewood Medical'),
    ('D1012-L', 'Dr. Harris', 'Anesthesiologist', 'Lakeside Hospital'),
    ('D1013-M', 'Dr. Turner', 'Plastic Surgeon', 'Sunnyside Clinic'),
    ('D1014-N', 'Dr. King', 'Urologist', 'Hilltop Medical'),
    ('D1015-O', 'Dr. Young', 'Ophthalmologist', 'Valley View Hospital'),
    ('D1016-P', 'Dr. Adams', 'ENT Specialist', 'Northside Medical'),
    ('D1017-Q', 'Dr. Thompson', 'Pathologist', 'Eastside Wellness Center'),
    ('D1018-R', 'Dr. Garcia', 'Radiologist', 'Westend Hospital'),
    ('D1019-S', 'Dr. Rodriguez', 'Rheumatologist', 'Central Clinic'),
    ('D1020-T', 'Dr. Lee', 'General Surgeon', 'Metropolitan Hospital');

SELECT * FROM Doctors;
    
INSERT INTO OrderContains
VALUES
	(1, 'INS76724', 'D1020-T'),
    (1, 'EPI87247', 'D1020-T'),
    (2, 'ASP98765', NULL),
    (3, 'VEN71097', 'D1003-C'),
    (3, 'AMO74859', NULL),
    (4, 'EPI87247', 'D1020-T'),
    (5, 'IBU23456', NULL),
    (6, 'ASP98765', NULL),
    (6, 'LIP4321', 'D1004-D'),
    (6, 'ZAN80957', NULL),
    (7, 'INS76724', 'D1020-T'),
    (8, 'AMO74859', 'D1007-G'),
    (9, 'IBU23456', NULL),
    (9, 'PRO11009', 'D1011-K'),
    (10, 'LIP4321', 'D1003-C');

SELECT * FROM OrderContains;


-- Find all Customers that purchased drugs with Batch IDs INS76724 or ASP98765
SELECT OrderContains.batch_id, customers.customer_id
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id 
INNER JOIN OrderContains ON Orders.order_id = OrderContains.order_id
WHERE OrderContains.batch_id = 'INS76724'
OR OrderContains.batch_id = 'ASP98765';

-- Find the name of the drug that doctors prescribe the most
SELECT drugs.drug_name, COUNT(*) AS prescribed_count
FROM OrderContains
INNER JOIN DrugBatches ON OrderContains.batch_id = DrugBatches.batch_id
INNER JOIN drugs ON DrugBatches.drug_id = drugs.drug_id
WHERE OrderContains.doc_id IS NOT NULL
GROUP BY drugs.drug_name
HAVING COUNT(*) = (
	SELECT COUNT(*)
    FROM OrderContains
    INNER JOIN DrugBatches ON OrderContains.batch_id = DrugBatches.batch_id
	INNER JOIN drugs ON DrugBatches.drug_id = drugs.drug_id
    WHERE OrderContains.doc_id IS NOT NULL
    GROUP BY drugs.drug_name
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
ORDER BY prescribed_count DESC;

 -- Find the total number of prescriptions each doctor has made, and order the doctors by this count.
SELECT 
    d.doc_name,
    COUNT(DISTINCT oc.order_id) AS TotalPrescriptions
FROM 
    Doctors d
JOIN OrderContains oc ON d.doc_id = oc.doc_id
GROUP BY 
    d.doc_name
ORDER BY 
    TotalPrescriptions DESC;

-- Find the total revenue generated from orders,number of unique drugs,most recent order date, number of batches each company has in inventory
SELECT 
    c.company_name,
    SUM(o.order_total) AS TotalRevenue,
    COUNT(DISTINCT db.drug_id) AS UniqueDrugsOrdered,
    MAX(o.order_date) AS MostRecentOrderDate,
    COUNT(DISTINCT i.batch_id) AS NumberOfBatchesInInventory,
    COUNT(DISTINCT d.drug_id) AS NumberOfDrugs
FROM 
    Companies AS c
JOIN 
    Drugs AS d ON c.company_id = d.company_id
JOIN 
    DrugBatches AS db ON d.drug_id = db.drug_id
JOIN 
    Inventory AS i ON db.batch_id = i.batch_id
LEFT JOIN 
    OrderContains AS oc ON i.batch_id = oc.batch_id
LEFT JOIN 
    Orders AS o ON oc.order_id = o.order_id
GROUP BY 
    c.company_name
ORDER BY TotalRevenue DESC;

