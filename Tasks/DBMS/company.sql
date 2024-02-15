CREATE DATABASE company;

USE company;

CREATE TABLE company.department(
	department_code VARCHAR(3) PRIMARY KEY,
    department_name VARCHAR(20) NOT NULL,
    office_location VARCHAR(150) NOT NULL,
    head_employee_number INT
);

CREATE TABLE company.employee(
	employee_number VARCHAR(8) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    address VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    position_id INT NOT NULL,
    department_id INT NOT NULL,
    spervisor_id INT
);

CREATE TABLE company.postion(
	postion_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(20) UNIQUE NOT NULL,
    rolo TEXT
);
