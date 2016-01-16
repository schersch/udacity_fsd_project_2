-- Table definitions for the tournament project.
--

-- Get rid of existing tables that might cause errors
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Players;

-- Players Table
-- Holds each player's name
CREATE TABLE Players (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Matches Table
-- Holds the result of a match between two players
CREATE TABLE Matches (
    id SERIAL PRIMARY KEY,
    winner INT REFERENCES Players(id),
    loser INT REFERENCES Players(id)
);
