FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    iproute2 \
    net-tools \
    procps \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY generate_summary.sh /app/generate_summary.sh
COPY run_server.py /app/run_server.py

RUN chmod +x /app/generate_summary.sh

EXPOSE 8090

CMD ["python", "/app/run_server.py"]
