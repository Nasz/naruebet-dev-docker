FROM php:fpm-alpine
COPY ./src /usr/src/app
WORKDIR /usr/src/app