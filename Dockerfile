# OS alpine 3.13
FROM nginx:1.19.8-alpine

# alpine & nginx version
RUN cat /etc/os-release | grep PRETTY_NAME && nginx -v

# build arguments
ARG timezone="Asia/Bangkok"

# packages
RUN apk update && apk add --no-cache \
    bash \
    supervisor \
    tzdata \
    gettext \
    curl \
    && rm -rf /var/cache/apk/*

# timezone
ENV TZ=$timezone \
    COMPOSER_ALLOW_SUPERUSER=1
    
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && date

COPY ./src /var/www/html
FROM php:fpm-alpine