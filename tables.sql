
-- Customers table
CREATE TABLE `Customers` (
    `customer_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)  NOT NULL,
    `email` VARCHAR(100)  NOT NULL,
    `location` VARCHAR(100)  NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert dummy data
INSERT INTO `Customers` (`name`, `email`, `location`)
VALUES
('John Doe', 'john.doe@example.com', 'New York, NY'),
('Jane Doe', 'jane.doe@example.com', 'Los Angeles, CA'),
('Mike Johnson', 'mike.johnson@example.com', 'Chicago, IL'),
('Susan Smith', 'susan.smith@example.com', 'Dallas, TX'),
('David Miller', 'david.miller@example.com', 'Miami, FL');


-- Categories table
CREATE TABLE `Categories` (
    `category_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert dummy data
INSERT INTO `Categories` (`name`)
VALUES
('Electronics'),
('Clothing'),
('Home & Kitchen'),
('Health & Beauty'),
('Books & Toys');



-- Products table
CREATE TABLE `Products` (
    `product_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `cat_id` INT UNSIGNED NOT NULL,
    `name` VARCHAR(50),
    `description` TEXT,
    `price` VARCHAR(50),
    FOREIGN KEY (`cat_id`) REFERENCES `Categories`(`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert dummy data
INSERT INTO `Products` (`cat_id`, `name`, `description`, `price`)
VALUES
(1, 'iPhone 14', 'The latest and greatest smartphone from Apple.', '999.99'),
(2, 'Nike Air Jordan 1', 'A classic sneaker that is always in style.', '150.00'),
(3, 'KitchenAid Stand Mixer', 'A versatile kitchen appliance that can do it all.', '299.99'),
(4, 'Oral-B Electric Toothbrush', 'A powerful toothbrush that will keep your teeth clean and healthy.', '99.99'),
(5, 'Harry Potter and the Sorcerer\'s Stone', 'A classic book that has been enjoyed by millions of readers.', '12.99');



-- Orders table
CREATE TABLE `Orders` (
    `order_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `cust_id` INT UNSIGNED NOT NULL,
    `order_date` TIMESTAMP,
    `total_amount` VARCHAR(20),
    FOREIGN KEY (`cust_id`) REFERENCES `Customers`(`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert dummy data
INSERT INTO `Orders` (`cust_id`, `order_date`, `total_amount`)
VALUES
(1, '2023-11-04 10:00:00', 100.00),
(1, '2023-11-05 11:30:00', 150.00),
(1, '2023-11-06 09:45:00', 80.00),
(2, '2023-11-07 12:00:00', 75.00),
(2, '2023-11-08 16:00:00', 125.00),
(2, '2023-11-09 10:00:00', 120.00),
(3, '2023-11-08 09:00:00', 95.00),
(3, '2023-11-09 10:45:00', 70.00),
(3, '2023-11-10 14:00:00', 50.00),
(4, '2023-11-11 10:00:00', 70.00),
(4, '2023-11-12 16:00:00', 50.00);


-- Order_Items table
CREATE TABLE `Order_Items` (
    `ord_item_id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `ord_id` INT UNSIGNED NOT NULL,
    `package_id` INT UNSIGNED NOT NULL,
    `quantity` INT,
    `unit_price` VARCHAR(50),
    FOREIGN KEY (`ord_id`) REFERENCES `Orders`(`order_id`),
    FOREIGN KEY (`package_id`) REFERENCES `Products`(`product_id`),
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert dummy data
INSERT INTO `Order_Items` (`ord_id`, `package_id`, `quantity`, `unit_price`)
VALUES
(1, 1, 2, 25.99),
(2, 3, 1, 50.00),
(3, 2, 3, 49.99),
(4, 5, 1, 12.99),
(5, 4, 2, 150.00);
