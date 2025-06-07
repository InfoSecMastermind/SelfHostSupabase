# Self-Host Supabase Docker Setup

This guide will walk you through setting up Supabase using Docker on your local machine. The instructions include installing necessary dependencies, setting up the Supabase environment, and starting the services using Docker Compose.

## Requirements

- Ubuntu or similar Debian Linux distributions
- Git
- Docker
- Docker Compose

### **What the Script Does**

This script automates the setup and deployment of a self-hosted Supabase instance on a Linux system. It begins by preparing the environment, then proceeds to download, configure, and launch all the necessary components for Supabase to run.

Here's a step-by-step breakdown of the script's actions:

1.  **System Preparation**: The script starts by updating the system's package list and upgrading all installed packages to their latest versions using `sudo apt update && sudo apt upgrade -y`. This ensures a stable and secure base for the new software.

2.  **Dependency Installation**: It then installs **Docker**, a containerization platform, and **Git**, a version control system (`sudo apt install docker.io git`). Docker is essential for running the containerized Supabase services, and Git is used to download the Supabase source code. After installation, the script ensures the Docker service is enabled to start on boot and then starts it with `sudo systemctl enable docker` and `sudo systemctl start docker`.

3.  **Docker Compose Setup**: The script downloads the standalone **Docker Compose** binary. This tool is used to define and run multi-container Docker applications. It places the binary in a system-wide accessible location (`/usr/local/bin/docker-compose`) and makes it executable (`chmod +x docker-compose`), allowing it to be run from any directory.

4.  **Source Code Retrieval**: It clones the official Supabase repository from GitHub using `git clone --depth 1 https://github.com/supabase/supabase`. The `--depth 1` flag ensures a shallow clone, downloading only the most recent version of the code to save time and space. The script then navigates into the `supabase/docker` directory, which contains the necessary configuration for a Docker-based setup.

5.  **Configuration**: The script creates a new environment configuration file, `.env`, by copying the provided example file (`cp .env.example .env`). This file holds all the configuration variables, such as API keys and database credentials, that Supabase needs to run.

6.  **Image Download**: It then uses `docker-compose pull` to download all the required Docker images from the registry. These are pre-built images containing the various microservices that make up the Supabase stack, including the database, authentication server, and API gateway.

7.  **Service Launch**: With the configuration in place and images downloaded, the script starts all the Supabase services in detached mode (`-d`) using `docker-compose up -d`, meaning they will run in the background.

8.  **Verification**: Finally, the script checks and displays the status of all the running Docker containers with `docker-compose ps`, allowing you to verify that every component of the Supabase stack has started correctly.

***

Once the script completes, a full Supabase instance will be running and accessible via a web browser at the **server's IP address** on port `8000`. To log in to the dashboard, use the default credentials:

**Username:** `supabase`
**Password:** `this_password_is_insecure_and_should_be_updated`
### Troubleshooting: Storage Error
If you encounter an error stating that storage is missing, you can manually create the storage volume by running:

```bash
touch /root/supabase/docker/volumes/storage
sudo docker-compose up -d
```

This should resolve the issue and start the services without errors.


#### Extra Resources

[Supabase Documentation](https://supabase.com/docs/guides/self-hosting/docker)





