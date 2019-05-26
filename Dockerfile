FROM composer:latest

RUN apk add --no-cache --virtual .php-extensions libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev \
  && pecl install mcrypt-1.0.2 \
  && docker-php-ext-enable mcrypt \
  && docker-php-ext-install pdo_mysql zip \
  && apk del .php-extensions \
  && composer global require "laravel/envoy=~1.0"
  
