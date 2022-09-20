USE [PhaseDB]
-- Create a new table called 'Customers' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL
DROP TABLE dbo.Product

IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
DROP TABLE dbo.Orders
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Product
(
productID [NVARCHAR](10)		NOT NULL PRIMARY KEY,
product_Name [NVARCHAR](20)		NOT NULL,
product_Price FLOAT,
product_quantity INT,
);

CREATE TABLE dbo.Orders
(
orderID [NVARCHAR](5)		NOT NULL PRIMARY KEY,
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

-- Insert rows into table 'Customers'
INSERT INTO dbo.Product
   ([productID],[product_Name],[product_price],[product_quantity])
VALUES
   ( N'P01', N'Chair', N'89.99', N'20'),
   ( N'P02', N'Table', N'105.99', N'20') 
   
INSERT INTO dbo.Orders
   ([orderID],[order_Date])
VALUES
   ( N'O01', N'06/28/2021'),
   ( N'O02', N'02/15/2021')

INSERT INTO dbo.Customer
([customerID],[name],[address],[phone],[email])
VALUES
( N'C01', N'Vivian Do', N'0200 App Rd Houston TX77095', N'565234856', 'viviando@gmail.com'),
( N'C02', N'Anh Nguyen', N'2221 Good Rd Houston TX77095', N'123456789', 'anhng@gmail.com')
GO

SELECT name, email, product_Name, order_Date
FROM dbo.Customer AS oc
INNER JOIN dbo.Product AS o
ON oc.customerID = o.productID
INNER JOIN dbo.Orders AS s
ON o.productID = s.orderID