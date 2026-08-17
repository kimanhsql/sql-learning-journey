USE ProductSalesManagement;
GO

-- ============================================================
-- Requirement 2
-- Create the Customers table.
-- Original table: KHACHHANG
-- ============================================================

CREATE TABLE CUSTOMERS
(
	CustomerID VARCHAR(4),
	FullName NVARCHAR(40),
	Address NVARCHAR(50),
	PhoneNumber VARCHAR(20),
	DateOfBirth SMALLDATETIME,
	RegistrationDate SMALLDATETIME,
	SalesAmount MONEY,
	CONSTRAINT PK_CUSTOMERS PRIMARY KEY(CustomerID)
);
GO

-- ============================================================
-- Create the Employees table.
-- Original table: NHANVIEN
-- ============================================================

CREATE TABLE EMPLOYEES
(
	EmployeeID VARCHAR(4),
	FullName NVARCHAR(40),
	PhoneNumber VARCHAR(20),
	HireDate SMALLDATETIME,
	CONSTRAINT PK_EMPLOYEES PRIMARY KEY(EmployeeID)
);
GO

-- ============================================================
-- Create the Products table.
-- Original table: SANPHAM
-- ============================================================

CREATE TABLE PRODUCTS
(
	ProductID VARCHAR(4),
	ProductName NVARCHAR(40),
	Unit NVARCHAR(20),
	CountryOfOrigin NVARCHAR(40),
	Price MONEY,
	CONSTRAINT PK_PRODUCTS PRIMARY KEY(ProductID)
);
GO

-- ============================================================
-- Create the Invoices table.
-- Original table: HOADON
-- ============================================================

CREATE TABLE INVOICES
(
	InvoiceID INT,
	InvoiceDate SMALLDATETIME,
	CustomerID VARCHAR(4),
	EmployeeID VARCHAR(4),
	TotalAmount MONEY,
	CONSTRAINT PK_INVOICES PRIMARY KEY(InvoiceID),
	CONSTRAINT FK_KHACHHANG_HD FOREIGN KEY(CustomerID)
								REFERENCES CUSTOMERS(CustomerID),
	CONSTRAINT FK_NHANVIEN_HD FOREIGN KEY(EmployeeID)
								REFERENCES EMPLOYEES(EmployeeID)
);
GO

-- ============================================================
-- Create the Invoice_Details table.
-- Original table: CTHD
-- ============================================================

CREATE TABLE INVOICE_DETAILS
(
	InvoiceID INT,
	ProductID VARCHAR(4),
	Quantity INT,
	CONSTRAINT PK_INVOICE_DETAILS PRIMARY KEY(InvoiceID,ProductID),
	CONSTRAINT FK_HOADON_CTHD FOREIGN KEY(InvoiceID)
								REFERENCES INVOICES(InvoiceID),
	CONSTRAINT FK_SANPHAM_CTHD FOREIGN KEY(ProductID)
								REFERENCES PRODUCTS(ProductID)
);
GO