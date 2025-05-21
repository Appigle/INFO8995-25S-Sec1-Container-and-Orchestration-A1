# Questions

## The steps you followed to containerize the application.

First, I created a basic static web application using Vite + Vue:

```shell
npm create vite@latest . -- --template vue
npm install
npm run dev
```

Then, I customized the app by modifying component files and adding new features, such as integrating Lottie animations.

Second, I created a Dockerfile and a .dockerignore file to define the containerization process and exclude unnecessary files like node_modules.

In the Dockerfile, I used:

```dockerfile
FROM node:20.11.1-alpine AS build-stage
```

This served as the build stage. I copied the necessary files into the container and ran the build process using:

```bash
npm run build
```

Next, I added a second stage using Nginx:

```dockerfile
FROM nginx:1.25.3-alpine AS production-stage
```

I copied the compiled `dist` files from the build stage into Nginx’s default static directory and configured it to expose port `80`. Finally, I started the Nginx service.

To complete the process, I ran Docker commands to build and run the image, making the application accessible at `http://localhost:80`, [screenshot](./screenshot/website.png).

## How You Implemented Volumes or Bind Mounts and Their Purpose

I used Docker volumes to ensure persistent and isolated data storage. Volumes are managed by Docker and ideal for storing application data, logs, or database content across container restarts. For example:

```bash
docker run -it -v demo_volume:/data alpine:latest
```

This allows the container to access the `/data` directory backed by a persistent volume, suitable for scenarios like caching or sharing data between containers.

## Any Challenges Faced and How You Resolved Them

Challenges: One key challenge was selecting the correct versions of the Node and Nginx base images to ensure compatibility and stability, other one is the security.

Solution: I researched the most compatible and stable versions online, cross-checked with the official Docker Hub documentation, and aligned my Dockerfile with established best practices, such as using multi-stage builds, pinned image versions, and non-root execution where applicable.
