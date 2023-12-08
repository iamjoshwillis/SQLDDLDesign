DROP DATABASE IF EXISTS medcenter_db;
CREATE DATABASE medcenter_db;
\c medcenter_db;

CREATE TABLE physicians (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    disease_id INTEGER REFERENCES diseases
    description TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    physicians_seen INTEGER REFERENCES physicians,
    diagnoses INTEGER REFERENCES diagnoses
);
