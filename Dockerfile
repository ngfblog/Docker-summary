FROM python:3.10-slim

WORKDIR /app

# Copy all files into the container
COPY run_server.py .
COPY generate_summary.sh .
COPY docker_summary.html .
COPY icon.png .

# Install necessary tools
RUN apt-get update && \
    apt-get install -y bash curl docker.io && \
    chmod +x /app/generate_summary.sh

EXPOSE 8090

CMD ["python", "/app/run_server.py"]
