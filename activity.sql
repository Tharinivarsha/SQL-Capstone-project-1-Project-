CREATE TABLE IF NOT EXISTS Salesman(
Salesman_id TEXT PRIMARY KEY,
Name TEXT,
City TEXT,
Comision REAL
);
INSERT INTO Salesman(Salesman_id , Name, City, Comision)VALUES
("5001","John","New york",0.15),
("5002","Robert","Paris",0.13),
("5005","David","London",0.12),
("5006","Willams","Brooklyn",0.16),
("5007","James","San Fransissco",0.11),
("5003","Paul","San Jose",0.10);
CREATE TABLE IF NOT EXISTS Customer (
  customer_id TEXT,
  cust_name TEXT PRIMARY KEY,
  city TEXT,
  grade INTEGER,
  Salesman_id TEXT,
  FOREIGN KEY (Salesman_id) REFERENCES Salesman(Salesman_id)
);
INSERT INTO Customer (customer_id, cust_name, city, grade, Salesman_id) VALUES
('3002', 'nick rimando', 'new york', 100, '5001'),
('3007', 'brad davis', 'new york', 200, '5001'),
('3005', 'graham zusi', 'california', 200, '5002'),
('3008', 'julian green', 'london', 300, '5002'),
('3004', 'fabian johnson', 'paris', 300, '5006'),
('3009', 'geoff cameron', 'berlin', 100, '5003'),
('3003', 'jozy altidor', 'moscow', 200, '5007'),
('3001', 'brad guzan', 'london', NULL, '5005');
CREATE TABLE IF NOT EXISTS Orders (
  ord_no TEXT PRIMARY KEY,
  purch_amt REAL,
  ord_date TEXT,
  customer_id TEXT,
  Salesman_id TEXT,
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (Salesman_id) REFERENCES Salesman(Salesman_id)
);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, Salesman_id) VALUES
  ('70001', 150.5, '2012-10-05', '3005', '5002'),
  ('70009', 270.65, '2012-09-10', '3001', '5001'),
  ('70002', 65.26, '2012-10-05', '3002', '5003'),
  ('70004', 110.5, '2012-08-17', '3009', '5007'),
  ('70007', 948.5, '2012-09-10', '3005', '5005'),
  ('70005', 2400.6, '2012-07-27', '3007', '5006');
SELECT * FROM Orders
SELECT * FROM Salesman
SELECT * FROM Customer
SELECT Customer.cust_name, Salesman.name
From Customer
JOIN Salesman ON Customer.Salesman_id = Salesman.Salesman_id;
SELECT Orders.ord_no, Customer.cust_name, Orders.customer_id, Orders.Salesman_id
FROM Orders
JOIN Customer ON Orders.customer_id = Customer.customer_id
JOIN Salesman ON Orders.Salesman_id = Salesman.Salesman_id
WHERE Customer.city <> Salesman.city;
SELECT Orders.ord_no, Customer.cust_name
FROM Orders
JOIN Customer On Orders.customer_id = Customer.customer_id;
SELECT Customer.cust_name AS "Customer", Customer.grade AS "Grade"
FROM Orders
JOIN Salesman ON Orders.Salesman_id = Salesman.Salesman_id
JOIN Customer ON Orders.customer_id = Customer.customer_id
WHERE Customer.grade IS NOT NULL;