# Active schema creation
USE lesson3;

INSERT INTO user(login) VALUES ('iza98');
INSERT INTO user(login) VALUES ('mis95');
INSERT INTO user(login, registration_date) VALUES ('czesiek_m','2021-12-31 14:45:54');
INSERT INTO user(id, login) VALUES (69, 'kotek69');
INSERT INTO user(login) VALUES ('piesek11');
INSERT INTO user(login) VALUES ('zabka32');

INSERT INTO offer(
          name,
          manufacturer,
          model,
          production_year
    )
VALUES
    ('xbox', 'microsoft', 'series s', 2021),
    ('playstation', 'sony', '5', 2022),
    ('nintendo switch', 'nintendo', '', 2019),
    ('iphone', 'apple', '13', 2022),
    ('macbook pro', 'apple', null, 2021);


INSERT INTO transaction(id, user_id, cost) VALUES (1, 1, 23.54);
INSERT INTO transaction(id, user_id, cost) VALUES (2, 1, 1392.54);
INSERT INTO transaction(id, user_id, cost) VALUES (3, 2, 69.69);
INSERT INTO transaction(id, user_id, cost) VALUES (4, 69, 100.13);
INSERT INTO transaction(id, user_id, cost) VALUES (5, 70, 3.50);

INSERT INTO transaction_item(offer_id, transaction_id) VALUES (1, 2),  (3, 1),  (4, 3),  (5, 3);
INSERT INTO transaction_item(offer_id, transaction_id) VALUES (2, 3);


SELECT * FROM user;

# DELETE FROM transaction WHERE 1 = 1;
SELECT * FROM transaction;


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

# Does not work when cascade update / delete is not added on foreign key
# DELETE FROM offer WHERE name = 'iphone';

select * from offer;

select * from offer where model is null;
select * from offer where model is null or model = '';

INSERT INTO offer(
          name,
          manufacturer,
          model,
          production_year
    )
VALUES
    ('xbox one', 'microsoft', null, 2018),
    ('playstation', 'sony', '4', 2021),
    ('iphone', 'apple', 'X', 2011),
    ('iphone mini', 'apple', '12', 2017),
    ('macbook air', 'apple', null, 2021);

# Find all iphones
select * from offer where name like '%iphone%';


select * from offer where production_year between 2018 and 2021;

# Find all product manufactured in 2018 or 2021
select * from offer where production_year in (2021, 2018);
select * from offer where production_year = 2018 or production_year = 2021;
select * from offer where production_year > 2018;

INSERT INTO offer(
          name,
          manufacturer,
          model,
          production_year
    )
VALUES
    ('myphone X', 'xiaomi', '69 Ultra plus', 2018);

# Find all offers with phone in name
select * from offer where name like '%phone%';

# Find all xboxes manufacturer after 2020
select * from offer where  name like '%xbox%' and production_year > 2020;

# and operation
# true and true = true
# true and false = false
# false and true = false
# false and false = false

# or operation
# true and true = true
# true and false = true
# false and true = true
# false and false = false

# Find all xboxes manufacturer after 2020 and iphones produced after 2015
select * from offer where (name like '%xbox%' and production_year > 2020) or (name like '%iphone%' and production_year > 2015);

# Creating view - logical table. Data is not copied. You cannot add, update and delete rows from view
create view enriched_transaction as (
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
    INNER JOIN offer o ON ti.offer_id = o.id
);


CREATE TABLE husband(
    id  INTEGER PRIMARY KEY,
    name VARCHAR(36) NOT NULL,
    wife_id INTEGER
);

CREATE TABLE wife(
    id  INTEGER PRIMARY KEY,
    name VARCHAR(36) NOT NULL
);

INSERT INTO wife(id, name) VALUES (1, 'ewa'), (2, 'ewelina'), (3, 'karolina');
INSERT INTO husband(id, name, wife_id) VALUES (1, 'adam', 1), (2, 'radek', null);
INSERT INTO husband(id, name, wife_id) VALUES (3, 'zenek', 69);

select * from wife;
select * from husband;

select h.name, w.name
from wife w inner join husband h on w.id = h.wife_id;

# return all men and optionally present wife // Right join
select h.name, w.name, h.wife_id, (w.id is not null) as is_married
from wife w right join husband h on h.wife_id = w.id;

# find all men without wife // Right anti join
select h.name, w.name, h.wife_id
from wife w right join husband h on h.wife_id = w.id where w.id is null;

select * from enriched_transaction;

select login, count(*) as trans_count, sum(transaction_cost) as amount
from enriched_transaction
group by login;

INSERT INTO transaction(id, user_id, cost) VALUES (7, 1, 1392.54);
INSERT INTO transaction(id, user_id, cost) VALUES (8, 1, 1392.54);
INSERT INTO transaction_item(offer_id, transaction_id) VALUES (2, 8);

INSERT INTO transaction(id, user_id, cost) VALUES (9, 2, 692.54);
INSERT INTO transaction_item(offer_id, transaction_id) VALUES (2, 9);

select login, offer_name, count(*) as trans_count, sum(transaction_cost) as amount
from enriched_transaction
group by login, offer_name;

select login, offer_name, count(*) as trans_count, sum(transaction_cost) as amount
from enriched_transaction
group by login, offer_name
having trans_count > 1;

select login, offer_name, count(*) as trans_count, sum(transaction_cost) as amount
from enriched_transaction
where login = 'iza98'
group by login, offer_name
having trans_count > 1;


select login, count(*) as trans_count, sum(transaction_cost) as amount
from enriched_transaction
where offer_name = 'playstation'
group by login
having trans_count > 1;