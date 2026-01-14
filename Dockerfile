FROM python:3.10-slim

WORKDIR /app
COPY . /app

# Install system deps (only if needed)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies including awscli
RUN pip install --no-cache-dir awscli -r requirements.txt

CMD ["python", "app.py"]