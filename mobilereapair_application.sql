CREATE DATABASE mobilerepair_application;

USE mobilerepair_application;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    phone VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO customers (customer_id, customer_name, phone, email)
VALUES (1, 'Johan', '723456733', 'johan@gmail.com'),
	   (2, 'Hanna',  '724567223', 'hanna@gmail.com'),
	   (3, 'Robert', '725678922', 'robert@gmail.com');
        


SELECT * FROM customers;


CREATE TABLE devices (
    device_id INT PRIMARY KEY AUTO_INCREMENT,
	model VARCHAR(255) NOT NULL,
    manufacture VARCHAR(255),
    purchaseyear INT
);
        
INSERT INTO devices (device_id, model, manufacture, purchaseyear)
VALUES (1, 'S10', 'Samsung', 2000),
	   (2, 'S21+', 'Samsung', 2021),
       (3, 'iphone15', 'Apple', 2022);
    
SELECT * FROM devices;     


CREATE TABLE repairjobs (
    repair_id INT PRIMARY KEY AUTO_INCREMENT,
    device_id INT,
    customer_id INT NOT NULL,
    repair_price INT,
    repaired_delivery_date Date,
    FOREIGN KEY (device_id) REFERENCES devices(device_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


INSERT INTO repairjobs (repair_id, device_id, customer_id, repair_price, repaired_delivery_date)
      VALUES (1, 2, 3, 500, '2024-04-14'),
             (2, 1, 2, 290, '2024-04-19'),
             (3, 3, 1, 1800, '2024-04-28');
     
      
SELECT * FROM  repairjobs; 