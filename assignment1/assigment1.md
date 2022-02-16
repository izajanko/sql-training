# MySQL queries 

### Find how many transaction was made in system
```mysql
SELECT
    count(*)
FROM transaction;
```
### Find how many unique users made transactions
```mysql
SELECT
    count(distinct user_id)
FROM transaction;
```