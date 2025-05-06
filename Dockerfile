FROM alpine:latest

# Install required packages: bash, curl, docker-cli, coreutils
RUN apk add --no-cache bash curl docker-cli coreutils

# Set working directory
WORKDIR /app

# Copy all project files into the container
COPY . /app

# Ensure generate_summary.sh is executable
RUN chmod +x /app/generate_summary.sh

# Set environment variable for timezone (optional)
ENV TZ=Asia/Jerusalem

# Expose the port
EXPOSE 8090

# Run the Python server
CMD ["python3", "/app/run_server.py"]
