FROM php:5.6-cli

MAINTAINER Stan Angeloff <stanimir@angeloff.name>

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git-core

RUN docker-php-ext-install \
        mbstring

RUN echo 'memory_limit=-1' > "$PHP_INI_DIR"/conf.d/memory_limit.ini && \
    echo 'date.timezone=${PHP_TIMEZONE:-UTC}' > "$PHP_INI_DIR"/conf.d/date_timezone.ini

ENV COMPOSER_VERSION master
ENV COMPOSER_HOME /cache/composer

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
