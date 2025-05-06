FROM python:3.9-slim

RUN apt-get update && apt-get install -y docker.io

WORKDIR /app

COPY run_server.py /app/
COPY generate_summary.sh /app/
COPY docker_summary.html /app/

RUN chmod +x /app/generate_summary.sh

EXPOSE 8090

CMD ["python", "/app/run_server.py"]
