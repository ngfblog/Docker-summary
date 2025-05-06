FROM python:3.10-slim

WORKDIR /app

COPY run_server.py .
COPY generate_summary.sh .
COPY icon.png .

RUN chmod +x generate_summary.sh

EXPOSE 8090

CMD ["python", "run_server.py"]
