FROM python:3.11-slim

WORKDIR /app

# System dependencies needed for psycopg2 to compile
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies first (caches this layer unless requirements change)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project code
COPY . .

# Default command (overridden per-service in docker-compose.yml)
CMD ["python", "--version"]
