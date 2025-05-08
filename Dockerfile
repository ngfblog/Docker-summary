FROM python:3.10-alpine

RUN apk add --no-cache bash docker-cli tzdata curl

WORKDIR /app

COPY generate_summary.sh /app/generate_summary.sh
COPY run_server.py /app/run_server.py

RUN chmod +x /app/generate_summary.sh

RUN pip install flask

ENV TZ=Asia/Jerusalem

CMD ["python", "/app/run_server.py"]