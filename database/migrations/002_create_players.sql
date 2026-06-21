CREATE TABLE players (
    id              SERIAL PRIMARY KEY,
    team_id         INTEGER REFERENCES teams(id),
    full_name       VARCHAR(100) NOT NULL,      -- "Anthony Edwards"
    is_active       BOOLEAN DEFAULT TRUE,       -- flip to FALSE if traded/waived, keeps history intact
    created_at      TIMESTAMP DEFAULT NOW()
);
