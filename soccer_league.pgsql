DROP DATABASE IF EXISTS soccerleague_db;
CREATE DATABASE soccerleague_db;
\c soccerleague_db;

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES teams,
    team2_id INTEGER REFERENCES teams,
    referee INTEGER REFERENCES referees
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);