# VM Docker

This Docker Compose configuration is designed to run a service named "dockerindocker" using a Docker image from the GitHub Container Registry (GHCR). The "dockerindocker" service is configured with resource limits and environment variables to customize its behavior.

## Service Details

### `dockerindocker` Service
- **Image:** `ghcr.io/rodrikv/vm-docker:master`
  - This service uses the specified Docker image from GHCR as its base.

- **Deployment Configuration:**
  - Resource Limits:
    - CPU Limit: 10 CPUs
    - Memory Limit: 5 GB
  - Resource Reservations:
    - CPU Reservation: 0.25 CPUs
    - Memory Reservation: 256 MB
  - These limits and reservations define the available CPU and memory resources for the service.

- **Environment Variables:**
  - You need to set values for the following environment variables by editing the `.env` file or specifying them in your environment:
    - `TELEGRAM_API_TOKEN`: Replace with your Telegram API token.
    - `ENABLED_USERS`: Replace with the list of enabled users or leave it empty if not needed.
    - `ssh_pub_key`: Replace with the SSH public key configuration.
    - `ssh_port`: Replace with the SSH port number you want to use.

- **Ports Mapping:**
  - The service maps a port from the host to the container. Make sure to define the `$ssh_port` variable with the desired port number in your environment or `.env` file.

- **Volumes:**
  - The service mounts the `./volumes` directory on the host to `/home/volumes` inside the container. You can use this for data persistence or sharing files between the host and the container.

## Getting Started

1. Ensure you have Docker and Docker Compose installed on your system.

2. Create an `.env` file in the same directory as your `docker-compose.yml` and set the values for the environment variables mentioned above.

3. Edit the `docker-compose.yml` file and replace the placeholder variables with your desired values.

4. Start the service using the following command:

   ```bash
   docker-compose up -d
   ```

   This will launch the service in the background.

5. Monitor the service logs with:

   ```bash
   docker-compose logs -f dockerindocker
   ```

6. Access your service as configured, such as via SSH or any other relevant services.

7. To stop the service, run:

   ```bash
   docker-compose down
   ```

## Note

Please ensure that you have properly configured the environment variables and the necessary authentication tokens for the service to function as expected.

For more information on the `docker-compose` command and its options, please refer to the Docker documentation: [Docker Compose Documentation](https://docs.docker.com/compose/).
