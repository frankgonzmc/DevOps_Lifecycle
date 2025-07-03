FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /my_project

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY ../../requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ../../my_project/ .

RUN mkdir -p /app/static /app/media
RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "my_project.wsgi:application", "--bind", "0.0.0.0:8000", "--workers=3"]
