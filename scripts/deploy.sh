#!/bin/bash

echo "Construyendo y levantando contenedores..."
docker-compose --env-file .env up --build -d

echo "Aplicando migraciones..."
docker-compose exec web python manage.py migrate

echo "¡Despliegue completo!"