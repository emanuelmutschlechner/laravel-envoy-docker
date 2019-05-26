FROM composer:latest

RUN apk add --no-cache --virtual .php-extensions libmcrypt-dev libjpeg-turbo-dev libpng-dev freetype-dev libbz2 \
  && echo php --version \
  && runDeps="$( \
    scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
      | tr ',' '\n' \
      | sort -u \
      | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )" \
  && echo $runDeps \
  && docker-php-ext-enable mcrypt \
  && docker-php-ext-install -j$(nproc) mcrypt pdo_mysql \
  && composer global require "laravel/envoy=~1.0"
  
