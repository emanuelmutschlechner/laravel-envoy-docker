FROM composer:latest

RUN apk add --no-cache --virtual .php-extensions php7-pecl-mcrypt libjpeg-turbo-dev libpng-dev freetype-dev libbz2 \
  && pecl install mcrypt-1.0.2 \
  && docker-php-ext-enable mcrypt \
  && docker-php-ext-install -j$(nproc) pdo_mysql \
  && composer global require "laravel/envoy=~1.0"
  
