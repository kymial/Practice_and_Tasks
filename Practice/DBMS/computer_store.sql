CREATE DATABASE computer_store;

DROP DATABASE computer_store;

use computer_store;


CREATE TABLE computer_store.product(
	product_code VARCHAR(100) PRIMARY KEY,
    product_spec TEXT,
    product_reco VARCHAR(100),
    product_price INT,
    product_date DATETIME
);
 
 CREATE TABLE computer_store.part(
	part_code VARCHAR(10) PRIMARY KEY,
    part_name VARCHAR(35) UNIQUE NOT NULL,
    part_category VARCHAR(35),
    part_price INT,
    part_vol int,
    part_date DATETIME NOT NULL
);

CREATE TABLE computer_store.sale(
	sale_code VARCHAR(10) PRIMARY KEY,
    product_code VARCHAR(100) NOT NULL,
    sale_date DATETIME NOT NULL,
    `as` ENUM('가능', '불가능') NOT NULL,
    customer_code INT NOT NULL,
    FOREIGN KEY(product_code) REFERENCES product(product_code),
    FOREIGN KEY(customer_code) REFERENCES computer_store.customer(customer_code)
);

CREATE TABLE computer_store.com_repair(
	repair_code VARCHAR(10) PRIMARY KEY,
    repair_content TEXT NOT NULL,
	repair_part_code VARCHAR(10),
    `as` ENUM('가능', '불가능') NOT NULL,
    customer_code INT NOT NULL,
    FOREIGN KEY(repair_part_code) REFERENCES computer_store.part(part_code),
    FOREIGN KEY(customer_code) REFERENCES computer_store.customer(customer_code)
);
    
CREATE TABLE computer_store.customer(
	customer_code INT PRIMARY KEY,
    name VARCHAR(35) NOT NULL,
    tel_number INT NOT NULL,
    sale_code VARCHAR(10),
    repair_code VARCHAR(10)
    );
    
    
    ALTER TABLE computer_store.customer
    ADD FOREIGN KEY (sale_code) REFERENCES computer_store.sale(sale_code);
    
    ALTER TABLE computer_store.customer
    ADD FOREIGN KEY (repair_code) REFERENCES computer_store.com_repair(repair_code);