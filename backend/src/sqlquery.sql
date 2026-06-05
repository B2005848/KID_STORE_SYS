﻿
CREATE TABLE Roles
(
    role_id INT PRIMARY KEY IDENTITY(1,1),
    role_name NVARCHAR(50) NOT NULL UNIQUE,
    description NVARCHAR(255)
);

--Test

CREATE TABLE Users
(
    user_id INT PRIMARY KEY IDENTITY(1,1),
    full_name NVARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    password_hash VARCHAR(255) NOT NULL,
    salt VARCHAR(255) NOT NULL,
    gender NVARCHAR(10),
    birth_date DATE,
    avatar VARCHAR(255),
    status BIT DEFAULT 1,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    role_id INT NOT NULL,
    CONSTRAINT FK_Users_Roles FOREIGN KEY(role_id)
    REFERENCES Roles(role_id)

);


--Danh mục nhiều cấp, có thể có danh mục con
CREATE TABLE Categories
(
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name NVARCHAR(100) NOT NULL,
    -- ao-thun-tre-em: Áo thun trẻ em
    slug VARCHAR(150) UNIQUE,
    description NVARCHAR(255),
    image_url VARCHAR(255),
    status BIT DEFAULT 1,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),

    parent_id INT NULL,

    CONSTRAINT FK_Categories_Parent
    FOREIGN KEY(parent_id)
    REFERENCES Categories(category_id)
);

