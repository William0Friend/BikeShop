-- Insert sample data into Stores table
INSERT INTO Stores (Store_Name, Phone, Email, Street, City, State, Zip_Code)
VALUES ('Store 1', '555-123-4567', 'store1@example.com', '123 Main St', 'New York', 'NY', '10001'),
       ('Store 2', '555-987-6543', 'store2@example.com', '456 Second Ave', 'Chicago', 'IL', '60601'),
       ('Store 3', '555-654-3210', 'store3@example.com', '789 Third Blvd', 'Los Angeles', 'CA', '90001'),
       ('Store 4', '555-258-3690', 'store4@example.com', '1020 Fourth St', 'San Francisco', 'CA', '94103');

-- Insert sample data into Staff
INSERT INTO Staff (First_Name, Last_Name, Email, Phone, isManager)
VALUES ('Alex', 'Doe', 'john.doe@example.com', '555-111-2222',0),
       ('Janemantha', 'Smith', 'jane.smith@example.com', '555-333-4444',0),
       ('Bobamina', 'Brown', 'bob.brown@example.com', '555-555-6666',0),
       ('Alice', 'Wonderland', 'alice.johnson@example.com', '555-777-8888',0),
       ('Bruce', 'Lee', 'bruce.lee@example.com', '555-222-3333',1),
       ('Schwartenzenager', 'Martinez', 'samantha.martinez@example.com', '555-444-5555',0),
       ('Lucasista', 'Perez', 'lucas.perez@example.com', '555-666-7777',0),
       ('Sophia', 'Vergara', 'sophia.vergara@example.com', '555-888-9999', 1);

-- Insert sample data into Staff_Store (connect staff with store)
INSERT INTO Staff_Store (Staff_ID, Store_ID)
VALUES (1, 1),
       (2, 1),
       (3, 2),
       (4, 2),
       (5, 3),
       (6, 3),
       (7, 4),
       (8, 4);

-- Insert sample data into Bike_Categories
INSERT INTO Bike_Categories (Category_Name)
VALUES ('Mountain'),
       ('Road'),
       ('Hybrid'),
       ('Electric');

-- Insert sample data into Bike_Brands
INSERT INTO Bike_Brands (Brand_Name)
VALUES ('Brand A'),
       ('Brand B'),
       ('Brand C'),
       ('Brand D'),
       ('Brand E'),
       ('Brand F');

-- Insert sample data into Products
INSERT INTO Products (Product_Name, Brand_ID, Category_ID, Model_Year, List_Price)
VALUES ('Bike 1', 1, 1, 2023, 1000.00),
       ('Bike 2', 2, 2, 2023, 1200.00),
       ('Bike 3', 3, 3, 2023, 1400.00),
       ('Bike 4', 4, 4, 2023, 1600.00),
       ('Bike 5', 5, 1, 2023, 1800.00),
       ('Bike 6', 6, 2, 2023, 2000.00);

       -- Insert sample data into Customers
INSERT INTO Customers (First_Name, Last_Name, Credit_Card_Encrypted, Credit_Card_PIN_Encrypted, Phone, Email, Street, City, State, Zip_Code)
VALUES ('John', 'Doe', 'johndoe1234567890', '1234', '555-1234', 'john.doe@example.com', '123 Main St', 'New York', 'NY', '10001'),
       ('Jane', 'Doe', 'janedoe1234567890', '5678', '555-5678', 'jane.doe@example.com', '456 Elm St', 'Los Angeles', 'CA', '90001'),
       ('Jim', 'Smith', 'jimsmith1234567890', '9012', '555-9012', 'jim.smith@example.com', '789 Pine St', 'Chicago', 'IL', '60601'),
       ('Jill', 'Johnson', 'jilljohnson1234567890', '3456', '555-3456', 'jill.johnson@example.com', '1012 Oak St', 'Houston', 'TX', '77001'),
       ('Jack', 'Brown', 'jackbrown1234567890', '6789', '555-6789', 'jack.brown@example.com', '1123 Cherry St', 'Philadelphia', 'PA', '19019'),
       ('Jenny', 'Williams', 'jennywilliams1234567890', '2345', '555-2345', 'jenny.williams@example.com', '1314 Maple St', 'Phoenix', 'AZ', '85001');

-- Insert sample data into Orders
INSERT INTO Orders (Customer_ID, Staff_ID, Store_ID, Order_Date, Discount)
VALUES (1, 1, 1, '2023-04-01', 0.1),
       (2, 3, 2, '2023-04-02', 0.05),
       (3, 5, 3, '2023-04-03', 0.15),
       (4, 7, 4, '2023-04-04', 0.2);

-- Insert sample data into Order_Items
INSERT INTO Order_Items (Order_ID, Product_ID, Quantity, Source_Store_ID)
VALUES (1, 1, 1, 1),
       (1, 2, 2, 1),
       (1, 3, 3, 1),
       (2, 4, 2, 2),
       (2, 5, 1, 2),
       (2, 6, 3, 2),
       (3, 1, 1, 3),
       (3, 2, 2, 3),
       (3, 3, 3, 3),
       (4, 4, 2, 4),
       (4, 5, 1, 4),
       (4, 6, 3, 4);

       -- Insert sample data into Stock
INSERT INTO Stock (Store_ID, Product_ID, Quantity)
VALUES (1, 1, 10),
       (1, 2, 10),
       (1, 3, 10),
       (1, 4, 10),
       (1, 5, 10),
       (1, 6, 10),
       (2, 1, 10),
       (2, 2, 10),
       (2, 3, 10),
       (2, 4, 10),
       (2, 5, 10),
       (2, 6, 10),
       (3, 1, 10),
       (3, 2, 10),
       (3, 3, 10),
       (3, 4, 10),
       (3, 5, 10),
       (3, 6, 10),
       (4, 1, 10),
       (4, 2, 10),
       (4, 3, 10),
       (4, 4, 10),
       (4, 5, 10),
       (4, 6, 10);