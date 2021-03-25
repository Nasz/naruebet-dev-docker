FROM php:8-apache

RUN docker-php-ext-install pdo pdo_mysql

EXPOSE 8080
COPY ./src /var/www/html
COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN echo "Listen 8080" >> /etc/apache2/ports.conf && \
    chown -R www-data:www-data /var/www/ && \
    a2enmod rewrite
