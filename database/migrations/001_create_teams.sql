CREATE TABLE teams (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,      -- "Los Angeles Lakers"
    abbreviation    VARCHAR(10) NOT NULL,       -- "LAL"
    subreddit       VARCHAR(100) NOT NULL,      -- "lakers"
    created_at      TIMESTAMP DEFAULT NOW()
);
