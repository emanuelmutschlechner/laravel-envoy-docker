FROM composer:latest

RUN apk add --no-cache --virtual .php-extensions libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev \
  && docker-php-ext-install -j$(nproc) mcrypt pdo_mysql \
  && composer global require "laravel/envoy=~1.0"
  
