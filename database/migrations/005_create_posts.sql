CREATE TABLE posts (
    id              SERIAL PRIMARY KEY,
    reddit_id       VARCHAR(20) UNIQUE NOT NULL,
    team_id         INTEGER REFERENCES teams(id),
    season_id       INTEGER REFERENCES seasons(id),
    title           VARCHAR(500) NOT NULL,
    flair           VARCHAR(100),                   -- raw flair text exactly as Reddit returns it
    post_type       VARCHAR(50),                    -- normalized: "game_thread", "post_game", "discussion"
    created_utc     TIMESTAMP NOT NULL,
    scraped_at      TIMESTAMP DEFAULT NOW()
);
