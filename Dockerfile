FROM python:3.10-slim

WORKDIR /app

COPY generate_summary.sh run_server.py icon.png ./

RUN chmod +x /app/generate_summary.sh

RUN apt-get update && apt-get install -y docker.io bash && \
    pip install --no-cache-dir --upgrade pip

EXPOSE 8090

CMD ["python", "/app/run_server.py"]
