-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;

-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE Category (
    id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Product (
    id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 10,
    category_id INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES Category(id)
);

CREATE TABLE Tag (
    id INT NOT NULL AUTO_INCREMENT,
    tag_name VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE ProductTag (
    id INT NOT NULL AUTO_INCREMENT,
    product_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES Product(id),
    CONSTRAINT fk_tag
        FOREIGN KEY (tag_id)
        REFERENCES Tag(id)
);