# Active schema creation
USE assignment1;

# Find all users using gmail

# Expected result
# iza98 | iza98@gmail.com |Łopienie Zyski
# mis95 | mis95@gmail.com | Olsztyn
# ewelka | ewelka@gmail.pl | Białystok

SELECT 1;

# Check how many users live in each city (without nulls). Result should be sorted by count
# Check out: https://www.mysqltutorial.org/mysql-order-by/

# Expected result
# Olsztyn | 2
# Białystok | 2
# Łopienie Zyski | 1
# Kielce | 1

SELECT 1;

# Find highest category transaction fee
# Expected result
# transaction_fee
# 0.25
SELECT 1;

# Find category with highest transaction fee
# Expected result
# id | transaction_fee
# 3  | 0.25

# Hint you can execute sub query in where statement
# SELECT ... FROM table_a WHERE col_a = (SELECT ... FROM table_a)

SELECT 1;


# Find how many products each manufacture have in our shop
# Expected result
#manufacturer,count
#samsung,3
#microsoft,2
#sony,2
#apple,2

SELECT 1;


# Find how many products in each category each manufacture have in our shop
# Expected result
#manufacturer,category_name,count
#apple,smartfony,2
#samsung,smartfony,2
#microsoft,konsole,2
#sony,konsole,2
#samsung,telewizory,1

SELECT 1;

# Find product with biggest revenue per sold item. Revenue = price * fee
# Expected result
# name,revenue
# telewizor samsung QE,625.0000

SELECT 1;

# Find invalid orders (city is null and deliver method is not odbiór osobisty)
# Expected result
# id,email,transaction_date,delivery_method,city
# 8,damianek@wp.pl,2022-02-07 10:00:00,dhl,<null>

SELECT 1;


# Find users with minimum three transactions
# Expected result
# email,transaction_count
# iza98@gmail.com,3
# mis95@gmail.com,3

SELECT 1;

# Check how many shipment was send to each city
# Expected result
# city,transaction_count
# Łopienie Zyski,3
# Olsztyn,3
# Białystok,1

SELECT 1;

# Check how many transaction was done in each day
# Hint: check how to convert timestamp to date in MySQL
# Expected result
# date,transaction_count
# 2022-02-07,4
# 2022-02-08,4
# 2022-02-06,2

SELECT 1;

# Find 5 top (by number of sold items) selling products
# Expected result
# name,sold_items
# konsola xbox series x,5
# telewizor samsung QE,5
# telefon iphone 13 5g,4
# konsola xbox series s,3
# konsola playstation 5,2

SELECT 1;

# Find how many users bought each product
# Hint: check out count distinct aggregation
# Expected result
# name,unique_users
# konsola xbox series s,3
# telefon iphone 13 5g,3
# telewizor samsung QE,3
# konsola playstation 5,2
# konsola xbox series x,2
# telefon samsung A52,1
# telefon samsung S21 FE,1

SELECT 1;

# Find users without any transaction
# Expected result
# email
# elamisia@o2.pl
# olo94@wp.pl

SELECT 1;


# Find how many items bought each user
# Hint: coalesce function can be use to replace nulls in result with default value
# Expected result
# email,bought_items
# mis95@gmail.com,10
# iza98@gmail.com,5
# damianek@wp.pl,3
# krzys94@wp.pl,3
# ewelka@gmail.pl,1
# elamisia@o2.pl,0
# olo94@wp.pl,0

SELECT 1;

# Find total revenue per product. Revenue was defined earlier
# Expected result
# name,revenue
# telewizor samsung QE,2500.0000
# telefon iphone 13 5g,650.0000
# konsola playstation 5,560.0000
# konsola xbox series x,450.0000
# konsola xbox series s,375.0000
# telefon samsung S21 FE,140.0000
# telefon samsung A52,100.0000


SELECT 1;

# Find total revenue per manufacturer and product. Revenue was defined earlier
# Expected result
# manufacturer,name,revenue
# samsung,telewizor samsung QE,2500.0000
# apple,telefon iphone 13 5g,650.0000
# sony,konsola playstation 5,560.0000
# microsoft,konsola xbox series x,450.0000
# microsoft,konsola xbox series s,375.0000
# samsung,telefon samsung S21 FE,140.0000
# samsung,telefon samsung A52,100.0000

SELECT 1;

# Find products without any transaction
# Expected result
# name,number_of_transactions
# konsola playstation 4,0

SELECT 1;
