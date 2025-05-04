
<p align="center">
  <img src="https://raw.githubusercontent.com/ngfblog/Docker-summary/main/icon.png" alt="Docker Summary Icon" width="120"/>
</p>

# Docker Summary

Generate a beautiful, sortable, filterable HTML report of your running Docker containers.  
Perfect for monitoring, documentation, or simply keeping your environment clear.

---

## ✨ Features

- Dark-themed HTML summary
- Sortable & filterable table
- Shows container name, image, status, network, ports, Docker ID and more
- Auto-refresh button
- Timestamped generation
- Lightweight & fast

---

## 🐳 Docker Hub

**Image:**  
[`ngfblog/docker-summary`](https://hub.docker.com/r/ngfblog/docker-summary)

---

## 🚀 Unraid Installation (via Template)

### 1. Go to:  
**Unraid Dashboard → Docker → Template Repositories (⚙️)**

### 2. Add the following URL:
```
https://raw.githubusercontent.com/ngfblog/Docker-summary/main/templates/docker-summary.xml
```

### 3. Save and go back to Docker tab  
Click **"Add Container"** → Select **Docker Summary** → Click **Apply**.

That’s it! Access the app at:
```
http://[YOUR_SERVER_IP]:8090/
```

---

## ⚙️ Manual Docker Run (CLI)

```bash
docker run -d   --name docker-summary   -p 8090:8090   -v /var/run/docker.sock:/var/run/docker.sock   -e TZ=Asia/Jerusalem   ngfblog/docker-summary
```

---

## 📁 File Structure

| File | Purpose |
|------|---------|
| `generate_summary.sh` | Gathers Docker container info and generates HTML |
| `run_server.py`       | Python HTTP server to serve and regenerate report |
| `docker-summary.xml`  | Unraid Docker template |
| `icon.png`            | Icon used in Unraid UI |

---

## 📸 Preview

![screenshot](https://raw.githubusercontent.com/ngfblog/Docker-summary/main/preview.png)

---

## 📫 Support

Open an issue on GitHub:  
[https://github.com/ngfblog/Docker-summary/issues](https://github.com/ngfblog/Docker-summary/issues)

---

## 🧡 Like it?

Give the project a ⭐ on GitHub and spread the word!
