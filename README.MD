#1. Execute (Just one time)=> chmod +x scripts/deploy.sh
#2. Execute, every time you want to deploy the project => ./scripts/deploy.sh

###Ejecutar en Desarrollo###
cp .env.development .env
docker-compose up --build

###Ejecutar en Desppliegue###
cp .env.production .env
./scripts/deploy.sh