CREATE TABLE Brands
(
    brand_id INT PRIMARY KEY IDENTITY(1,1),
    brand_name NVARCHAR(100) NOT NULL,
    logo_url VARCHAR(255),
    country NVARCHAR(100),
    description NVARCHAR(255),
    status BIT DEFAULT 1,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Products
(
    product_id INT PRIMARY KEY IDENTITY(1,1),

    product_name NVARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE,
    sku VARCHAR(50) UNIQUE,

    category_id INT NOT NULL,
    brand_id INT NOT NULL,

    description NVARCHAR(MAX),
    short_description NVARCHAR(500),

    thumbnail VARCHAR(255),

    price DECIMAL(18,2) NOT NULL,
    discount_price DECIMAL(18,2),

    -- Cân nặng của sản phẩm, ví dụ: đồ chơi có thể nặng 0.5kg thì insert vào đây 0.5, đơn vị là kg, 5kg thì insert vào đây 5 
    weight DECIMAL(10,2),

    -- Độ tuổi phù hợp với sản phẩm, ví dụ: quần áo trẻ em có thể có độ tuổi từ 0-12
    age_from INT,
    age_to INT,

    status BIT DEFAULT 1,

    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Products_Category
    FOREIGN KEY(category_id)
    REFERENCES Categories(category_id),

    CONSTRAINT FK_Products_Brand
    FOREIGN KEY(brand_id)
    REFERENCES Brands(brand_id)
);

CREATE TABLE ProductImages
(
    image_id INT PRIMARY KEY IDENTITY(1,1),

    product_id INT NOT NULL,

    image_url VARCHAR(255) NOT NULL,

    is_main BIT DEFAULT 0,

    CONSTRAINT FK_ProductImages_Product
    FOREIGN KEY(product_id)
    REFERENCES Products(product_id)
);

CREATE TABLE ProductVariants
(
    variant_id INT PRIMARY KEY IDENTITY(1,1),

    product_id INT NOT NULL,

    size NVARCHAR(50),
    color NVARCHAR(50),
    material NVARCHAR(100),

    additional_price DECIMAL(18,2) DEFAULT 0,

    stock_quantity INT DEFAULT 0,

    sku VARCHAR(100) UNIQUE,

    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_ProductVariants_Product
    FOREIGN KEY(product_id)
    REFERENCES Products(product_id),

    CONSTRAINT UQ_ProductVariant UNIQUE(product_id, size, color, material)
);

CREATE TABLE Addresses
(
    address_id INT PRIMARY KEY IDENTITY(1,1),

    user_id INT NOT NULL,

    receiver_name NVARCHAR(100),
    receiver_phone VARCHAR(15),

    province NVARCHAR(100),
    ward NVARCHAR(100),

    detail_address NVARCHAR(255),

    is_default BIT DEFAULT 0,

    CONSTRAINT FK_Addresses_User
    FOREIGN KEY(user_id)
    REFERENCES Users(user_id)
);

CREATE TABLE Cart
(
    cart_id INT PRIMARY KEY IDENTITY(1,1),

    user_id INT NOT NULL UNIQUE,

    created_at DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Cart_User
    FOREIGN KEY(user_id)
    REFERENCES Users(user_id)
);

CREATE TABLE CartItems
(
    cart_item_id INT PRIMARY KEY IDENTITY(1,1),

    cart_id INT NOT NULL,
    variant_id INT NOT NULL,

    quantity INT NOT NULL,

    CONSTRAINT FK_CartItems_Cart
    FOREIGN KEY(cart_id)
    REFERENCES Cart(cart_id),

    CONSTRAINT FK_CartItems_Variant
    FOREIGN KEY(variant_id)
    REFERENCES ProductVariants(variant_id),

    CONSTRAINT UQ_CartItems
    UNIQUE(cart_id, variant_id)
);

CREATE TABLE Coupons
(
    coupon_id INT PRIMARY KEY IDENTITY(1,1),

    coupon_code VARCHAR(50) UNIQUE,
    coupon_name NVARCHAR(100),

    discount_type NVARCHAR(20),

    discount_value DECIMAL(18,2),

    min_order_value DECIMAL(18,2),

    start_date DATETIME,
    end_date DATETIME,

    quantity INT,

    status BIT DEFAULT 1,

    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Orders
(
    order_id INT PRIMARY KEY IDENTITY(1,1),

    order_code VARCHAR(50) UNIQUE,

    user_id INT NOT NULL,

    address_id INT NOT NULL,

    receiver_name NVARCHAR(100),

    receiver_phone VARCHAR(15),

    province NVARCHAR(100),

    ward NVARCHAR(100),

    address_detail NVARCHAR(255),

    coupon_id INT NULL,

    total_amount DECIMAL
    (18,2),

    discount_amount DECIMAL
    (18,2) DEFAULT 0,

    shipping_fee DECIMAL
    (18,2) DEFAULT 0,

    final_amount DECIMAL
    (18,2),

    payment_method NVARCHAR
    (20),

    payment_status NVARCHAR
    (20)
        CHECK
    (payment_status IN
    ('Pending','Paid','Failed','Refunded')),

    order_status NVARCHAR
    (20)
        CHECK
    (order_status IN
    (
        'Pending',
        'Confirmed',
        'Shipping',
        'Delivered',
        'Cancelled'
    )),

    note NVARCHAR
    (500),

    created_at DATETIME DEFAULT GETDATE
    (),

    CONSTRAINT FK_Orders_User
    FOREIGN KEY
    (user_id)
    REFERENCES Users
    (user_id),

    CONSTRAINT FK_Orders_Address
    FOREIGN KEY
    (address_id)
    REFERENCES Addresses
    (address_id),

    CONSTRAINT FK_Orders_Coupon
    FOREIGN KEY
    (coupon_id)
    REFERENCES Coupons
    (coupon_id)
);

CREATE TABLE OrderDetails
(
    order_detail_id INT PRIMARY KEY IDENTITY(1,1),

    order_id INT NOT NULL,

    variant_id INT NOT NULL,

    quantity INT NOT NULL,

    unit_price DECIMAL(18,2) NOT NULL,

    total_price DECIMAL(18,2) NOT NULL,

    CONSTRAINT FK_OrderDetails_Order
    FOREIGN KEY(order_id)
    REFERENCES Orders(order_id),

    CONSTRAINT FK_OrderDetails_Variant
    FOREIGN KEY(variant_id)
    REFERENCES ProductVariants(variant_id)
);

CREATE TABLE Payments
(
    payment_id INT PRIMARY KEY IDENTITY(1,1),

    order_id INT NOT NULL UNIQUE,

    payment_code VARCHAR(100),

    amount DECIMAL(18,2),

    payment_status NVARCHAR(20),

    paid_at DATETIME,

    CONSTRAINT FK_Payments_Order
    FOREIGN KEY(order_id)
    REFERENCES Orders(order_id)
);

CREATE TABLE Reviews
(
    review_id INT PRIMARY KEY IDENTITY(1,1),

    product_id INT NOT NULL,

    user_id INT NOT NULL,

    rating INT
        CHECK(rating BETWEEN 1 AND 5),

    comment NVARCHAR(1000),

    created_at DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Reviews_Product
    FOREIGN KEY(product_id)
    REFERENCES Products(product_id),

    CONSTRAINT FK_Reviews_User
    FOREIGN KEY(user_id)
    REFERENCES Users(user_id),

    CONSTRAINT UQ_Review
    UNIQUE(user_id, product_id)
);

CREATE TABLE InventoryTransactions
(
    transaction_id INT PRIMARY KEY IDENTITY(1,1),

    variant_id INT NOT NULL,

    quantity INT NOT NULL,

    transaction_type NVARCHAR(20)
        CHECK(transaction_type IN (
        'IMPORT',
        'EXPORT',
        'RETURN',
        'CANCEL'
    )),

    note NVARCHAR(255),

    created_at DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_InventoryTransactions_Variant
    FOREIGN KEY(variant_id)
    REFERENCES ProductVariants(variant_id)
);

/* 
    Database Schema Overview:
Roles
 └── Users

Users
 ├── Addresses
 ├── Cart
 ├── Orders
 └── Reviews

Categories
 └── Products

Brands
 └── Products

Products
 ├── ProductImages
 ├── ProductVariants
 └── Reviews

Cart
 └── CartItems

ProductVariants
 ├── CartItems
 ├── OrderDetails
 └── InventoryTransactions

Coupons
 └── Orders

Orders
 ├── OrderDetails
 └── Payments

 */

GO

CREATE TRIGGER TRG_Users_UpdatedAt
ON Users
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Users
    SET updated_at = GETDATE()
    FROM Users u
        INNER JOIN inserted i
        ON u.user_id = i.user_id;
END;
GO

CREATE TRIGGER TRG_Categories_UpdatedAt
ON Categories
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Categories
    SET updated_at = GETDATE()
    FROM Categories c
        INNER JOIN inserted i
        ON c.category_id = i.category_id;
END;
GO

CREATE TRIGGER TRG_Brands_UpdatedAt
ON Brands
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Brands
    SET updated_at = GETDATE()
    FROM Brands b
        INNER JOIN inserted i
        ON b.brand_id = i.brand_id;
END;
GO

CREATE TRIGGER TRG_Products_UpdatedAt
ON Products
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Products
    SET updated_at = GETDATE()
    FROM Products p
        INNER JOIN inserted i
        ON p.product_id = i.product_id;
END;
GO

CREATE TRIGGER TRG_ProductVariants_UpdatedAt
ON ProductVariants
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ProductVariants
    SET updated_at = GETDATE()
    FROM ProductVariants pv
        INNER JOIN inserted i
        ON pv.variant_id = i.variant_id;
END;
GO

CREATE TRIGGER TRG_Coupons_UpdatedAt
ON Coupons
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Coupons
    SET updated_at = GETDATE()
    FROM Coupons c
        INNER JOIN inserted i
        ON c.coupon_id = i.coupon_id;
END;
GO