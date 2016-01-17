-- Table definitions for the tournament project.
--

-- Get rid of existing tables that might cause errors
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Players;
DROP VIEW IF EXISTS MatchCounts;
DROP VIEW IF EXISTS WinCounts;
DROP VIEW IF EXISTS Standings;

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

-- WinCounts View
-- Shows the current Win Count for each player
CREATE VIEW WinCounts AS
    SELECT Players.id, COUNT(Matches.winner) AS total
    FROM Players JOIN Matches
    ON Players.id = Matches.winner
    GROUP BY Players.id;

-- MatchCounts View
-- Shows the current Match Count for each player
CREATE VIEW MatchCounts AS
    SELECT Players.id, Count(Matches.id) AS total
    FROM Players JOIN Matches
    ON Players.id = Matches.winner OR Players.id = Matches.loser
    GROUP By Players.id;

-- Standings View
-- Shows the number of wins and matches for each player
-- coalesce function suggested by Udacity reviewer to populate null values with 0
CREATE VIEW Standings AS
    SELECT Players.id, Players.name, coalesce(WinCounts.total, 0) AS wins,
           coalesce(MatchCounts.total, 0) AS matches 
    FROM Players LEFT JOIN WinCounts ON Players.id = WinCounts.id
    LEFT JOIN MatchCounts ON MatchCounts.id = WinCounts.id;
