# Vue Lottie Animation Project

This project is a Vue.js application that displays a Lottie animation using lottie-web-vue.

## Prerequisites

- Node.js (v16 or higher)
- npm (v7 or higher)
- Docker (for containerized deployment)

## Local Development

1. Install dependencies:

```bash
npm install
```

2. Start the development server:

```bash
npm run dev
```

The application will be available at `http://localhost:5173`

## Docker Deployment

### Building the Docker Image

1. Build the Docker image:

```bash
docker build -t vue-lottie-app .
```

This command:

- Creates a Docker image named `vue-lottie-app`
- Uses a multi-stage build process to optimize the image size
- Builds the Vue application and serves it using Nginx

### Running the Container

1. Run the container:

```bash
docker run -d -p 8080:80 vue-lottie-app
```

This command:

- Runs the container in detached mode (`-d`)
- Maps port 8080 on your host to port 80 in the container (`-p 8080:80`)
- Uses the `vue-lottie-app` image we built

If port 8080 is already in use, you can use a different port:

```bash
docker run -d -p 3000:80 vue-lottie-app
```

2. Access the application:
   Open your browser and navigate to:
   - `http://localhost:8080` (if using default port)
   - `http://localhost:3000` (if using alternative port)

### Troubleshooting

#### Port Already in Use

If you see an error like:

```
Error response from daemon: Bind for 0.0.0.0:8080 failed: port is already allocated
```

Try these solutions:

1. Use a different port:

```bash
docker run -d -p 3000:80 vue-lottie-app
```

2. Find and stop the process using port 8080:

```bash
# On macOS/Linux
lsof -i :8080
# Then stop the process using the found PID
kill <PID>
```

3. Stop all running containers and try again:

```bash
docker stop $(docker ps -a -q)
```

### Container Management

- View running containers:

```bash
docker ps
```

- Stop the container:

```bash
docker stop <container_id>
```

- Remove the container:

```bash
docker rm <container_id>
```

- Remove the image:

```bash
docker rmi vue-lottie-app
```

### Updating the Project

When you make changes to your project, follow these steps to update the Docker container:

1. Stop and remove the existing container:

```bash
# Find the container ID
docker ps

# Stop the container
docker stop <container_id>

# Remove the container
docker rm <container_id>
```

2. Remove the old image:

```bash
docker rmi vue-lottie-app
```

3. Rebuild the image with your changes:

```bash
docker build -t vue-lottie-app .
```

4. Run the new container:

```bash
docker run -d -p 3000:80 vue-lottie-app
```

#### Development Workflow Tips

- For local development, use `npm run dev` to see changes immediately
- Only build and deploy to Docker when you're ready to test the production build
- You can use different tags for different versions:

```bash
# Build with a version tag
docker build -t vue-lottie-app:v1.0 .

# Run specific version
docker run -d -p 3000:80 vue-lottie-app:v1.0
```

## Project Structure

- `src/` - Source code directory
  - `components/` - Vue components
  - `assets/` - Static assets including Lottie animation files
- `Dockerfile` - Docker configuration for building the container
- `nginx.conf` - Nginx configuration for serving the application
- `.dockerignore` - Specifies files to exclude from Docker build

## Technologies Used

- Vue 3
- Vite
- lottie-web-vue
- Docker
- Nginx
