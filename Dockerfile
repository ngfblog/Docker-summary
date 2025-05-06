FROM python:3.10-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y bash curl dos2unix && \
    rm -rf /var/lib/apt/lists/*

# Set timezone via env
ENV TZ=Asia/Jerusalem

# Create app directory
WORKDIR /app

# Copy files
COPY . /app

# Ensure script is executable and in correct format
RUN dos2unix /app/generate_summary.sh && chmod +x /app/generate_summary.sh

# Expose port
EXPOSE 8090

# Run the server
CMD ["python", "/app/run_server.py"]
