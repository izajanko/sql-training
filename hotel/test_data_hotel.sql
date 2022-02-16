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

INSERT INTO room(id, price_for_night, standard, cancellation_fee, max_guests, room_area, free_wifi)
VALUES
    (1, 100.00, 'dobry', 0.00, 2, 15, 0),
    (2, 300.00, 'bardzo dobry', 0.05, 3, 21, 1),
    (3, 500.00, 'wysoki', 0.05, 4, 40, 1),
    (4, 80.00, 'średni', 0.00, 2, 14, 0),
    (5, 150.00, 'dobry', 0.00, 2, 19, 0),
    (6, 200.00, 'bardzo dobry', 0.00, 2, 21, 1),
    (7, 700.00, 'wysoki', 0.10, 2, 60, 1),
    (8, 300.00, 'bardzo dobry', 0.00, 2, 23, 1),
    (9, 75.00, 'średni', 0.00, 2, 13, 0),
    (10, 100.00, 'dobry', 0.00, 2, 25, 0)
;
INSERT INTO reservation(id, user_id, check_in_date, check_out_date, payment_method)
VALUES
    (1, 10, '2022-02-08', '2022-02-10', 'blik'),
    (2, 10, '2022-02-01', '2022-02-05', 'przelew online'),
    (3, 1, '2022-01-10', '2022-01-13', 'karta'),
    (4, 2, '2022-01-01', '2022-01-07', 'blik'),
    (5, 5, '2022-01-22', '2022-01-28', 'blik'),
    (6, 4, '2022-02-08', '2022-02-10', 'przelew online'),
    (7, 4, '2022-02-02', '2022-02-04', 'blik'),
    (8, 3, '2022-01-16', '2022-01-18', 'blik'),
    (9, 6, '2022-02-01', '2022-02-03', 'blik'),
    (10, 8, '2022-01-20', '2022-01-21', 'karta')
;

INSERT INTO room_reservation(reservation_id, room_id)
VALUES
    (1, 2),
    (2, 4), (2, 1),
    (3, 1),
    (4, 10),
    (5, 8),
    (6, 7), (6, 10), (6, 3),
    (7, 3),
    (8, 6), (8, 8),
    (9, 2),
    (10, 10)
;

