# Use the official PHP Apache image as base
FROM php:apache

# Set environment variables for MySQL connection
ENV MYSQL_HOST=localhost \
    MYSQL_USER=admin \
    MYSQL_PASSWORD=admin \
    MYSQL_DATABASE=WebApp

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the application files into the container
COPY . /var/www/html

# Install MySQL client for PHP
RUN apt-get update && \
    apt-get install -y default-mysql-client

# Expose port 80
EXPOSE 80

# Start the Apache web server when the container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]
