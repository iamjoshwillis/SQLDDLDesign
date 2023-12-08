-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER NOT NULL REFERENCES suns,
  galaxy INTEGER NOT NULL REFERENCES galaxies,
  moons INTEGER[] REFERENCES moons
);

CREATE TABLE suns (
  id SERIAL PRIMARY KEY,
  orbited_name TEXT NOT NULL
);

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL
);

INSERT INTO planets
  (name, orbital_period_in_years)
VALUES
  ('Earth', 1.00),
  ('Mars', 1.88),
  ('Venus', 0.62),
  ('Neptune', 164.8),
  ('Proxima Centauri b', 0.03),
  ('Gliese 876 b', 0.23);

INSERT INTO suns (orbited_name) VALUES ('The Sun','Proxima Centauri','Gliese 876');

INSERT INTO galaxies (galaxy_name) VALUES ('Milky Way');

INSERT INTO moons (moon_name) VALUES ('The Moon','Phobos','Deimos','Naiad','Thalassa','Despina','Galatea','Larissa','S/2004 N 1','Proteus','Triton','Nereid','Halimede','Sao','Laomedia','Psamathe','Neso');
