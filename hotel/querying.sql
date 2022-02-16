# Active schema creation
USE hotel;


#znajdz wszystkie pokoje dla trzech osob o wysokim standardzie
SELECT * FROM room WHERE standard = 'wysoki' and max_guests = 3;
# nie ma takiego pokoju
#SELECT * FROM room WHERE standard = 'wysoki' and max_guests >= 3;



#znajdz wszytskie pokoje o standardzie wyzszym niz dobry z wifi dla dwoch osob
SELECT * FROM room WHERE (standard = 'bardzo dobry' or standard = 'dobry')
and free_wifi = true and max_guests = 2;
# jak odytać kolmnę z danymi 0 1, bo na innych przykładach nie działa
#free_wifi = 'true'
#free_wifi = (1)


#znajdz wszystkie pokoje ktorym cena za osobe wychodzi mniej niz 150
SELECT
       id,
       price_for_night/max_guests as price_for_nighr_for_one_person
FROM room
WHERE price_for_night/max_guests < 150; #dlaczego tu nie można wstawic aliasu?


#oblicz wartosc dla kazdej z rezerwacji
SELECT
    re.id,
    sum(datediff(re.check_out_date, re.check_in_date)*r.price_for_night) as price_for_reservation
FROM reservation re
INNER JOIN room_reservation rr on re.id = rr.reservation_id
INNER JOIN room r on rr.room_id = r.id
group by re.id
;

#znajdz zajete pokoje w danym terminie
SELECT
    room_id
FROM reservation
INNER JOIN room_reservation rr on reservation.id = rr.reservation_id
WHERE (check_in_date >= '2022-01-22' and check_out_date <= '2022-01-28') or
      (check_in_date <= '2022-01-22' and check_out_date >= '2022-01-28') or
      (check_in_date <= '2022-01-22' and check_out_date between '2022-01-22' and '2022-01-28') or
      (check_in_date between '2022-01-22' and '2022-01-28' and check_out_date >= '2022-01-28')
order by room_id;

#znajdz wolne pokoje w danym terminie (22-28 stycznia)
SELECT r.id
FROM room r LEFT JOIN (
    SELECT
        room_id
    FROM reservation
    INNER JOIN room_reservation rr on reservation.id = rr.reservation_id
    WHERE (check_in_date >= '2022-01-22' and check_out_date <= '2022-01-28') or
          (check_in_date <= '2022-01-22' and check_out_date >= '2022-01-28') or
          (check_in_date <= '2022-01-22' and check_out_date between '2022-01-22' and '2022-01-28') or
          (check_in_date between '2022-01-22' and '2022-01-28' and check_out_date >= '2022-01-28')
) reserved_room on r.id = reserved_room.room_id
WHERE reserved_room.room_id is null ;


# SELECT
#     room_id, reservation_id
# FROM reservation
# INNER JOIN room_reservation rr on reservation.id = rr.reservation_id
# WHERE (check_in_date < '2022-01-22' and check_out_date <= '2022-01-22') or
#       (check_in_date >= '2022-01-28' and check_out_date > '2022-01-28')
# order by room_id;


#znajdz liczbe dokonanych rezerwacji przez danego uzytkownika
SELECT
       user_id,
       count(*) as number_of_reservations
FROM reservation
group by user_id;

#znajdz liczbe unikalnych pokoi, ktore zarezerwowal uzytkownik
SELECT
       user_id,
       count(distinct room_id)
FROM reservation
INNER JOIN room_reservation rr on reservation.id = rr.reservation_id
group by user_id;