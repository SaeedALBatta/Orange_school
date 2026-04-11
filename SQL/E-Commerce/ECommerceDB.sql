USE ECommerceDB;

-- Users
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) UNIQUE NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    ------------------
    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL
);
-- Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL,

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL
);
-- Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) CHECK (Price > 0),
    Stock INT CHECK (Stock >= 0),
    CategoryID INT,

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    UserID INT,
    TotalAmount DECIMAL(10,2),

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
-- OrderItems
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    ProductID INT,
    Quantity INT CHECK (Quantity > 0),
    Price DECIMAL(10,2),

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY,
    OrderID INT UNIQUE,
    Amount DECIMAL(10,2),
    Method NVARCHAR(50),

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Reviews
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY,
    UserID INT,
    ProductID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(500),

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Wishlist
CREATE TABLE Wishlist (
    WishlistID INT PRIMARY KEY IDENTITY,
    UserID INT,
    ProductID INT,

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 3 INSERT DATA

INSERT INTO Users (Name, Email, Password)
VALUES 
('Saeed', 'saeed@mail.com', '123'),
('Ali', 'ali@mail.com', '123');

INSERT INTO Categories (Name)
VALUES ('Electronics'), ('Clothing');

INSERT INTO Products (Name, Price, Stock, CategoryID)
VALUES 
('iPhone', 1000, 10, 1),
('T-Shirt', 20, 50, 2);

INSERT INTO Orders (UserID, TotalAmount)
VALUES (1, 1000),
       (2, 20);

INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price)
VALUES 
(1, 1, 1, 1000),
(2, 2, 1, 20);

INSERT INTO Payments (OrderID, Amount, Method)
VALUES 
(1, 1000, 'Credit Card'),
(2, 20, 'Cash');

INSERT INTO Reviews (UserID, ProductID, Rating, Comment)
VALUES 
(1, 1, 5, 'Excellent'),
(2, 2, 4, 'Good');

INSERT INTO Wishlist (UserID, ProductID)
VALUES 
(1, 2),
(2, 1);

-- 4 UPDATE + SOFT DELETE

UPDATE Products
SET Price = 900,
    UpdatedAt = GETDATE()
WHERE ProductID = 1;

-- Soft Delete
UPDATE Products
SET IsDeleted = 1
WHERE ProductID = 2;


-- 5 SCENARIO QUERIES
-- 1 Orders Overview
SELECT o.OrderID, u.Name, o.TotalAmount
FROM Orders o
INNER JOIN Users u ON o.UserID = u.UserID;

-- 2 Available Products
SELECT *
FROM Products
WHERE IsDeleted = 0
ORDER BY Price ASC;

-- 3 Product Ratings
SELECT p.Name, AVG(r.Rating) AS AvgRating
FROM Products p
LEFT JOIN Reviews r ON p.ProductID = r.ProductID
GROUP BY p.Name;

-- 4 Wishlist
SELECT p.Name
FROM Wishlist w
INNER JOIN Products p ON w.ProductID = p.ProductID
WHERE w.UserID = 1;

-- 5 Total Sales per User
SELECT u.Name, SUM(o.TotalAmount) AS TotalSales
FROM Users u
INNER JOIN Orders o ON u.UserID = o.UserID
GROUP BY u.Name;

-- 6 Price Range
SELECT *
FROM Products
WHERE Price BETWEEN 50 AND 1000;

-- 7 Last 5 Orders
SELECT TOP 5 *
FROM Orders
ORDER BY CreatedAt DESC;

