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

# Create non-root user
RUN adduser -D -H -u 1001 -s /sbin/nologin nginx-user

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy built app from build stage
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Set proper permissions
RUN chown -R nginx-user:nginx-user /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html && \
    chown -R nginx-user:nginx-user /var/cache/nginx && \
    chown -R nginx-user:nginx-user /var/log/nginx && \
    chown -R nginx-user:nginx-user /etc/nginx/conf.d && \
    touch /var/run/nginx.pid && \
    chown -R nginx-user:nginx-user /var/run/nginx.pid

# Expose app port
EXPOSE 80

# Run nginx as non-root user
USER nginx-user

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
