-- Stores
CREATE TABLE Stores (
    Store_ID INT IDENTITY(1, 1) PRIMARY KEY,
    Store_Name NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Street NVARCHAR(100),
    City NVARCHAR(100),
    State NVARCHAR(50),
    Zip_Code NVARCHAR(10)
);

-- Staff
CREATE TABLE Staff (
    Staff_ID INT IDENTITY(1, 1) PRIMARY KEY,
    First_Name NVARCHAR(50) NOT NULL,
    Last_Name NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    IsManager BIT NOT NULL DEFAULT 0
);

-- Staff_Store (Relationship between staff and stores)
CREATE TABLE Staff_Store (
    Staff_ID INT,
    Store_ID INT,
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
);

-- Bike Categories
CREATE TABLE Bike_Categories (
    Category_ID INT IDENTITY(1, 1) PRIMARY KEY,
    Category_Name NVARCHAR(100) NOT NULL
);

-- Bike Brands
CREATE TABLE Bike_Brands (
    Brand_ID INT IDENTITY(1, 1) PRIMARY KEY,
    Brand_Name NVARCHAR(100) NOT NULL
);

-- Products
CREATE TABLE Products (
    Product_ID INT IDENTITY(1, 1) PRIMARY KEY,
    Product_Name NVARCHAR(100) NOT NULL,
    Brand_ID INT,
    Category_ID INT,
    Model_Year INT,
    List_Price DECIMAL(10, 2),
    FOREIGN KEY (Brand_ID) REFERENCES Bike_Brands(Brand_ID),
    FOREIGN KEY (Category_ID) REFERENCES Bike_Categories(Category_ID)
);

-- Customers
CREATE TABLE Customers (
    Customer_ID INT IDENTITY(1, 1) PRIMARY KEY,
    First_Name NVARCHAR(50) NOT NULL,
    Last_Name NVARCHAR(50) NOT NULL,
    Credit_Card_Encrypted NVARCHAR(MAX),
    Credit_Card_PIN_Encrypted NVARCHAR(MAX),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Street NVARCHAR(100),
    City NVARCHAR(100),
    State NVARCHAR(50),
    Zip_Code NVARCHAR(10)
);

-- Orders
CREATE TABLE Orders (
    Order_ID INT IDENTITY(1, 1) PRIMARY KEY,
    Customer_ID INT,
    Staff_ID INT,
    Store_ID INT,
    Order_Date DATETIME,
    Discount DECIMAL(5, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
);

-- Order_Items
CREATE TABLE Order_Items (
    Order_Item_ID INT IDENTITY(1, 1) PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Source_Store_ID INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (Source_Store_ID) REFERENCES Stores(Store_ID)
);

-- Stock
CREATE TABLE Stock (
    Stock_ID INT IDENTITY(1, 1) PRIMARY KEY,
    Store_ID INT,
    Product_ID INT,
    Quantity INT,
    FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);