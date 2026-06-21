#!/usr/bin/env python3
"""
Runs all .sql files in database/migrations/ in order against the target database.
Usage:
    python run_migrations.py

Reads connection details from environment variables (set these in a .env file,
or directly in your shell):
    DB_HOST (default: localhost)
    DB_PORT (default: 5432)
    DB_NAME (default: nba_sentiment)
    DB_USER (default: postgres)
    DB_PASSWORD (required)
"""

import os
import sys
import glob
import psycopg2

MIGRATIONS_DIR = os.path.join(os.path.dirname(__file__), "migrations")


def get_connection():
    return psycopg2.connect(
        host=os.getenv("DB_HOST", "localhost"),
        port=os.getenv("DB_PORT", "5432"),
        dbname=os.getenv("DB_NAME", "nba_sentiment"),
        user=os.getenv("DB_USER", "postgres"),
        password=os.getenv("DB_PASSWORD"),
    )


def run_migrations():
    migration_files = sorted(glob.glob(os.path.join(MIGRATIONS_DIR, "*.sql")))

    if not migration_files:
        print("No migration files found in", MIGRATIONS_DIR)
        return

    conn = get_connection()
    conn.autocommit = False
    cur = conn.cursor()

    for filepath in migration_files:
        filename = os.path.basename(filepath)
        print(f"Running {filename}...")
        with open(filepath, "r") as f:
            sql = f.read()
        try:
            cur.execute(sql)
            conn.commit()
            print(f"  ✓ {filename} applied successfully")
        except Exception as e:
            conn.rollback()
            print(f"  ✗ {filename} failed: {e}")
            sys.exit(1)

    cur.close()
    conn.close()
    print("\nAll migrations applied successfully.")


if __name__ == "__main__":
    run_migrations()
