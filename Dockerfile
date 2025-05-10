# FROM php:8.3-fpm
# RUN apt-get update && apt upgrade -y
# RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli
# # ADD ./app /var/www/html
# ADD ./app /var/www/html
# COPY ./app/my-site.conf /etc/apache2/sites-available/my-site.conf
# RUN echo 'SetEnv MYSQL_DB_CONNECTION ${MYSQL_DB_CONNECTION}' >> /etc/apache2/conf-enabled/environment.conf
# RUN echo 'SetEnv MYSQL_DB_NAME ${MYSQL_DB_NAME}' >> /etc/apache2/conf-enabled/environment.conf
# RUN echo 'SetEnv MYSQL_USER ${MYSQL_USER}' >> /etc/apache2/conf-enabled/environment.conf
# RUN echo 'SetEnv MYSQL_PASSWORD ${MYSQL_PASSWORD}' >> /etc/apache2/conf-enabled/environment.conf
# RUN echo 'SetEnv SITE_URL ${SITE_URL}' >> /etc/apache2/conf-enabled/environment.conf
# RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf &&\
#     a2enmod rewrite &&\
#     a2enmod headers &&\
#     a2enmod rewrite &&\
#     a2dissite 000-default &&\
#     a2ensite my-site &&\
#     service apache2 restart
# EXPOSE 80
# EXPOSE 443

# Dockerfile
# Use the official PHP 8.3 image with Apache
FROM php:8.3-apache

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        bcmath \
        gd \
        pdo_mysql \
        zip

# Enable recommended Apache modules (optional but common)
RUN a2enmod rewrite

# Copy app source code into container
COPY app/revptc/ /var/www/html/

# Create the necessary directories if they don't exist
RUN mkdir -p /var/www/html/core/bootstrap/cache/ && \
    mkdir -p /var/www/html/core/storage/ && \
    mkdir -p /var/www/html/core/storage/app/ && \
    mkdir -p /var/www/html/core/storage/framework/ && \
    mkdir -p /var/www/html/core/storage/logs/

# Set required folder permissions
RUN chmod -R 0775 /var/www/html/core/bootstrap/cache/ && \
    chmod -R 0775 /var/www/html/core/storage/ && \
    chmod -R 0775 /var/www/html/core/storage/app/ && \
    chmod -R 0775 /var/www/html/core/storage/framework/ && \
    chmod -R 0775 /var/www/html/core/storage/logs/


# Set ownership to Apache user
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 (default for Apache)
EXPOSE 80
