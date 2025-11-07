# Use a small base image
FROM python:3.12-slim

# Safer/faster Python defaults
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    APP_ENV=container

# Workdir inside the container
WORKDIR /app

# Install deps first for better layer caching
COPY requirements.txt .
RUN python -m pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy application code
COPY src ./src

# Optional: run as non-root
RUN useradd -m appuser
USER appuser

# Expose Flask port
EXPOSE 5000

# Run your app (entrypoint lives at src/app/main.py)
CMD ["python", "src/app/main.py"]
