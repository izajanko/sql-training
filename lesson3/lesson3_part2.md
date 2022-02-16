### Data types
* AUTO_INCREMENT automatically fill column row with next number
* UNIQUE - column values must have unique values
* DEFAULT $value - set default value when value is not provided during insertion
* Example of DECIMAL(4, 2): 34.54 // 4 - cyfry, 2 po przecinku
* smallint: -2^15 (-32,768) to 2^15-1 (32,767)	
* tinyint: 0 to 255

### Join tables - examples 
```mysql
SELECT
    t.id as transaction_id,
    u.id as user_id,
    u.login,
    t.transaction_date,
    t.cost
FROM transaction t INNER JOIN user u
ON t.user_id = u.id;
```
```mysql
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
```

### Deleting data from table
```mysql
DELETE FROM transaction WHERE 1 = 1;
```
##### Without condition WHERE 1 = 1 operation could not be complete 

### SELECT
```mysql
select * from offer;
select * from offer where model is null;
select * from offer where model is null or model = '';
# Find all iphones
select * from offer where name like '%iphone%';
select * from offer where production_year between 2018 and 2021;
# Find all product manufactured in 2018 or 2021
select * from offer where production_year in (2021, 2018);
select * from offer where production_year = 2018 or production_year = 2021;
select * from offer where production_year > 2018;
# Find all offers with phone in name
select * from offer where name like '%phone%';
# Find all xboxes manufacturer after 2020
select * from offer where  name like '%xbox%' and production_year > 2020;
# Find all xboxes manufacturer after 2020 and iphones produced after 2015
select * from offer where (name like '%xbox%' and production_year > 2020) or (name like '%iphone%' and production_year > 2015);
```
### Creating view - logical table. Data is not copied. You cannot add, update and delete rows from view
```mysql
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
```
```mysql
select login, count(*) as trans_count, sum(transaction_cost) as amount
from enriched_transaction
group by login;

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
```