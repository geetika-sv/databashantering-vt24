CREATE DATABASE hotels_application;

USE hotels_application;

CREATE TABLE hotels (
    hotel_id INT PRIMARY KEY, -- SAKNAR AUTO_INCREMENT
    hotel_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255)
);

DROP TABLE hotels;

CREATE TABLE hotels (
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO hotels (hotel_name) VALUES ('Miami Beach Villa');

SELECt * FROM hotels; -- Hämta alla kolumner för alla hotell
SELECT hotel_id, hotel_name FROM hotels; -- hämta vissa kolumner för alla hotell
SELECT hotel_id, hotel_name FROM hotels WHERE hotel_id = 1; -- Hämta vissa kolumner för ett hotell

UPDATE hotels SET 
    address='Miami street 5',
    phone='0725746723',
    email='miami@hotel.com'
WHERE hotel_id= 1;

INSERT INTO hotels (hotel_name) VALUES ('mumbo zumbo');

SELECT * FROM hotels WHERE hotel_name = 'mumbo zumbo' ;

DELETE FROM hotels WHERE hotel_id = 3;

SELECT * FROM hotels;


CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT NOT NULL,
    room_number VARCHAR(255) NOT NULL,
    room_type VARCHAR(255),
    price DECIMAL(10, 2),
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)    
);

INSERT INTO rooms (hotel_id, room_number, room_type, price)
VALUES (1, 101, 'Single',100),
	   (1,102, 'Double', 150),
       (2,101, 'Single', 120),
       (2,102, 'Double', 200);
       
       
SELECT * FROM rooms;     


CREATE TABLE guests (
    guest_id INT PRIMARY KEY AUTO_INCREMENT,
    room_id INT NOT NULL,
    guest_name VARCHAR(255) NOT NULL,
    phone VARCHAR(255),
    email VARCHAR(255),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)    
);


INSERT INTO guests (room_id, guest_name, phone, email)
      VALUES (1, 'kalle', '072-123 45 67', 'kalle@gmail.com'),
      (2, 'Anna', '07233555', NULL),
      (3, 'Mats', '07239855', 'mats@gmail.com'),
      (4, 'Petra', '072342155', NULL);
      
SELECT * FROM  guests; 





