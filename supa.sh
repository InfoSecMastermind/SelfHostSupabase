#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install Dockerb & git
sudo apt install -y docker.io
sudo apt install -y git

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Install Docker Compose standalone
sudo curl -SL https://github.com/docker/compose/releases/download/v2.29.6/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

# Change permissions to make docker-compose executable
sudo chmod +x /usr/local/bin/docker-compose

# Clone the Supabase repository
git clone --depth 1 https://github.com/supabase/supabase

# Navigate to the Supabase Docker folder
cd supabase/docker

# Copy the environment file
cp .env.example .env

# Pull the latest Docker images for Supabase services
sudo docker-compose pull

# Start Supabase services in detached mode
sudo docker-compose up -d

echo "Supabase is now up and running!"
