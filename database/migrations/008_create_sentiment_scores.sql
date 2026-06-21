CREATE TABLE sentiment_scores (
    id              SERIAL PRIMARY KEY,
    comment_id      INTEGER REFERENCES raw_comments(id) UNIQUE,
    positive        FLOAT NOT NULL,                 -- confidence 0.0 to 1.0
    neutral         FLOAT NOT NULL,
    negative        FLOAT NOT NULL,
    label           VARCHAR(20) NOT NULL,           -- "positive", "neutral", "negative"
    scored_at       TIMESTAMP DEFAULT NOW()
);
