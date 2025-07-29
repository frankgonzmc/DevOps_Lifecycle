#!/bin/bash
apt-get update -y
apt-get install -y docker.io git
usermod -aG docker ubuntu
systemctl start docker
systemctl enable docker

# Install Docker Compose (v2)
curl -SL https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Clone your real project
cd /home/ubuntu
git clone https://github.com/tu-usuario/inventario-devops.git
cd inventario-devops

# Deploy app
chmod +x scripts/deploy.sh
ENV=prod ./scripts/deploy.sh