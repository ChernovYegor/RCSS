CREATE TABLE aircraft_type (
    id_aircraft_type BIGINT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL,
    max_passenger_capacity INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE aircraft (
    id_aircraft BIGINT AUTO_INCREMENT PRIMARY KEY,
    aircraft_type_id BIGINT NOT NULL,
    aircraft_registration_number VARCHAR(20) NOT NULL,
    FOREIGN KEY (aircraft_type_id) REFERENCES aircraft_type (id_aircraft_type)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE flight (
    id_flight BIGINT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(10) NOT NULL,
    aircraft_type_id BIGINT NOT NULL,
    departure_airport_id BIGINT NOT NULL,
    arrival_airport_id BIGINT NOT NULL,
    departure_date DATE NOT NULL,
    departure_time TIME NOT NULL,
    flight_duration INT NOT NULL,
    ticket_price FLOAT NOT NULL,
    FOREIGN KEY (aircraft_type_id) REFERENCES aircraft_type (id_aircraft_type)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (departure_airport_id) REFERENCES airport (id_airport)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (arrival_airport_id) REFERENCES airport (id_airport)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE passenger (
    id_passenger BIGINT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100) NOT NULL,
    document_type VARCHAR(100) NOT NULL,
    document_series VARCHAR(10) NOT NULL,
    document_number VARCHAR(20) NOT NULL,
    FOREIGN KEY (flight_id) REFERENCES flight (id_flight)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ticket_purchase (
    id_purchase BIGINT AUTO_INCREMENT PRIMARY KEY,
    passenger_id BIGINT NOT NULL,
    flight_id BIGINT NOT NULL,
    purchase_date DATE NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES passenger (id_passenger)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flight (id_flight)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ticket_return (
    id_return BIGINT AUTO_INCREMENT PRIMARY KEY,
    purchase_id BIGINT NOT NULL,
    return_date DATE NOT NULL,
    FOREIGN KEY (purchase_id) REFERENCES ticket_purchase (id_purchase)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE route (
    id_route BIGINT AUTO_INCREMENT PRIMARY KEY,
    departure_city VARCHAR(100) NOT NULL,
    arrival_city VARCHAR(100) NOT NULL,
    FOREIGN KEY (departure_city) REFERENCES airport (city)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (arrival_city) REFERENCES airport (city)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Таблица категорий мест
CREATE TABLE seat_category (
    id_category BIGINT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE seat (
    id_seat BIGINT AUTO_INCREMENT PRIMARY KEY,
    flight_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (flight_id) REFERENCES flight (id_flight)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (category_id) REFERENCES seat_category (id_category)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE baggage (
    id_baggage BIGINT AUTO_INCREMENT PRIMARY KEY,
    passenger_id BIGINT NOT NULL,
    weight_kg FLOAT NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES passenger (id_passenger)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE agency (
    id_agency BIGINT AUTO_INCREMENT PRIMARY KEY,
    agency_name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100) NOT NULL,
    contact_phone VARCHAR(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE booking (
    id_booking BIGINT AUTO_INCREMENT PRIMARY KEY,
    flight_id BIGINT NOT NULL,
    passenger_id BIGINT NOT NULL,
    booking_date DATE NOT NULL,
    agency_id BIGINT NOT NULL,
    FOREIGN KEY (flight_id) REFERENCES flight (id_flight)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (passenger_id) REFERENCES passenger (id_passenger)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (agency_id) REFERENCES agency (id_agency)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE payment (
    id_payment BIGINT AUTO_INCREMENT PRIMARY KEY,
    booking_id BIGINT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount FLOAT NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES booking (id_booking)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;