# ---------- Build Stage ----------
FROM node:20.11.1-alpine AS build-stage

# Set working directory
WORKDIR /app

# Leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy remaining files
COPY . .

# Build the application
RUN npm run build


# ---------- Production Stage ----------
FROM nginx:1.25.3-alpine AS production-stage

LABEL maintainer="lchen5274@conestogac.on.ca"
LABEL version="1.0.0"
LABEL description="Lab: Docker for frontend static app"

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy built app from build stage
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose app port
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
