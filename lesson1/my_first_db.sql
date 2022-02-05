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

# Create table with foreign key
CREATE TABLE IF NOT EXISTS transaction(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    user_id                 INT             NOT NULL,
    cost                    DECIMAL(10, 2)  NOT NULL,
    transaction_date        TIMESTAMP       NOT NULL        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)  REFERENCES user(id)
);

# Example of DECIMAL(4, 2): 34.54 // 4 - cyfry, 2 po przecinku
INSERT INTO transaction(user_id, cost) VALUES (1, 23.54);
INSERT INTO transaction(user_id, cost) VALUES (1, 1392.54);
INSERT INTO transaction(user_id, cost) VALUES (2, 69.69);

SELECT * FROM transaction;

# Join tables
SELECT
    t.id as transaction_id,
    u.id as user_id,
    u.login,
    t.transaction_date,
    t.cost
FROM transaction t INNER JOIN user u
ON t.user_id = u.id;

# Remove database
# DROP DATABASE shop;