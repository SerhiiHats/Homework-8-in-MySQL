DROP DATABASE MyFunkDB;

CREATE DATABASE MyFunkDB;

USE MyFunkDB;

CREATE TABLE Employees (
id_emp INT AUTO_INCREMENT PRIMARY KEY,
l_name_emp VARCHAR(50) NOT NULL,
f_name_emp VARCHAR(50) NOT NULL,
m_name_emp VARCHAR(50),
phone_emp VARCHAR(15) NOT NULL UNIQUE);

CREATE INDEX l_name_index ON Employees(l_name_emp);                     -- индекс к имени сотрудника добавит упорядочености и скорости к поиску по имени

CREATE TABLE Position_employee (
id_pos INT AUTO_INCREMENT,
id_emp INT NOT NULL,
salary_pos DOUBLE NOT NULL DEFAULT 0,
title_pos VARCHAR(50) NOT NULL DEFAULT 'Trenee',
PRIMARY KEY (id_pos),
FOREIGN KEY (id_emp) REFERENCES Employees (id_emp));

ALTER TABLE Position_employee ADD INDEX title_pos_index (title_pos);   -- индекс к должности сотрудника добавит упорядочености и скорости к поиску по должности сотрудника

CREATE TABLE Description_employee (
id_des INT AUTO_INCREMENT PRIMARY KEY,
id_emp INT NOT NULL UNIQUE,
married_des VARCHAR (15) NOT NULL,
birthday_des DATE NOT NULL,
address_des VARCHAR(50),
FOREIGN KEY (id_emp) REFERENCES Employees (id_emp));

CREATE INDEX married_des_index ON Description_employee (married_des); -- индекс к семейному положению сотрудника добавит упорядочености и скорости к поиску по семейному положению сотрудника

CREATE INDEX birthday_des_index ON Description_employee (birthday_des); -- индекс к дате рождения сотрудника добавит упорядочености и скорости к поиску по дате рождения сотрудника сотрудника


