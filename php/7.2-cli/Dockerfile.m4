FROM ubuntu:14.04

include(`prerequisites.m4')

ENV COMPOSER_VERSION 1.6.3
ENV NODE_VERSION 8.x

RUN apt-get install -y -qq \
        php7.2-common \
        php7.2-cli \
        php7.2-dev \
        php7.2-bcmath \
        php7.2-curl \
        php7.2-gmp \
        php7.2-intl \
        php7.2-json \
        php7.2-mbstring \
        php7.2-mysql \
        php7.2-readline \
        php7.2-soap \
        php7.2-sqlite \
        php7.2-xml \
        php7.2-zip \
        php-pear && \
                    apt-get install -y -qq --no-install-recommends php7.2-apcu

ENV PHP_CONF_DIR /etc/php/7.2/cli/conf.d

include(`configure.m4')

include(`tools.m4')

include(`cleanup.m4')
