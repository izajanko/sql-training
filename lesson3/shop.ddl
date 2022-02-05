CREATE DATABASE IF NOT EXISTS lesson3;

# Active schema creation
USE lesson3;

# Table creation
CREATE TABLE IF NOT EXISTS user(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    login                   VARCHAR(15)     NOT NULL        UNIQUE,
    registration_date       TIMESTAMP       NOT NULL        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS offer(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    name                    VARCHAR(69)     NOT NULL,
    manufacturer            VARCHAR(36)     NOT NULL,
    model                   VARCHAR(36)     NULL,
    production_year         INTEGER         NOT NULL,
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
    FOREIGN KEY (offer_id)  REFERENCES offer(id)
       ON DELETE CASCADE
       ON UPDATE CASCADE,
    FOREIGN KEY (transaction_id) REFERENCES transaction(id)
);

