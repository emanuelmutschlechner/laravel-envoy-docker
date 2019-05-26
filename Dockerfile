FROM composer:latest

RUN apk add --no-cache --virtual .php-extensions php7-pecl-mcrypt libjpeg-turbo libpng freetype \
  && apk add --no-cache --virtual .build-deps autoconf libjpeg-turbo-dev libpng-dev freetype-dev \
  && docker-php-ext-configure gd \
    --with-gd \
    --with-jpeg-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-freetype-dir=/usr/include/ \
  && pecl install mcrypt-1.0.2 \
  && docker-php-ext-enable mcrypt \
  && docker-php-ext-install -j$(nproc) pdo_mysql \
  && apk del .build-deps \
  && composer global require "laravel/envoy=~1.0"
  
