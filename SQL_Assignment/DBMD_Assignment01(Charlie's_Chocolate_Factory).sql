CREATE DATABASE Manufacturer
USE Manufacturer

CREATE SCHEMA Product
CREATE SCHEMA Component

CREATE TABLE Product.Product(
    prod_id INT PRIMARY KEY NOT NULL,
    prod_name  NVARCHAR(50) NULL,
    quantity INT NULL
)

CREATE TABLE Product.Prod_Comp(
    prod_id INT NOT NULL,
    comp_id INT NOT NULL,
    quantity_comp INT,
    PRIMARY KEY (prod_id, comp_id)
);

CREATE TABLE Component.Component(
    comp_id INT PRIMARY KEY NOT NULL,
    comp_name NVARCHAR(50) null,
    description NVARCHAR(50) NULL,
    quantity_comp INT
)

CREATE TABLE Component.Comp_Supp(
    supp_id INT NOT NULL,
    comp_id INT NOT NULL,
    order_date DATE,
    quantity INT
    PRIMARY KEY (supp_id, comp_id)
)

CREATE TABLE Supplier(
    supp_id INT PRIMARY KEY NOT NULL,
    supp_name NVARCHAR(50) NULL,
    supp_location NVARCHAR(50) NULL,
    supp_country NVARCHAR(50) NULL,
    is_active BIT
)

