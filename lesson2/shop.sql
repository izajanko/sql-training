# Active schema creation
USE lesson2;

INSERT INTO user(login) VALUES ('iza98');
INSERT INTO user(login) VALUES ('mis95');
INSERT INTO user(login, registration_date) VALUES ('czesiek_m','2021-12-31 14:45:54');
INSERT INTO user(id, login) VALUES (69, 'kotek69');
INSERT INTO user(login) VALUES ('piesek11');
INSERT INTO user(login) VALUES ('zabka32');

INSERT INTO
    offer(name)
VALUES
    ('xbox'),
    ('playstation'),
    ('nintendo');

INSERT INTO offer(name) VALUES ('iphone 13');
INSERT INTO offer(name) VALUES ('macbook pro');

INSERT INTO transaction(user_id, cost) VALUES (1, 23.54);
INSERT INTO transaction(user_id, cost) VALUES (1, 1392.54);
INSERT INTO transaction(user_id, cost) VALUES (2, 69.69);
INSERT INTO transaction(user_id, cost) VALUES (5, 100.13);
INSERT INTO transaction(user_id, cost) VALUES (4, 3.50);

INSERT INTO transaction_item(offer_id, transaction_id) VALUES (1, 2),  (3, 1),  (4, 3),  (5, 3);
INSERT INTO transaction_item(offer_id, transaction_id) VALUES (2, 3);

SELECT * FROM user;



# Join tables
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


SELECT * FROM transaction_item;

# Adding nullable column to existing table
ALTER TABLE offer ADD manufacturer VARCHAR(20);

# Adding non nullable column to exisitng table
ALTER TABLE offer ADD model VARCHAR(20) NOT NULL;
ALTER TABLE offer ADD version INTEGER NOT NULL;
ALTER TABLE offer ADD production_year INTEGER NOT NULL DEFAULT 2022;


# Checking table schema
DESCRIBE offer;

SELECT * FROM offer;

UPDATE offer
SET offer.manufacturer = 'unknown', offer.model ='unknown'
WHERE 1 = 1;

# Update columns
UPDATE offer
SET
    name = 'konsola xbox series s',
    manufacturer = 'microsoft',
    model = 'series s'
WHERE id = 1;

# Changing column type

ALTER TABLE offer MODIFY COLUMN name VARCHAR(69);

# Won't work because varchar cannot be converted to Integer type
# ALTER TABLE offer MODIFY COLUMN name INTEGER;

ALTER TABLE offer DROP COLUMN version;