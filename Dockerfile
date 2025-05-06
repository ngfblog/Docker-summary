FROM debian:bullseye-slim

# Set timezone via build arg
ARG TZ=Asia/Jerusalem
ENV TZ=${TZ}

# Install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    python3 \
    python3-pip \
    curl \
    ca-certificates \
    iproute2 \
    net-tools \
    tzdata \
    docker.io \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all files
COPY . /app

# Make the shell script executable
RUN chmod +x /app/generate_summary.sh

# Expose the port
EXPOSE 8090

# Run the Python server
CMD ["python3", "run_server.py"]
