# Docker Summary Web Interface

A lightweight Docker container that displays a web-based summary of your running containers and networks.  
Provides a dark-themed table, sorting, filtering, and easy refresh.

Open in your browser: http://localhost:8090/view

## 🔧 Features

- Real-time HTML summary of all running containers
- Displays container name, image, status, ports, network name, and IDs
- Includes a searchable/sortable table
- Refresh button to update on demand
- Built for Unraid with a customizable template

## 🚀 How to Use

```bash
docker run -d \
  --name docker-summary \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -p 8090:8090 \
  -e TZ=Your/Timezone \
  docker-summary
