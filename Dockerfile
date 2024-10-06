FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential libpq-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY /analytics/ /app

RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r /app/requirements.txt

EXPOSE 5153

CMD ["python", "app/app.py"]
