FROM python:3.11-slim

WORKDIR /app

# Install system deps for TensorFlow
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency list and install
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY review-imdb /app/review-imdb
WORKDIR /app/review-imdb

# Expose port for Flask/Gunicorn
ENV PORT=5000
EXPOSE 5000

# Start Gunicorn server
CMD ["gunicorn", "api_server:app", "--bind", "0.0.0.0:5000", "--workers", "2", "--timeout", "120"]


