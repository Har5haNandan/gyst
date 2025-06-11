# Use official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    poppler-utils \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency file
COPY ad2bd4ef-d00b-42f4-af81-5edb02189e66.txt requirements.txt

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files (adjust this path to match your project)
COPY . .

# Expose port for Flask (if using default)
EXPOSE 5000

# Start command (update to match your app's entry point)
CMD ["flask", "run", "--host=0.0.0.0"]
