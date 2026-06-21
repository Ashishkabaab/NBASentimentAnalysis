CREATE TABLE player_aliases (
    id              SERIAL PRIMARY KEY,
    player_id       INTEGER REFERENCES players(id),
    alias           VARCHAR(100) NOT NULL       -- "ant", "ant-man", "edwards"
);
