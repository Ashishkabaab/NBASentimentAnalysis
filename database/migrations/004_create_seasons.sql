CREATE TABLE seasons (
    id              SERIAL PRIMARY KEY,
    label           VARCHAR(50) UNIQUE NOT NULL,   -- "2025-26", "Summer 2026"
    season_type     VARCHAR(20) NOT NULL,           -- "regular", "summer_league", "playoffs"
    start_date      DATE NOT NULL,
    end_date        DATE NOT NULL
);
