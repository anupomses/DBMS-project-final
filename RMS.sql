CREATE DATABASE restaurant_management_system;
------------------------------------------------------
CREATE TABLE Users(
    user_id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50),
    email varchar(50),
    phone varchar(20),
    role ENUM('manager', 'staff', 'admin', 'customer')
    );
	
	INSERT INTO users
VALUES(null, 'Amit', 'amit@gmail.com', 64578347, 'customer'), (null, 'Kamal', 'kamu@gmail.com', 78433498, 'manager'),
(NULL, 'Badhon', 'bd@gmail.com', '0175557283', 'customer'), (NULL, 'Dulal', 'dulu@gmail.com', '43546466', 'admin');
	-------------------------------------------------------
	CREATE TABLE menu(
    item_id int primary KEY AUTO_INCREMENT,
    name varchar(70),
    description varchar(150),
    price decimal(7,2),
    available varchar(50)
    );
	INSERT INTO `menu`
	VALUES (NULL, 'Cheese burgers', 'good rating', '570', 'not available'),
	 (NULL, 'fried rice', 'oily and tasty', '380', 'available'),
	 (NULL, 'chicken sandwich', 'tasty and good', '200', 'available');
	-------------------------------------------------------
	CREATE TABLE tables(
    table_id int PRIMARY KEY AUTO_INCREMENT,
    table_number int,
    capacity varchar(50),
    status ENUM('available', 'occupied', 'reserved')
    );
	
	INSERT INTO tables
VALUES(null, 1, 6, 'reserved'), (NULL, '2', '5', 'available'), (NULL, '3', '6', 'occupied')

	-----------------------------------------------------------------
	CREATE table orders(
    order_id int PRIMARY KEY AUTO_INCREMENT,
    user_id int,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    table_id int,
    FOREIGN KEY(table_id) REFERENCES tables(table_id),
    order_date date,
    status ENUM('pending', 'cancelled', 'served')
    );
	INSERT INTO `orders` 
	VALUES (NULL, '1', '1', '2024-06-04', 'pending'),
	(NULL, '5', '1', '2020-06-01', 'cancelled'), (NULL, '3', '1', '2022-06-16', 'served'),
	(NULL, '1', '1', '2023-06-27', 'cancelled');
	----------------------------------------------------------------------
	CREATE TABLE order_items(
    ord_item_id INt PRIMARY KEY AUTO_INCREMENT,
    ord_id int,
    FOREIGN KEY(ord_id) REFERENCES orders(order_id),
    item_id int,
    FOREIGN KEY(item_id) REFERENCES menu(item_id),
    quantity int,
    price decimal(7,2)
    );
	
	INSERT INTO `order_items` 
	VALUES (NULL, '1', '2', '2 ', '870'),
	(NULL, '1', '3', '5', '1150'),(NULL, '3', '3', '5', '1230');
	-------------------------------------------------------------------------
	CREATE TABLE invoices(
    id int PRIMARY KEY AUTO_INCREMENT,
    ord_id int,
    FOREIGN KEY(ord_id) REFERENCES orders(order_id),
    amount decimal(7,2),
    pay_method ENUM('cash', 'card', 'online'),
    date date
    );
	
	INSERT INTO `invoices` VALUES 
	(NULL, '3', '500', 'cash', '2023-06-01'),
	(NULL, '1', '360', 'online', '2024-06-04');
	--------------------------------------------------------------------------
	CREATE table suppliers(
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50),
    contact varchar(20)
    );
	
	INSERT INTO `suppliers` (`id`, `name`, `contact`) VALUES (NULL, 'Satya', '32878'), (NULL, 'Anupom', '673428'),
	(NULL, 'sagor', '34267834'), (NULL, 'arnob', '7634238743');
	----------------------------------------------------------------------------
	CREATE TABLE reservation(
    id int PRIMARY KEY AUTO_INCREMENT,
    user_id int,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    table_id int,
    FOREIGN KEY(table_id) REFERENCES tables(table_id),
    reserve_date date,
    status ENUM('pending', 'confirm', 'cancelled')
    );
	
	INSERT INTO `reservation` 
	VALUES (NULL, '1', '2', '2024-06-03', 'confirm'), 
	(NULL, '3', '2', '2024-06-07', 'pending'),
	(NULL, '5', '3', '2024-06-04', 'cancelled');
	-------------------------------------------------------------------------------------------
	CREATE TABLE employees(
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50),
    phone varchar(20),
    shift_start varchar(10),
    shift_end varchar(10)
    );
	INSERT INTO employees
VALUES(null, 'Alom', 241561, '10:30am', '4:30pm'), (null, 'Amal', 674783, '4:30pm', '9:30pm');
 (NULL, 'Satya', '32878', '9:30 am', '4:30 pm'), (NULL, 'Anupom', '673428', '4:30 pm', '9:30 pm');
	------------------------------------------------------------------------------------------------
	CREATE TABLE feedback(
    id int PRIMARY KEY AUTO_INCREMENT,
    user_id int,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    ord_id int,
    FOREIGN KEY(ord_id) REFERENCES orders(order_id),
    comments varchar(200),
    rating varchar(20)
    );
	INSERT INTO `feedback` 
	VALUES (NULL, '3', '1', 'served late', '3'),
	(NULL, '5', '3', 'tasty and less cost', '4');