# Use an official PHP runtime as a parent image
FROM php:8.1-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the Laravel backend files to the container
COPY . .

# Install necessary dependencies for Laravel and Node.js
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libonig-dev \
    libzip-dev \
    nodejs \
    npm \
    && docker-php-ext-install pdo_mysql zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel dependencies
RUN composer install --no-interaction

# Install Vue.js dependencies
RUN npm install
# RUN npm run dev
RUN npm run prod



# Configure Apache for Laravel
RUN a2enmod rewrite
COPY docker/apache2.conf /etc/apache2/sites-available/000-default.conf

# Expose ports
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
