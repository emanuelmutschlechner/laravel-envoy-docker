FROM composer:latest

RUN apk add --no-cache --virtual .php-extensions libmcrypt-dev jpeg-dev libpng-dev freetype-dev libbz2 \
  && docker-php-ext-install -j$(nproc) mcrypt pdo_mysql \
  && composer global require "laravel/envoy=~1.0"
  
