# Active schema creation
USE hotel;

INSERT INTO user(id, username, email) VALUES
    (1, 'iza98', 'iza98@gmail.com'),
    (2, 'mis95', 'mis95@gmail.com'),
    (3, 'krzys94', 'krzys94@wp.pl'),
    (4, null, 'elamisia@o2.pl'),
    (5, 'olo94', 'olo94@wp.pl'),
    (6, 'ewelka', 'ewelka@gmail.pl'),
    (7, 'damianek', 'damianek@wp.pl'),
    (8, null, 'kasia89@wp.pl'),
    (9, 'maciek', 'maciek320@wp.pl'),
    (10, 'jacek', 'placek33@wp.pl');

INSERT INTO room(id, price_for_night, standard, cancellation, max_guests, room_area, free_wifi)
VALUES
    (1, 100.00, 'dobry', 'free', 2, 15, 0),
    (2, 300.00, 'bardzo dobry', '5% of price', 3, 21, 1),
    (3, 500.00, 'wysoki', '5% of price', 4, 40, 1),
    (4, 80.00, 'średni', 'free', 2, 14, 0),
    (5, 150.00, 'dobry', 'free', 2, 19, 0),
    (6, 200.00, 'bardzo dobry', 'free', 2, 21, 1),
    (7, 700.00, 'wysoki', '5% of price', 2, 60, 1),
    (8, 300.00, 'bardzo dobry', 'free', 2, 23, 1),
    (9, 75.00, 'średni', 'free', 2, 13, 0),
    (10, 100.00, 'dobry', 'free', 2, 25, 0)
;
INSERT INTO reservation(id, user_id, check_in_date, check_out_date)
VALUES
    (1, 10, '2022-02-08 10:00:00', '2022-02-10 10:00:00'),
    (2, 10, '2022-02-01 10:00:00', '2022-02-05 10:00:00'),
    (3, 1, '2022-01-10 10:00:00', '2022-01-13 10:00:00'),
    (4, 2, '2022-01-01 10:00:00', '2022-01-07 10:00:00'),
    (5, 5, '2022-01-22 10:00:00', '2022-01-28 10:00:00'),
    (6, 4, '2022-02-08 10:00:00', '2022-02-10 10:00:00'),
    (7, 4, '2022-02-02 10:00:00', '2022-02-04 10:00:00'),
    (8, 3, '2022-01-16 10:00:00', '2022-01-18 10:00:00'),
    (9, 6, '2022-02-01 10:00:00', '2022-02-03 10:00:00'),
    (10, 8, '2022-01-20 10:00:00', '2022-01-21 10:00:00')
;

INSERT INTO reservation_room(reservation_id, room_id, payment_method)
VALUES
    (1, 2, 'blik'),
    (2, 4, 'karta'), (2, 1, 'karta'),
    (3, 1, 'przelew online'),
    (4, 10, 'blik'),
    (5, 8, 'blik'),
    (6, 7, 'karta'), (6, 10, 'karta'), (6, 3, 'karta'),
    (7, 3, 'blik'),
    (8, 6, 'blik'), (8, 8, 'przelew online'),
    (9, 2, 'przelew online'),
    (10, 10, 'blik')
;

