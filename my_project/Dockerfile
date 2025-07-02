FROM python:3.9-slim

#Establecer directorio de trabajo
WORKDIR /my_project

#Copiar archivos de la app
COPY requirements.txt /my_project/

#Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

#Copiar el resto de codigo de la app
COPY . /my_project/

#Exponer el puerto
EXPOSE 8000

#Comando para ejecutar Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

