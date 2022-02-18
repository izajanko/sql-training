# Active schema creation
USE assignment1;

# Find all users using gmail
SELECT * FROM user WHERE email like '%gmail%';

# Expected result
# iza98 | iza98@gmail.com |Łopienie Zyski
# mis95 | mis95@gmail.com | Olsztyn
# ewelka | ewelka@gmail.pl | Białystok



# Check how many users live in each city (without nulls). Result should be sorted by count
# Check out: https://www.mysqltutorial.org/mysql-order-by/

SELECT city, count(*) as how_many_users_live_there
from user
where city is not null
group by city
order by how_many_users_live_there DESC ;

# Expected result
# Olsztyn | 2
# Białystok | 2
# Łopienie Zyski | 1
# Kielce | 1


# Find highest category transaction fee
SELECT MAX(transaction_fee) AS transaction_fee FROM category;

# Expected result
# transaction_fee
# 0.25


# Find category with highest transaction fee
SELECT id, transaction_fee
FROM category
WHERE transaction_fee = (SELECT MAX(transaction_fee) FROM category);

# second method
SELECT * FROM category order by transaction_fee desc limit 1;
# Expected result
# id | transaction_fee
# 3  | 0.25

# Hint you can execute sub query in where statement
# SELECT ... FROM table_a WHERE col_a = (SELECT ... FROM table_a)


# Find how many products each manufacture have in our shop
SELECT manufacturer, count(*) as count
from offer
group by manufacturer
order by count DESC ;

# Expected result
#manufacturer,count
#samsung,3
#microsoft,2
#sony,2
#apple,2


# Find how many products in each category each manufacture have in our shop
create or replace view offer_with_category as (
    SELECT o.manufacturer,
           c.name as category_name
    FROM offer o
             INNER JOIN category c on o.category_id = c.id
);
SELECT * FROM offer_with_category;
SELECT
       manufacturer,
       category_name,
       count(*) as count
FROM offer_with_category
group by manufacturer, category_name;

#second method
SELECT o.manufacturer,
       c.name as category_name,
       count(*) as count
FROM offer o INNER JOIN category c on o.category_id = c.id
group by category_name, manufacturer;


# Expected result
#manufacturer,category_name,count
#apple,smartfony,2
#samsung,smartfony,2
#microsoft,konsole,2
#sony,konsole,2
#samsung,telewizory,1



# Find product with biggest revenue per sold item. Revenue = price * fee
create or replace view offer_with_revenue as (
SELECT
       o.name,
       c.transaction_fee*o.price as revenue
FROM offer o
         INNER JOIN category c on o.category_id = c.id
);
#DROP view IF EXISTS offer_with_revenue;
#SELECT * FROM offer_with_revenue;

SELECT   name, revenue
from offer_with_revenue
WHERE revenue=(SELECT MAX(revenue) FROM offer_with_revenue);

#SECOND METHOD
SELECT
       o.name,
       c.transaction_fee*o.price as revenue
FROM offer o INNER JOIN category c on o.category_id = c.id
WHERE c.transaction_fee*o.price=(SELECT MAX(c.transaction_fee*o.price) FROM offer o INNER JOIN category c on o.category_id = c.id);

# Expected result
# name,revenue
# telewizor samsung QE,625.0000


# Find invalid orders (city is null and deliver method is not odbiór osobisty)
SELECT
    t.id,
    u.email,
    t.transaction_date,
    t.delivery_method,
    u.city
FROM user u
INNER JOIN transaction t on u.id = t.user_id
WHERE city is null and delivery_method!='odbiór osobisty';

# Expected result
# id,email,transaction_date,delivery_method,city
# 8,damianek@wp.pl,2022-02-07 10:00:00,dhl,<null>


# Find users with minimum three transactions
SELECT
    u.email,
   count(*) as transaction_count
FROM user u
INNER JOIN transaction t on u.id = t.user_id
GROUP BY email
having transaction_count>=3;

# Expected result
# email,transaction_count
# iza98@gmail.com,3
# mis95@gmail.com,3


# Check how many shipment was send to each city
SELECT
    u.city,
   count(*) as transaction_count
FROM user u
INNER JOIN transaction t on u.id = t.user_id
WHERE city is not null and delivery_method != 'odbiór osobisty'
GROUP BY city;

# Expected result
# city,transaction_count
# Łopienie Zyski,3
# Olsztyn,3
# Białystok,1



# Check how many transaction was done in each day
SELECT
    DATE(transaction_date) as trans_date,
    count(*) as transaction_count
FROM transaction
GROUP BY trans_date
order by transaction_count desc;

# Hint: check how to convert timestamp to date in MySQL
# Expected result
# date,transaction_count
# 2022-02-07,4
# 2022-02-08,4
# 2022-02-06,2

#second method
SELECT
       DATE(transaction_date) as trans_date,
       count(*) as transaction_date
FROM transaction
GROUP BY DATE(transaction_date);


