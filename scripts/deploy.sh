#!/bin/bash

ENV=$1

if [ "$ENV" == "dev" ]; then
    echo "Desplegando en entorno de desarrollo..."
    cp .env.development .env
    docker-compose up --build
elif [ "$ENV" == "prod" ]; then
    echo "Desplegando en entorno de producción..."
    cp .env.production .env
    docker-compose -f docker-compose.yml up --build -d
    docker-compose exec web python manage.py migrate
    docker-compose exec web python manage.py collectstatic --noinput
else
    echo "Entorno no reconocido. Usa: dev o prod"
fi