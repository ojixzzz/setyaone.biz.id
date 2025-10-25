# Use nginx alpine as base image for a lightweight container
FROM nginx:alpine

# Copy all static files to nginx html directory
COPY index.html /usr/share/nginx/html/
COPY dist /usr/share/nginx/html/dist

# Expose port 80
EXPOSE 80

# Start nginx in foreground (daemon off prevents nginx from running in background)
CMD ["nginx", "-g", "daemon off;"]