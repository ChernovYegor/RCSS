INSERT INTO aircraft_type (type_name, max_passenger_capacity) 
VALUES 
    ('Боїнг 737', 180),
    ('Ейрбас А320', 200),
    ('Ембраер Е190', 100);

INSERT INTO aircraft (aircraft_type_id, aircraft_registration_number) 
VALUES 
    (1, 'АB123'),
    (2, 'CD456'),
    (3, 'EF789');

INSERT INTO flight (flight_number, aircraft_type_id, departure_airport_id, arrival_airport_id, departure_date, departure_time, flight_duration, ticket_price) 
VALUES 
    ('FL123', 1, 1, 2, '2023-11-01', '10:00:00', 120, 250.00),
    ('FL456', 2, 2, 3, '2023-11-02', '12:00:00', 180, 300.00),
    ('FL789', 3, 3, 1, '2023-11-03', '14:00:00', 90, 200.00);

INSERT INTO passenger (last_name, first_name, middle_name, document_type, document_series, document_number) 
VALUES 
    ('Сміт', 'Джон', 'Роберт', 'Паспорт', 'АБ', '123456'),
    ('Доу', 'Джейн', 'Мері', 'ID-карта', 'СД', '789012'),
    ('Джонсон', 'Вільям', 'Джеймс', 'Паспорт', 'ЕФ', '345678');

INSERT INTO ticket_purchase (passenger_id, flight_id, purchase_date) 
VALUES 
    (1, 1, '2023-10-20'),
    (2, 2, '2023-10-21'),
    (3, 3, '2023-10-22');

INSERT INTO ticket_return (purchase_id, return_date) 
VALUES 
    (1, '2023-10-25'),
    (2, '2023-10-26');

INSERT INTO route (departure_city, arrival_city) 
VALUES 
    ('Нью-Йорк', 'Лос-Анджелес'),
    ('Париж', 'Лондон'),
    ('Токіо', 'Сеул');

INSERT INTO seat_category (category_name, description) 
VALUES 
    ('Економ', 'Стандартне сидіння'),
    ('Бізнес', 'Додаткове простір для ніг та послуги'),
    ('Перший клас', 'Розкішні сидіння та сервіс');

INSERT INTO seat (flight_id, category_id, seat_number, is_available) 
VALUES 
    (1, 1, 'А01', TRUE),
    (1, 2, 'Б02', TRUE),
    (2, 1, 'В03', TRUE),
    (2, 2, 'Г04', TRUE),
    (3, 1, 'Д05', TRUE),
    (3, 2, 'Е06', TRUE);

INSERT INTO baggage (passenger_id, weight_kg) 
VALUES 
    (1, 20.5),
    (2, 18.0),
    (3, 25.2);

INSERT INTO agency (agency_name, contact_email, contact_phone) 
VALUES 
    ('Туристичні експерти', 'info@travelexperts.com', '+1 (555) 123-4567'),
    ('Глобальні подорожі', 'info@globaltravel.com', '+1 (555) 987-6543');

INSERT INTO booking (flight_id, passenger_id, booking_date, agency_id) 
VALUES 
    (1, 1, '2023-10-25', 1),
    (2, 2, '2023-10-26', 2),
    (3, 3, '2023-10-27', 1);

INSERT INTO payment (booking_id, payment_date, payment_amount) 
VALUES 
    (1, '2023-10-25', 250.00),
    (2, '2023-10-26', 300.00),
    (3, '2023-10-27', 200.00);
