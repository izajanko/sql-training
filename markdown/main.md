## My first markdown document

### Table creation

In order to create table in MySQL run following command:

```mysql
CREATE TABLE IF NOT EXISTS user(
    id                      INT             NOT NULL        AUTO_INCREMENT,
    login                   VARCHAR(15)     NOT NULL        UNIQUE,
    registration_date       TIMESTAMP       NOT NULL        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
```

### Next thing to learn

* how to add column to existing database
* learn difference between left and inner join
* many others...

### First image in markdown

![](golden-retriever.jpg)

### My social

Here is my [LinkedIn profile](https://www.linkedin.com/in/izabella-jankowska-a4a88a229/)

### Most important things in my life

1. Miś
2. Colka
3. Jedzenie

### Code snippet in python

```python
def sum(a, b):
    return a + b
```