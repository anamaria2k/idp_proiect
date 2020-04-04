CREATE TABLE IF NOT EXISTS category (
	categoryId int(11) NOT NULL AUTO_INCREMENT,
	name varchar(200) NOT NULL,
	PRIMARY KEY (categoryId)
);

CREATE TABLE IF NOT EXISTS product (
	productId int(11) NOT NULL AUTO_INCREMENT,
	categoryId int(11),
	name varchar(200) NOT NULL,
	brand varchar(200) NOT NULL,
	description text,
	picture varchar(1000),
	price int(10),
	stock int(11),
	PRIMARY KEY (productId),
	FOREIGN KEY (categoryId) REFERENCES category(categoryId)
);

CREATE TABLE IF NOT EXISTS user (
	userId int(11) NOT NULL AUTO_INCREMENT,
	firstName varchar(200) NOT NULL,
	lastName varchar(200) NOT NULL,
	email varchar(200) NOT NULL,
	address text,
	mobile varchar(200),
	password varchar(200) NOT NULL,
	PRIMARY KEY (userId)
);

CREATE TABLE IF NOT EXISTS order_details (
	orderId int(11) NOT NULL AUTO_INCREMENT,
	userId int(11),
	sessionId varchar(100),
	total int(10),
	orderDate datetime,
	PRIMARY KEY (orderId),
	FOREIGN KEY (userId) REFERENCES user(userId)
);

CREATE TABLE IF NOT EXISTS cart_details (
	itemId int(11) NOT NULL AUTO_INCREMENT,
	productId int(11),
	name varchar(200) NOT NULL,
	brand varchar(200) NOT NULL,
	picture varchar(1000),
	price int(10),
	noPieces int(11),
	sessionId varchar(100),
	orderId int(11),
	PRIMARY KEY (itemId),
	FOREIGN KEY (orderId) REFERENCES order_details(orderId) ON DELETE CASCADE
);