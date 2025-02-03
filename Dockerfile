# Base image
FROM nginx:alpine

# Copy index.html into the container
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]