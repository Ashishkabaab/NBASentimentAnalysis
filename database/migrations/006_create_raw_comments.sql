CREATE TABLE raw_comments (
    id                  SERIAL PRIMARY KEY,
    reddit_id           VARCHAR(20) UNIQUE NOT NULL,
    post_id             INTEGER REFERENCES posts(id),
    parent_reddit_id    VARCHAR(20),                -- immediate parent (a comment's reddit_id, or the post's reddit_id)
    body                TEXT NOT NULL,
    author              VARCHAR(100),
    upvotes             INTEGER DEFAULT 0,
    created_utc         TIMESTAMP NOT NULL,
    scraped_at          TIMESTAMP DEFAULT NOW()
);
