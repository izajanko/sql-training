# Schema creation
# CREATE DATABASE shop;
CREATE DATABASE IF NOT EXISTS lesson2;

# Active schema creation
USE lesson2;

# Table creation
CREATE TABLE IF NOT EXISTS user(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    login                   VARCHAR(15)     NOT NULL        UNIQUE,
    registration_date       TIMESTAMP       NOT NULL        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS offer(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    name                    VARCHAR(15)     NOT NULL,
    PRIMARY KEY (id)
);

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

