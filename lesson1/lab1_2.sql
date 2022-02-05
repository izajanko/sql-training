# Schema creation
# CREATE DATABASE shop;
CREATE DATABASE IF NOT EXISTS shop;

# Active schema creation
USE shop;

# Table creation
CREATE TABLE IF NOT EXISTS user(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    login                   VARCHAR(15)     NOT NULL        UNIQUE,
    registration_date       TIMESTAMP       NOT NULL        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

# AUTO_INCREMENT automatically fill column row with next number
# UNIQUE - column values must have unique values
# DEFAULT $value - set default value when value is not provided during insertion

# Table deletion
# DROP TABLE IF EXISTS user;

# Insert data to table
INSERT INTO user(login) VALUES ('iza98');

# Querying table
SELECT * FROM user;

# Adding another user
INSERT INTO user(login) VALUES ('mis95');

INSERT INTO user(login, registration_date) VALUES ('czesiek_m','2021-12-31 14:45:54');

INSERT INTO user(id, login) VALUES (69, 'kotek69');

INSERT INTO user(login) VALUES ('piesek11');

INSERT INTO user(login) VALUES ('zabka32');

# Create table
CREATE TABLE IF NOT EXISTS offer(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    name                    VARCHAR(15)     NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO
    offer(name)
VALUES
    ('xbox'),
    ('playstation'),
    ('nintendo');

INSERT INTO offer(name) VALUES ('iphone 13');

INSERT INTO offer(name) VALUES ('macbook pro');

SELECT * FROM offer;

# Create table with foreign key
CREATE TABLE IF NOT EXISTS transaction(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    user_id                 INT             NOT NULL,
    cost                    DECIMAL(10, 2)  NOT NULL,
    transaction_date        TIMESTAMP       NOT NULL        DEFAULT CURRENT_TIMESTAMP,
    offer_id                INT             NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)  REFERENCES user(id),
    FOREIGN KEY (offer_id) REFERENCES offer(id)
);

# Example of DECIMAL(4, 2): 34.54 // 4 - cyfry, 2 po przecinku
INSERT INTO transaction(user_id, cost, offer_id) VALUES (1, 23.54, 4);
INSERT INTO transaction(user_id, cost, offer_id) VALUES (1, 1392.54, 3);
INSERT INTO transaction(user_id, cost, offer_id) VALUES (2, 69.69, 1);
INSERT INTO transaction(user_id, cost, offer_id) VALUES (5, 100.13, 5);
INSERT INTO transaction(user_id, cost, offer_id) VALUES (4, 3.50, 2);

SELECT * FROM transaction;
# DELETE FROM transaction where id=7;

# Join tables

SELECT
    u.id as user_id,
    u.login,
    t.id as transaction_id,
    t.cost as transaction_cost,
    o.id as offer_id,
    o.name as offer_name
FROM transaction t
INNER JOIN user u on t.user_id = u.id
INNER JOIN offer o ON t.offer_id = o.id;

SELECT
    u.id as user_id,
    u.login,
    t.id as transaction_id,
    t.cost as transaction_cost,
    o.id as offer_id,
    o.name as offer_name
FROM user u
INNER JOIN transaction t on u.id = t.user_id
INNER JOIN offer o ON t.offer_id = o.id;

# Remove database
DROP table transaction ;

CREATE TABLE IF NOT EXISTS transaction(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    user_id                 INT             NOT NULL,
    cost                    DECIMAL(10, 2)  NOT NULL,
    transaction_date        TIMESTAMP       NOT NULL        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)  REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS transaction_item(
    offer_id                INT       NOT NULL,
    transaction_id          INT       NOT NULL,
    PRIMARY KEY (offer_id, transaction_id),
    FOREIGN KEY (offer_id)  REFERENCES offer(id),
    FOREIGN KEY (transaction_id) REFERENCES transaction(id)
);

SELECT
    u.id as user_id,
    u.login,
    ti.transaction_id,
    t.cost as transaction_cost,
    o.id as offer_id,
    o.name as offer_name
FROM user u
INNER JOIN transaction t on u.id = t.user_id
INNER JOIN transaction_item ti on t.id = ti.transaction_id
INNER JOIN offer o ON ti.offer_id = o.id;

INSERT INTO transaction_item(offer_id, transaction_id) VALUES (1, 2),  (3, 1),  (4, 3),  (5, 3);
INSERT INTO transaction_item(offer_id, transaction_id) VALUES (2, 3);

SELECT * FROM transaction_item;