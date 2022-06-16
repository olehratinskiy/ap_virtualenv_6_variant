CREATE TABLE if not exists user (
user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
username VARCHAR(45) NOT NULL,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
email VARCHAR(45) NOT NULL,
password VARCHAR(200) NOT NULL,
PRIMARY KEY (user_id)
);

CREATE TABLE if not exists img(
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
img longblob,
name VARCHAR(400) NOT NULL,
mimetype VARCHAR(400) NOT NULL,
PRIMARY KEY (id)
) Engine = InnoDB;

CREATE TABLE if not exists item(
item_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(45) NOT NULL,
storage_quantity INT UNSIGNED NOT NULL,
price INT UNSIGNED NOT NULL,
status ENUM('sold out', 'available'),
img_id INT UNSIGNED NOT NULL,
PRIMARY KEY (item_id),
CONSTRAINT img FOREIGN KEY(img_id)
REFERENCES img(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE if not exists orders(
order_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
user_id INT UNSIGNED NOT NULL,
item_id INT UNSIGNED NOT NULL,
item_quantity INT UNSIGNED NOT NULL,
price INT UNSIGNED NOT NULL,
PRIMARY KEY (order_id),
CONSTRAINT user_orders FOREIGN KEY(user_id)
REFERENCES user(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT orders_item FOREIGN KEY(item_id)
REFERENCES item(item_id) ON DELETE CASCADE ON UPDATE CASCADE
);
