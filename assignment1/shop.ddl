CREATE DATABASE IF NOT EXISTS assignment1;

# Active schema creation
USE assignment1;

# Table creation
CREATE TABLE IF NOT EXISTS user(
    id                      INT UNSIGNED    NOT NULL        AUTO_INCREMENT,
    username                VARCHAR(36)     NULL            UNIQUE,
    email                   VARCHAR(36)     NOT NULL        UNIQUE,
    registration_date       TIMESTAMP       NOT NULL        DEFAULT CURRENT_TIMESTAMP,
    city                    VARCHAR(36)     NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS category(
    id                  SMALLINT UNSIGNED    NOT NULL,
    name                VARCHAR(36)          NOT NULL,
    transaction_fee     DECIMAL(3, 2)        NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS offer(
    id                      INT UNSIGNED         NOT NULL        AUTO_INCREMENT,
    name                    VARCHAR(36)          NOT NULL,
    category_id             SMALLINT UNSIGNED    NOT NULL,
    manufacturer            VARCHAR(36)          NOT NULL,
    model                   VARCHAR(36)          NULL,
    price                   DECIMAL(10, 2)       NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id)
       ON DELETE CASCADE
       ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS transaction(
    id                      INT UNSIGNED                                NOT NULL AUTO_INCREMENT,
    user_id                 INT UNSIGNED                                NOT NULL,
    transaction_date        TIMESTAMP                                   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method          ENUM('gotówka', 'blik', 'przelew online')   NOT NULL,
    delivery_method         ENUM('inpost', 'dhl', 'odbiór osobisty')     NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)  REFERENCES user(id)
       ON DELETE CASCADE
       ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS transaction_item(
    transaction_id          INT UNSIGNED            NOT NULL,
    offer_id                INT UNSIGNED            NOT NULL,
    quantity                TINYINT UNSIGNED        NOT NULL,
    PRIMARY KEY (offer_id, transaction_id),
    FOREIGN KEY (offer_id)  REFERENCES offer(id)
       ON DELETE CASCADE
       ON UPDATE CASCADE,
    FOREIGN KEY (transaction_id) REFERENCES transaction(id)
       ON DELETE CASCADE
       ON UPDATE CASCADE
);

