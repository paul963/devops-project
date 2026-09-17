# DevOps Project

Node.js + PostgreSQL application built progressively as a learning project for DevOps, infrastructure, containers, networking, and reliability concepts.

## Current Architecture

```text
Browser
   |
   | HTTP :80
   v
Nginx
   |
   | app:3000
   v
Node.js / Express
   |
   | postgres:5432
   v
PostgreSQL
   |
   v
Docker Volume
```

## Project Structure

```text
app/
├── nginx/
│   └── nginx.conf
├── .dockerignore
├── .gitignore
├── Dockerfile
├── docker-compose.yml
├── package.json
├── package-lock.json
├── README.md
└── server.js
```

## Application

The backend is built with:

* Node.js
* Express
* PostgreSQL
* `pg`
* `dotenv`

The API currently exposes:

```text
GET /health
GET /users
```

### Health endpoint

```text
GET /health
```

Returns:

```json
{
  "status": "ok"
}
```

### Users endpoint

```text
GET /users
```

Returns users stored in PostgreSQL.

The `users` table currently contains:

```text
id
name
surname
age
city
country
```

## PostgreSQL

Database:

```text
devops_app
```

Table:

```text
users
```

PostgreSQL runs inside its own Docker container.

The database data is stored in a named Docker volume:

```text
postgres_data
```

> Do not use `docker compose down -v` unless you intentionally want to remove the Docker volumes and their data.

## Docker

The Dockerfile uses:

```dockerfile
FROM node:22
```

The application dependencies are installed with:

```dockerfile
RUN npm ci
```

The Docker image exposes application port:

```text
3000
```

The container port is not published directly to the host. Instead, Docker Compose uses:

```yaml
expose:
  - "3000"
```

## Docker Compose

Docker Compose manages three services:

```text
app
nginx
postgres
```

### app

Runs the Node.js / Express application.

```text
Container port: 3000
```

### nginx

Acts as the reverse proxy.

```text
Host port: 80
Container port: 80
```

Traffic follows:

```text
Browser → Nginx → Node.js
```

### postgres

Runs PostgreSQL.

```text
Host port: 5432
Container port: 5432
```

## Nginx

Nginx is used as a reverse proxy.

```text
http://localhost/health
        |
        v
     Nginx :80
        |
        v
     app:3000
        |
        v
      Express
```

Nginx forwards proxy headers including:

```nginx
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;
```

## Useful Commands

Start the project:

```powershell
docker compose up -d
```

Build and start:

```powershell
docker compose up --build -d
```

Stop the project:

```powershell
docker compose down
```

View running containers:

```powershell
docker ps
```

View Nginx logs:

```powershell
docker compose logs -f nginx
```

View application logs:

```powershell
docker compose logs -f app
```

Enter PostgreSQL:

```powershell
docker exec -it app-postgres-1 psql -U postgres -d devops_app
```

View users:

```sql
SELECT * FROM users;
```