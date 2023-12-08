-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  first_name TEXT NOT NULL REFERENCES passengers(first_name),
  last_name TEXT NOT NULL REFERENCES passengers(last_name),
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER NOT NULL REFERENCES airlines,
  from_city TEXT NOT NULL REFERENCES cities(city_name),
  from_country TEXT NOT NULL REFERENCES countries(country_name),
  to_city TEXT NOT NULL REFERENCES cities(city_name),
  to_country TEXT NOT NULL REFERENCES countries(country_name)
);

INSERT INTO tickets
  (departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 4, 3),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 1, 6, 1),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 7, 4),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5, 9, 6),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 7, 11, 8),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 13, 1),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15, 1),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 1, 16, 1),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18, 10);

INSERT INTO countries (country_name) VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Moroco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO cities (city_name) VALUES
  ('Washington DC'),
  ('Seattle'),
  ('Tokyo'),
  ('London'),
  ('Los Angeles'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Paris'),
  ('Casablanca'),
  ('Dubai'),
  ('Beijing'),
  ('New York'),
  ('Charlotte'),
  ('Cedar Rapids'),
  ('Chicago'),
  ('New Orleans'),
  ('Sao Paolo'),
  ('Santiago');

INSERT INTO passengers (first_name, last_name, seat) 
VALUES 
  ('Jennifer','Finch','33B'),
  ('Thadeus','Gathercoal','8A'),
  ('Sonja','Pauley','12F'),
  ('Jennifer', 'Finch', '20A'),
  ('Waneta', 'Skeleton', '23D'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff', '9E'),
  ('Alvin', 'Leathes', '1A'),
  ('Berkie', 'Wycliff', '32B'),
  ('Cory', 'Squibbes', '10D');

INSERT INTO airlines (airline_name) VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avainca Brasil');