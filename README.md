# Self-Host Supabase Docker Setup

This guide will walk you through setting up Supabase using Docker on your local machine. The instructions include installing necessary dependencies, setting up the Supabase environment, and starting the services using Docker Compose.

## Requirements

- Ubuntu or other Linux distributions
- Git
- Docker
- Docker Compose

## Installation Steps

### 1. Update Your System

Before starting, make sure your system is up to date:

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install Docker and Git
Next, install Docker and Git on your machine:

```bash
sudo apt install docker.io git
```
Once installed, enable and start Docker:

```bash
sudo systemctl enable docker
sudo systemctl start docker
```
### 3. Install Docker Compose (Standalone)
Download the standalone version of [Docker Compose](https://docs.docker.com/compose/install/standalone/):

```bash
curl -SL https://github.com/docker/compose/releases/download/v2.29.6/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
```
Navigate to the directory and make the file executable:

```bash
cd /usr/local/bin
chmod +x docker-compose
cd
```

### 4. Clone the Supabase Repository

Clone the Supabase repository from GitHub to get the necessary code:

```bash
git clone --depth 1 https://github.com/supabase/supabase
```
Navigate to the Docker folder inside the Supabase directory:

```bash
cd supabase/docker
```
### 5. Set Up Environment Variables
Supabase requires environment variables for configuration. Copy the example environment variables file:

```bash
cp .env.example .env
```
You can customize the .env file later to suit your specific requirements.

### 6. Pull the Latest Docker Images
Before starting the services, ensure you have the latest Docker images for Supabase:

```bash
docker-compose pull
```
### 7. Start Supabase Services
Start the services using Docker Compose in detached mode:

```bash
docker-compose up -d
```

This will start all required services, including the Supabase database and other backend services.

### 8. Verify Service Status
Check the status of the services to ensure everything is running correctly:


```bash
docker-compose ps
```

You should see the list of running containers and their statuses.

### 9. Access the Supabase Dashboard
Once the services are up and running, you can access the Supabase dashboard by going to the following URL in your browser:

```bash
http://<server_ip>:8000
```

You will be prompted to enter a username and password. The default credentials are:

Username: supabase

Password: this_password_is_insecure_and_should_be_updated

### 10. Troubleshooting: Storage Error
If you encounter an error stating that storage is missing, you can manually create the storage volume by running:

```bash
touch /root/supabase/docker/volumes/storage
sudo docker-compose up -d
```

This should resolve the issue and start the services without errors.


#### Extra Resources

[Supabase Documentation](https://supabase.com/docs/guides/self-hosting/docker)





