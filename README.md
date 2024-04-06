# Set Up CS2D Server using Docker

```
sudo docker build -t <image_name> <directory>
```
```
sudo docker --restart unless-stopped -dp <udp_port>:<udp_port>/udp --name <container_name> <image_name> -name <server_name> -port <udp_port> -rcon <server_admin_password>
```
