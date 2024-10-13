# Base image
FROM nginx:alpine

# Copy static website files to Nginx directory
COPY . /usr/share/nginx/html

# Expose port
EXPOSE 80