# Find 5 top (by number of sold items) selling products
SELECT
    o.name,
    sum(ti.quantity) as sold_items
FROM offer o
INNER JOIN transaction_item ti on ti.offer_id = o.id
group by o.name
order by sold_items desc
limit 5;

# Expected result
# name,sold_items
# konsola xbox series x,5
# telewizor samsung QE,5
# telefon iphone 13 5g,4
# konsola xbox series s,3
# konsola playstation 5,2



# Find how many users bought each product
# Hint: check out count distinct aggregation
SELECT
    o.name,
    count(distinct username) as unique_users
FROM user u
INNER JOIN transaction t on u.id = t.user_id
INNER JOIN transaction_item ti on t.id = ti.transaction_id
INNER JOIN offer o on ti.offer_id = o.id
group by o.name
order by unique_users desc ;

#second method
SELECT o.name, count(distinct user_id) as unique_users
FROM offer o
    INNER JOIN transaction_item ti on o.id = ti.offer_id
    INNER JOIN transaction t on ti.transaction_id = t.id
GROUP BY o.name
ORDER BY unique_users desc
;
# Expected result
# name,unique_users
# konsola xbox series s,3
# telefon iphone 13 5g,3
# telewizor samsung QE,3
# konsola playstation 5,2
# konsola xbox series x,2
# telefon samsung A52,1
# telefon samsung S21 FE,1

# Find users without any transaction
SELECT
    u.email
FROM user u
LEFT JOIN transaction t on u.id = t.user_id
WHERE t.id is null;
# Expected result
# email
# elamisia@o2.pl
# olo94@wp.pl


# Find how many items bought each user
# Hint: coalesce function can be use to replace nulls in result with default value
SELECT
    u.email,
    COALESCE(sum(quantity), 0) as bought_items
FROM user u
LEFT JOIN transaction t on u.id = t.user_id
LEFT JOIN transaction_item ti on t.id = ti.transaction_id
group by u.username
order by bought_items desc;

# Expected result
# email,bought_items
# mis95@gmail.com,10
# iza98@gmail.com,5
# damianek@wp.pl,3
# krzys94@wp.pl,3
# ewelka@gmail.pl,1
# elamisia@o2.pl,0
# olo94@wp.pl,0

# Find how many times user bought each item
SELECT
    u.email,
    ti.offer_id,
    sum(ti.quantity)
FROM user u
LEFT JOIN transaction t on u.id = t.user_id
LEFT JOIN transaction_item ti on t.id = ti.transaction_id
group by u.email, ti.offer_id;

# Find total revenue per product. Revenue was defined earlier
# Revenue = price * fee
SELECT
       o.name,
       sum(c.transaction_fee * o.price * quantity) as revenue
       #sum(quantity)
FROM offer o
    INNER JOIN category c on o.category_id = c.id
    INNER JOIN transaction_item ti on o.id = ti.offer_id
group by o.name
order by revenue desc;

# Expected result
# name,revenue
# telewizor samsung QE,3125.0000
# konsola xbox series x 1125.0000
# telefon iphone 13 5g,875.0000
# konsola playstation 5,560.0000
# konsola xbox series s,375.0000
# telefon samsung S21 FE,280.0000
# telefon samsung A52,100.0000


# BONUS
# Find total revenue per manufacturer.
SELECT
       o.manufacturer,
       sum(c.transaction_fee * o.price * quantity) as revenue,
       sum(quantity)
FROM offer o
    INNER JOIN category c on o.category_id = c.id
    INNER JOIN transaction_item ti on o.id = ti.offer_id
group by o.manufacturer
order by revenue desc;


# Find total revenue per manufacturer and product. Revenue was defined earlier
SELECT
       o.manufacturer,
       o.name,
       sum(c.transaction_fee * o.price * quantity) as revenue
FROM offer o
    INNER JOIN category c on o.category_id = c.id
    INNER JOIN transaction_item ti on o.id = ti.offer_id
group by o.manufacturer,  o.name
order by revenue desc;

# Expected result
# manufacturer,name,revenue
# samsung,telewizor samsung QE,3125.0000
# microsoft,konsola xbox series x,1125.0000
# apple,telefon iphone 13 5g,875.0000
# sony,konsola playstation 5,560.0000
# microsoft,konsola xbox series s,375.0000
# samsung,telefon samsung S21 FE,280.0000
# samsung,telefon samsung A52,100.0000


# Find products without any transaction
SELECT
    o.name
FROM offer o
LEFT JOIN transaction_item ti on o.id = ti.offer_id
WHERE transaction_id is null;

#second method
SELECT
       o.name,
       count(distinct transaction_id) as number_of_transactions
FROM offer o LEFT JOIN transaction_item ti on o.id = ti.offer_id
group by o.name
having number_of_transactions = 0;

# Expected result
# name,number_of_transactions
# konsola playstation 4,0

#find how many transaction was made in system
SELECT
    count(*)
FROM transaction;

#find how many unique users made transactions
SELECT
    count(distinct user_id)
FROM transaction;