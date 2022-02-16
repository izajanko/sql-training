CREATE DATABASE IF NOT EXISTS hotel;

# Active schema creation
USE hotel;

# Table creation
CREATE TABLE IF NOT EXISTS user(
    id                      INT UNSIGNED    NOT NULL        AUTO_INCREMENT,
    username                VARCHAR(36)     NULL            UNIQUE,
    email                   VARCHAR(36)     NOT NULL        UNIQUE,
    registration_date       TIMESTAMP       NOT NULL        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS room(
    id                      INT UNSIGNED         NOT NULL        AUTO_INCREMENT,
    price_for_night         DECIMAL(10, 2)       NOT NULL,
    standard                ENUM('średni', 'dobry', 'bardzo dobry', 'wysoki')   NOT NULL,
    cancellation_fee        DECIMAL(3,2)         NOT NULL,
    max_guests              TINYINT,
    room_area               SMALLINT,
    free_wifi               BIT(1)               NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS reservation(
    id                      INT UNSIGNED         NOT NULL        AUTO_INCREMENT,
    user_id                 INT UNSIGNED         NOT NULL,
    check_in_date           DATE                 NOT NULL,
    check_out_date          DATE                 NOT NULL,
    payment_method          ENUM('karta', 'blik', 'przelew online')   NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) references user(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS room_reservation(
    reservation_id          INT UNSIGNED         NOT NULL,
    room_id                 INT UNSIGNED         NOT NULL,
    PRIMARY KEY (reservation_id, room_id),
    FOREIGN KEY (reservation_id) references reservation(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (room_id) references room(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
# DROP TABLE room;