USE master
GO
IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'Phase'
)
CREATE DATABASE [Phase]
GO

USE [Phase]
IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL
DROP TABLE dbo.Product

IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
DROP TABLE dbo.Orders

IF OBJECT_ID('dbo.Customer', 'U') IS NOT NULL
DROP TABLE dbo.Customer
GO

CREATE TABLE dbo.Product
(
productID [NVARCHAR](10)		NOT NULL PRIMARY KEY,
customerID [NVARCHAR](10) NOT NULL,
product_Name [NVARCHAR](20)		NOT NULL,
product_Price FLOAT,
product_quantity INT,
);

CREATE TABLE dbo.Orders
(
orderID [NVARCHAR](5)		NOT NULL PRIMARY KEY,
productID [NVARCHAR](10) NOT NULL,
order_Date [NVARCHAR](20)		NOT NULL,
);

CREATE TABLE dbo.Customer
(
customerID [NVARCHAR](5) NOT NULL PRIMARY KEY,
name [NVARCHAR](20) NOT NULL,
address [NVARCHAR](40),
phone [NVARCHAR](20) NOT NULL,
email [NVARCHAR](40) NOT NULL,
)
GO

INSERT INTO dbo.Customer
([customerID],[name],[address],[phone],[email])
VALUES
( N'C01', N'Vivian Do', N'0200 App Rd Houston TX77095', N'565234856', 'viviando@gmail.com'),
( N'C02', N'Anh Nguyen', N'2221 Good Rd Houston TX77095', N'123456789', 'anhng@gmail.com')

INSERT INTO dbo.Product
   ([customerID],[productID],[product_Name],[product_price],[product_quantity])
VALUES
   (N'C01', N'P01', N'Chair', N'89.99', N'20'),
   (N'C02', N'P02', N'Table', N'105.99', N'20') 
   
INSERT INTO dbo.Orders
   ([productID],[orderID],[order_Date])
VALUES
   (N'P01', N'O01', N'06/28/2021'),
   (N'P02', N'O02', N'02/15/2021')
GO

SELECT * FROM dbo.Orders;