## MySQL

###Schema creation
```mysql
CREATE DATABASE IF NOT EXISTS shop;
```

### Active schema creation
```mysql
USE shop;
```

### Table creation
```mysql
CREATE TABLE IF NOT EXISTS user(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    login                   VARCHAR(15)     NOT NULL        UNIQUE,
    registration_date       TIMESTAMP       NOT NULL        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
```
### Create table with foreign key
```mysql
CREATE TABLE IF NOT EXISTS transaction(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    user_id                 INT             NOT NULL,
    cost                    DECIMAL(10, 2)  NOT NULL,
    transaction_date        TIMESTAMP       NOT NULL        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)  REFERENCES user(id)
);
```
### Table creation with cascade update / delete
```mysql

CREATE TABLE IF NOT EXISTS transaction_item(
    offer_id                INT       NOT NULL,
    transaction_id          INT       NOT NULL,
    PRIMARY KEY (offer_id, transaction_id),
    FOREIGN KEY (offer_id)  REFERENCES offer(id)
       ON DELETE CASCADE
       ON UPDATE CASCADE,
    FOREIGN KEY (transaction_id) REFERENCES transaction(id)
);
```

### Table deletion
```mysql 
DROP TABLE IF EXISTS user;
```

### Insert data to table
```mysql
INSERT INTO user(login) VALUES ('iza98');
INSERT INTO transaction(user_id, cost) VALUES (1, 23.54);
INSERT INTO
    offer(name)
VALUES
    ('xbox'),
    ('playstation'),
    ('nintendo');
```
### Adding nullable column to existing table
```mysql
ALTER TABLE offer ADD manufacturer VARCHAR(20);
```

### Adding non nullable column to existing table
```mysql
ALTER TABLE offer ADD model VARCHAR(20) NOT NULL;
ALTER TABLE offer ADD version INTEGER NOT NULL;
ALTER TABLE offer ADD production_year INTEGER NOT NULL DEFAULT 2022;
```

### Checking table schema
```mysql
DESCRIBE offer;
```

### Updating column
```mysql 
SET offer.manufacturer = 'unknown', offer.model ='unknown'
WHERE 1 = 1;
```
```mysql
UPDATE offer
SET
    name = 'konsola xbox series s',
    manufacturer = 'microsoft',
    model = 'series s'
WHERE id = 1;
```

### Changing column type
```mysql
ALTER TABLE offer MODIFY COLUMN name VARCHAR(69);
```
###### (Varchar cannot be converted to Integer type)

### Deleting column
```mysql
ALTER TABLE offer DROP COLUMN version;
```

