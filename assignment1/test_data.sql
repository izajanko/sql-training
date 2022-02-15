# Active schema creation
USE assignment1;

INSERT INTO user(id, username, email, city) VALUES
    (1, 'iza98', 'iza98@gmail.com', 'Łopienie Zyski'),
    (2, 'mis95', 'mis95@gmail.com', 'Olsztyn'),
    (3, 'krzys94', 'krzys94@wp.pl', 'Białystok'),
    (4, null, 'elamisia@o2.pl', 'Olsztyn'),
    (5, 'olo94', 'olo94@wp.pl', 'Kielce'),
    (6, 'ewelka', 'ewelka@gmail.pl', 'Białystok'),
    (7, 'damianek', 'damianek@wp.pl', null);


INSERT INTO category(id, name, transaction_fee) VALUES
    (1, 'smartfony', 0.05),
    (2, 'konsole', 0.1),
    (3, 'telewizory', 0.25);


INSERT INTO offer(id, name, category_id, manufacturer, model, price)
VALUES
    (1, 'konsola xbox series s', 2, 'microsoft', 'series s', 1250),
    (2, 'konsola xbox series x', 2, 'microsoft', 'series x', 2250),
    (3, 'konsola playstation 5', 2, 'sony', '5', 2800),
    (4, 'konsola playstation 4', 2, 'sony', '4', 800),
    (5, 'telefon iphone 13 5g', 1, 'apple', '13 5g', 4500),
    (6, 'telefon iphone 13 5g', 1, 'apple', '13', 4000),
    (7, 'telefon samsung S21 FE', 1, 'samsung', 'S21 FE', 2800),
    (8, 'telefon samsung A52', 1, 'samsung', 'A52', 2000),
    (9, 'telewizor samsung QE', 3, 'samsung', 'qled qe43q67aau', 2500);


INSERT INTO transaction(id, user_id, transaction_date, payment_method, delivery_method) VALUES
    (1, 1, '2022-02-06 10:00:00', 'blik', 'dhl'),
    (2, 1, '2022-02-07 12:00:00', 'przelew online', 'dhl'),
    (3, 1, '2022-02-08 13:00:00', 'blik', 'inpost'),
    (4, 2, '2022-02-07 14:00:00', 'blik', 'inpost'),
    (5, 3, '2022-02-07 15:00:00', 'przelew online', 'inpost'),
    (6, 6, '2022-02-08 16:00:00', 'gotówka', 'odbiór osobisty'),
    (7, 7, '2022-02-06 11:00:00', 'gotówka', 'odbiór osobisty'),
    (8, 7, '2022-02-07 12:00:00', 'blik', 'dhl'),
    (9, 2, '2022-02-08 18:00:00', 'blik', 'inpost'),
    (10, 2, '2022-02-08 13:00:00', 'blik', 'inpost');

INSERT INTO transaction_item(transaction_id, offer_id, quantity) VALUES
    (1, 2, 2), (1, 9, 1),
    (2, 1, 1),
    (3, 6, 1),
    (4, 2, 3), (4, 3, 1), (4, 9, 2),
    (5, 3, 1), (5, 7, 2),
    (6, 5, 1),
    (7, 9, 1),
    (8, 8, 1), (8, 1, 1),
    (9, 1, 1), (9, 5, 2),
    (10, 9, 1);
