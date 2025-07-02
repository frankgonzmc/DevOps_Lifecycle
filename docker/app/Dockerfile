FROM python:3.9-slim

# Establecer variables de entorno
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


#Establecer directorio de trabajo
WORKDIR /my_project

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Crear usuario no-root
RUN useradd -m myuser
USER myuser

# Copiar e instalar dependencias de Python
COPY --chown=myuser:myuser requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código
COPY --chown=myuser:myuser . .

# Crear directorios de static y media si no existen
RUN mkdir -p /app/static /app/media

# Recolectar archivos estáticos
RUN python manage.py collectstatic --noinput

# Exponer el puerto
EXPOSE 8000

# Ejecutar Gunicorn como WSGI server
CMD ["gunicorn", "my_project.wsgi:application", "--bind", "0.0.0.0:8000", "--workers=3"]
