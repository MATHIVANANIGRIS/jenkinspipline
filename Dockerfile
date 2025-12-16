FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install nginx -y

# Remove default nginx site
RUN rm -rf /var/www/html/*

# Copy your project
COPY . /var/www/html/

RUN mkdir -p /run/nginx

# Make sure permissions are correct
RUN chmod -R 755 /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
