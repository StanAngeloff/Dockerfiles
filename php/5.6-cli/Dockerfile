FROM php:5.6-cli

MAINTAINER Stan Angeloff <stanimir@angeloff.name>

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git-core \
        libgmp-dev libgmp3-dev \
        libicu-dev \
        zlib1g-dev

# Clean up...
RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h

# See https://github.com/php/php-src/tree/master/ext
RUN docker-php-ext-install \
        gmp \
        intl \
        mbstring \
        zip

RUN echo 'memory_limit=-1' > "$PHP_INI_DIR"/conf.d/memory_limit.ini && \
    echo 'date.timezone=${PHP_TIMEZONE:-UTC}' > "$PHP_INI_DIR"/conf.d/date_timezone.ini

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash && \
    apt-get install -y nodejs

ENV COMPOSER_VERSION master
ENV COMPOSER_HOME /cache/composer
ENV NPM_CONFIG_CACHE /cache/npm

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
