# Use nginx alpine as base image for a lightweight container
FROM nginx:alpine

# Copy all static files to nginx html directory
COPY index.html /usr/share/nginx/html/
COPY dist /usr/share/nginx/html/dist

RUN mkdir -p /var/cache/nginx/client_temp \
    /var/cache/nginx/proxy_temp \
    /var/cache/nginx/fastcgi_temp \
    /var/cache/nginx/uwsgi_temp \
    /var/cache/nginx/scgi_temp && \
    chown -R 1000:1000 /var/cache/nginx

RUN mkdir -p /run && chown -R 1000:1000 /run

# Expose port 80
EXPOSE 80

# Start nginx in foreground (daemon off prevents nginx from running in background)
CMD ["nginx", "-g", "daemon off;"]
