CREATE TABLE comment_player_mentions (
    id              SERIAL PRIMARY KEY,
    comment_id      INTEGER REFERENCES raw_comments(id),
    player_id       INTEGER REFERENCES players(id),
    mention_type    VARCHAR(20) NOT NULL            -- "direct" (name/alias found) or "context" (resolved from thread/parent)
);
